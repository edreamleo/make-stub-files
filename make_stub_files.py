#@+leo-ver=5-thin
#@+node:ekr.20160318141204.1: * @file make_stub_files.py
#!/usr/bin/env python
"""
This script makes a stub (.pyi) file in the output directory for each
source file listed on the command line (wildcard file names are supported).

For full details, see README.md.

This file is in the public domain.

Written by Edward K. Ream.
"""
#@+<< imports >>
#@+node:ekr.20160318141204.2: **  << imports >> (make_stub_files.py)
import argparse
import ast
from collections import OrderedDict
import configparser
import glob
import io
import os
import re
import sys
import textwrap
import time
import unittest
#@-<< imports >>
#@+others
#@+node:ekr.20210805085843.1: ** top-level functions
#@+node:ekr.20160318141204.8: *3* function: dump
def dump(title, s=None):  # pragma: no cover
    if s:
        print('===== %s...\n%s\n' % (title, s.rstrip()))
    else:
        print('===== %s...\n' % title)
#@+node:ekr.20160318141204.9: *3* function: dump_dict
def dump_dict(title, d):  # pragma: no cover
    """Dump a dictionary with a header."""
    dump(title)
    for z in sorted(d):
        print('%30s %s' % (z, d.get(z)))
    print('')

#@+node:ekr.20160318141204.10: *3* function: dump_list
def dump_list(title, aList):  # pragma: no cover
    """Dump a list with a header."""
    dump(title)
    for z in aList:
        print(z)
    print('')
#@+node:ekr.20210805143805.1: *3* function: finalize
def finalize(fn):
    """Finalize and regularize a filename."""
    return os.path.normpath(os.path.abspath(os.path.expanduser(fn)))
#@+node:ekr.20160318141204.4: *3* function: is_known_type
def is_known_type(s):
    """
    Return True if s is nothing but a single known type.
    Recursively test inner types in square brackets.
    """
    return ReduceTypes().is_known_type(s)

#@+node:ekr.20160318141204.11: *3* function: main
def main():  # pragma: no cover
    """
    The driver for the stand-alone version of make-stub-files.
    All options come from the configuration file.
    """
    controller = Controller()
    controller.scan_command_line()
    controller.scan_options()
    for fn in controller.files:
        controller.make_stub_file(fn)
#@+node:ekr.20160318141204.6: *3* function: reduce_types
def reduce_types(aList, name=None, trace=False):
    """
    Return a string containing the reduction of all types in aList.
    The --trace-reduce option sets trace=True.
    If present, name is the function name or class_name.method_name.
    """
    return ReduceTypes(aList, name, trace).reduce_types()

#@+node:ekr.20160318141204.13: *3* function: truncate
def truncate(s, n):
    """Return s truncated to n characters."""
    return s if len(s) <= n else s[: n - 3] + '...'
#@+node:ekr.20160318141204.14: **  class AstFormatter
class AstFormatter:
    """
    A class to recreate source code from an AST.
    
    This does not have to be perfect, but it should be close.
    """
    # pylint: disable=consider-using-enumerate

    #@+others
    #@+node:ekr.20160318141204.15: *3*  f.Entries

    # Entries...
    #@+node:ekr.20160318141204.17: *4* f.format
    def format(self, node):
        """Format the node (or list of nodes) and its descendants."""
        self.level = 0
        val = self.visit(node)
        return val  # val is a string.
    #@+node:ekr.20160318141204.18: *4* f.visit
    def visit(self, node):
        """Return the formatted version of an Ast node, or list of Ast nodes."""
        tag = 'AstFormatter.visit'
        name = node.__class__.__name__
        ### g.trace(name) ###
        if isinstance(node, (list, tuple)):
            return ','.join([self.visit(z) for z in node])  # pragma: no cover (defensive)
        if node is None:
            return 'None'  # pragma: no cover
        method_name = 'do_' + node.__class__.__name__
        method = getattr(self, method_name, None)
        if method:
            s = method(node)
            assert isinstance(s, str), s.__class__.__name__
            return s
        # #13: *Never* ignore missing visitors!
        #      Insert an error comment directly into the output.
        message = f"\n#{tag}: no visitor: do_{name}\n"  # pragma: no cover (defensive)
        print(message, flush=True)  # pragma: no cover (defensive)
        return message  # pragma: no cover (defensive)
    #@+node:ekr.20160318141204.19: *3* f.Contexts

    # Contexts...
    #@+node:ekr.20160318141204.20: *4* f.ClassDef
    # ClassDef(identifier name, expr* bases, keyword* keywords, stmt* body, expr* decorator_list)

    def do_ClassDef(self, node):
        result = []
        name = node.name  # Only a plain string is valid.
        bases = [self.visit(z) for z in node.bases] if node.bases else []
        if getattr(node, 'decorator_list', None):
            for decorator in node.decorator_list:
                result.append(f"@{self.visit(decorator)}\n")  # Bug fix: 2021/08/06.
        if getattr(node, 'keywords', None):
            for keyword in node.keywords:
                bases.append('%s=%s' % (keyword.arg, self.visit(keyword.value)))
        # Fix issue #2: look ahead to see if there are any functions in this class.
        empty = not any(isinstance(z, ast.FunctionDef) for z in node.body)
        tail = ' ...' if empty else ''
        if bases:
            result.append(
                self.indent('class %s(%s):%s\n' % (name, ', '.join(bases), tail)))
        else:
            result.append(self.indent('class %s:%s\n' % (name, tail)))  # Fix #2
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)

    #@+node:ekr.20160318141204.21: *4* f.FunctionDef
    # FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list, expr? returns)

    def do_FunctionDef(self, node):
        """Format a FunctionDef node."""
        result = []
        if node.decorator_list:
            for z in node.decorator_list:
                result.append('@%s\n' % self.visit(z))
        name = node.name  # a string.
        args = self.visit(node.args) if node.args else ''
        if getattr(node, 'returns', None):
            returns = self.visit(node.returns)
            # Bug found by unit test.
            result.append(self.indent('def %s(%s) -> %s:\n' % (name, args, returns)))
        else:
            result.append(self.indent('def %s(%s):\n' % (name, args)))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)

    #@+node:ekr.20160318141204.22: *4* f.Interactive
    def do_Interactive(self, node):  # pragma: no cover (will never be used)
        for z in node.body:
            self.visit(z)

    #@+node:ekr.20160318141204.23: *4* f.Module
    def do_Module(self, node):
        assert 'body' in node._fields
        result = ''.join([self.visit(z) for z in node.body])
        return result  # 'module:\n%s' % (result)

    #@+node:ekr.20160318141204.24: *4* f.Lambda
    def do_Lambda(self, node):
        return self.indent('lambda %s: %s' % (
            self.visit(node.args),
            self.visit(node.body)))
    #@+node:ekr.20160318141204.25: *3* f.Expressions

    # Expressions...

    #@+node:ekr.20160318141204.26: *4* f.Expr
    def do_Expr(self, node):
        """An outer expression: must be indented."""
        return self.indent('%s\n' % self.visit(node.value))
    #@+node:ekr.20160318141204.27: *4* f.Expression
    def do_Expression(self, node):  # pragma: no cover (never used)
        """An expression context"""
        return '%s\n' % self.visit(node.body)

    #@+node:ekr.20160318141204.28: *4* f.GeneratorExp
    def do_GeneratorExp(self, node):
        elt = self.visit(node.elt) or ''
        gens = [self.visit(z) for z in node.generators]
        gens = [z if z else '<**None**>' for z in gens]  # Kludge: probable bug.
        return '<gen %s for %s>' % (elt, ','.join(gens))

    #@+node:ekr.20160318141204.29: *4* f.ctx nodes
    def do_AugLoad(self, node):  # pragma: no cover (defensive)
        return 'AugLoad'

    def do_Del(self, node):  # pragma: no cover (defensive)
        return 'Del'

    def do_Load(self, node):  # pragma: no cover (defensive)
        return 'Load'

    def do_Param(self, node):  # pragma: no cover (defensive)
        return 'Param'

    def do_Store(self, node):  # pragma: no cover (defensive)
        return 'Store'
    #@+node:ekr.20160318141204.30: *3* f.Operands

    # Operands...

    #@+node:ekr.20160318141204.31: *4* f.arguments
    # arguments = (
    #       arg* posonlyargs, arg* args, arg? vararg, arg* kwonlyargs,
    #       expr* kw_defaults, arg? kwarg, expr* defaults
    # )

    def do_arguments(self, node):
        """Format the arguments node."""
        kind = self.kind(node)
        assert kind == 'arguments', kind
        args = [self.visit(z) for z in node.args]
        defaults = [self.visit(z) for z in node.defaults]
        # Assign default values to the last args.
        args2 = []
        # PEP 570: Position-only args.
        posonlyargs = getattr(node, 'posonlyargs', [])
        if posonlyargs:
            for z in posonlyargs:
                args2.append(self.visit(z))
            args2.append('/')
        # Regular args.
        n_plain = len(args) - len(defaults)
        for i in range(len(args)):
            if i < n_plain:
                args2.append(args[i])
            else:
                args2.append('%s=%s' % (args[i], defaults[i - n_plain]))
        # PEP 3102: keyword-only args.
        if node.kwonlyargs:
            assert len(node.kwonlyargs) == len(node.kw_defaults)
            args2.append('*')
            for n, z in enumerate(node.kwonlyargs):
                if node.kw_defaults[n] is None:
                    args2.append(self.visit(z))
                else:
                    args2.append('%s=%s' % (self.visit(z), self.visit(node.kw_defaults[n])))
        # Add the vararg and kwarg expressions.
        vararg = getattr(node, 'vararg', None)
        if vararg:
            args2.append('*' + self.visit(vararg))
        kwarg = getattr(node, 'kwarg', None)
        if kwarg:
            args2.append('**' + self.visit(kwarg))
        return ', '.join(args2)
    #@+node:ekr.20160318141204.32: *4* f.arg
    # 3: arg = (identifier arg, expr? annotation)

    def do_arg(self, node):
        if getattr(node, 'annotation', None):
            return '%s: %s' % (node.arg, self.visit(node.annotation))
        return node.arg
    #@+node:ekr.20160318141204.33: *4* f.Attribute
    # Attribute(expr value, identifier attr, expr_context ctx)

    def do_Attribute(self, node):
        return '%s.%s' % (
            self.visit(node.value),
            node.attr)  # Don't visit node.attr: it is always a string.

    #@+node:ekr.20160318141204.34: *4* f.Bytes
    def do_Bytes(self, node):  # pragma: no cover (obsolete)
        return str(node.s)

    #@+node:ekr.20160318141204.35: *4* f.Call & f.keyword
    # Call(expr func, expr* args, keyword* keywords)

    def do_Call(self, node):
        func = self.visit(node.func)
        args = [self.visit(z) for z in node.args]
        for z in node.keywords:
            # Calls f.do_keyword.
            args.append(self.visit(z))
        return '%s(%s)' % (func, ', '.join(args))
    #@+node:ekr.20160318141204.36: *5* f.keyword
    # keyword = (identifier arg, expr value)

    def do_keyword(self, node):
        """Handle keyword *arg*, not a Python keyword!"""
        # node.arg is a string.
        value = self.visit(node.value)
        return '%s=%s' % (node.arg, value) if node.arg else '**%s' % value

    #@+node:ekr.20210804214511.1: *4* f.Constant
    def do_Constant(self, node):  # #13
        return repr(node.value)
    #@+node:ekr.20160318141204.37: *4* f.comprehension
    def do_comprehension(self, node):
        result = []
        name = self.visit(node.target)  # A name.
        it = self.visit(node.iter)  # An attribute.
        result.append('%s in %s' % (name, it))
        ifs = [self.visit(z) for z in node.ifs]
        if ifs:
            result.append(' if %s' % (''.join(ifs)))
        return ''.join(result)

    #@+node:ekr.20160318141204.38: *4* f.Dict
    def do_Dict(self, node):
        result = []
        keys = [self.visit(z) for z in node.keys]
        values = [self.visit(z) for z in node.values]
        if len(keys) == len(values):
            result.append('{')
            items = []
            for i in range(len(keys)):
                items.append('%s:%s' % (keys[i], values[i]))
            result.append(', '.join(items))
            result.append('}')
        else:  # pragma: no cover (defensive)
            print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
                repr(keys), repr(values)))
        return ''.join(result)
    #@+node:ekr.20160318141204.39: *4* f.Ellipsis
    def do_Ellipsis(self, node):  # pragma: no cover (obsolete)
        return '...'
    #@+node:ekr.20160318141204.40: *4* f.ExtSlice
    def do_ExtSlice(self, node):  # pragma: no cover (deprecated)
        return ':'.join([self.visit(z) for z in node.dims])

    #@+node:ekr.20210806005225.1: *4* f.FormattedValue & JoinedStr
    # FormattedValue(expr value, int? conversion, expr? format_spec)

    def do_FormattedValue(self, node):
        return self.visit(node.value)
        
    def do_JoinedStr(self, node):
        return "%s" % ''.join(self.visit(z) for z in node.values or [])

    #@+node:ekr.20160318141204.42: *4* f.List
    def do_List(self, node):
        # Not used: list context.
        # self.visit(node.ctx)
        elts = [self.visit(z) for z in node.elts]
        elts = [z for z in elts if z]  # Defensive.
        return '[%s]' % ','.join(elts)

    #@+node:ekr.20160318141204.43: *4* f.ListComp
    def do_ListComp(self, node):
        elt = self.visit(node.elt)
        gens = [self.visit(z) for z in node.generators]
        gens = [z if z else '<**None**>' for z in gens]  # Kludge: probable bug.
        return '%s for %s' % (elt, ''.join(gens))

    #@+node:ekr.20160318141204.44: *4* f.Name & NameConstant
    def do_Name(self, node):
        return node.id

    def do_NameConstant(self, node):  # pragma: no cover (obsolete)
        s = repr(node.value)
        return 'bool' if s in ('True', 'False') else s

    #@+node:ekr.20160318141204.45: *4* f.Num
    def do_Num(self, node):  # pragma: no cover (obsolete)
        return repr(node.n)

    #@+node:ekr.20160318141204.47: *4* f.Slice
    def do_Slice(self, node):
        lower, upper, step = '', '', ''
        if getattr(node, 'lower', None) is not None:
            lower = self.visit(node.lower)
        if getattr(node, 'upper', None) is not None:
            upper = self.visit(node.upper)
        if getattr(node, 'step', None) is not None:
            step = self.visit(node.step)
            return '%s:%s:%s' % (lower, upper, step)
        return '%s:%s' % (lower, upper)

    #@+node:ekr.20160318141204.48: *4* f.Str
    def do_Str(self, node):  # pragma: no cover (obsolete)
        """This represents a string constant."""
        return repr(node.s)

    #@+node:ekr.20160318141204.49: *4* f.Subscript
    # Subscript(expr value, slice slice, expr_context ctx)

    in_subscript = False

    def do_Subscript(self, node):
        
        # A hack, for do_Tuple.
        old_in_subscript = self.in_subscript
        try:
            self.in_subscript = True
            value = self.visit(node.value)
            the_slice = self.visit(node.slice)
        finally:
            self.in_subscript = old_in_subscript
        return '%s[%s]' % (value, the_slice)

    #@+node:ekr.20160318141204.50: *4* f.Tuple
    def do_Tuple(self, node):
        elts_s = ', '.join(self.visit(z) for z in node.elts)
        return elts_s if self.in_subscript else '(%s)' % elts_s
    #@+node:ekr.20160318141204.51: *3* f.Operators

    # Operators...

    #@+node:ekr.20160318141204.52: *4* f.BinOp
    def do_BinOp(self, node):
        return '%s%s%s' % (
            self.visit(node.left),
            self.op_name(node.op),
            self.visit(node.right))

    #@+node:ekr.20160318141204.53: *4* f.BoolOp
    def do_BoolOp(self, node):
        op_name = self.op_name(node.op)
        values = [self.visit(z) for z in node.values]
        return op_name.join(values)

    #@+node:ekr.20160318141204.54: *4* f.Compare
    def do_Compare(self, node):
        result = []
        lt = self.visit(node.left)
        ops = [self.op_name(z) for z in node.ops]
        comps = [self.visit(z) for z in node.comparators]
        result.append(lt)
        if len(ops) == len(comps):
            for i in range(len(ops)):
                result.append('%s%s' % (ops[i], comps[i]))
        else:  # pragma: no cover (defensive)
            print('can not happen: ops', repr(ops), 'comparators', repr(comps))
        return ''.join(result)

    #@+node:ekr.20160318141204.55: *4* f.UnaryOp
    def do_UnaryOp(self, node):
        return '%s%s' % (
            self.op_name(node.op),
            self.visit(node.operand))

    #@+node:ekr.20160318141204.56: *4* f.ifExp (ternary operator)
    def do_IfExp(self, node):
        return '%s if %s else %s ' % (
            self.visit(node.body),
            self.visit(node.test),
            self.visit(node.orelse))
    #@+node:ekr.20160318141204.57: *3* f.Statements

    # Statements...

    #@+node:ekr.20160318141204.58: *4* f.Assert
    def do_Assert(self, node):
        test = self.visit(node.test)
        if getattr(node, 'msg', None):
            message = self.visit(node.msg)
            return self.indent('assert %s, %s' % (test, message))
        return self.indent('assert %s' % test)

    #@+node:ekr.20160318141204.59: *4* f.Assign
    def do_Assign(self, node):
        return self.indent('%s = %s\n' % (
            '='.join([self.visit(z) for z in node.targets]),
            self.visit(node.value)))

    #@+node:ekr.20160318141204.60: *4* f.AugAssign
    def do_AugAssign(self, node):
        return self.indent('%s%s=%s\n' % (
            self.visit(node.target),
            self.op_name(node.op),  # Bug fix: 2013/03/08.
            self.visit(node.value)))

    #@+node:ekr.20160318141204.61: *4* f.Break
    def do_Break(self, node):
        return self.indent('break\n')

    #@+node:ekr.20160318141204.62: *4* f.Continue
    def do_Continue(self, node):
        return self.indent('continue\n')

    #@+node:ekr.20160318141204.63: *4* f.Delete
    def do_Delete(self, node):
        targets = [self.visit(z) for z in node.targets]
        return self.indent('del %s\n' % ','.join(targets))

    #@+node:ekr.20160318141204.64: *4* f.ExceptHandler
    def do_ExceptHandler(self, node):
        result = []
        result.append(self.indent('except'))
        if getattr(node, 'type', None):
            result.append(' %s' % self.visit(node.type))
        if getattr(node, 'name', None):
            result.append(' as %s' % node.name)
        result.append(':\n')
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)
    #@+node:ekr.20160318141204.66: *4* f.For
    def do_For(self, node):
        result = []
        result.append(self.indent('for %s in %s:\n' % (
            self.visit(node.target),
            self.visit(node.iter))))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        if node.orelse:
            result.append(self.indent('else:\n'))
            for z in node.orelse:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        return ''.join(result)

    #@+node:ekr.20160318141204.67: *4* f.Global
    def do_Global(self, node):
        return self.indent('global %s\n' % (
            ','.join(node.names)))

    #@+node:ekr.20160318141204.68: *4* f.If
    def do_If(self, node):
        result = []
        result.append(self.indent('if %s:\n' % (
            self.visit(node.test))))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        if node.orelse:
            result.append(self.indent('else:\n'))
            for z in node.orelse:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        return ''.join(result)

    #@+node:ekr.20160318141204.69: *4* f.Import & helper
    def do_Import(self, node):
        names = []
        for fn, asname in self.get_import_names(node):
            if asname:
                names.append('%s as %s' % (fn, asname))
            else:
                names.append(fn)
        return self.indent('import %s\n' % (','.join(names)))

    #@+node:ekr.20160318141204.70: *5* f.get_import_names
    def get_import_names(self, node):
        """Return a list of the the full file names in the import statement."""
        result = []
        for ast2 in node.names:
            if self.kind(ast2) == 'alias':
                data = ast2.name, ast2.asname
                result.append(data)
            else:  # pragma: no cover (defensive)
                print('unsupported kind in Import.names list', self.kind(ast2))
        return result

    #@+node:ekr.20160318141204.71: *4* f.ImportFrom
    def do_ImportFrom(self, node):
        names = []
        for fn, asname in self.get_import_names(node):
            if asname:
                names.append('%s as %s' % (fn, asname))
            else:
                names.append(fn)
        return self.indent('from %s import %s\n' % (
            node.module,
            ','.join(names)))
    #@+node:ekr.20160318141204.72: *4* f.Nonlocal
    # Nonlocal(identifier* names)

    def do_Nonlocal(self, node):
        return self.indent('nonlocal %s\n' % ', '.join(node.names))
    #@+node:ekr.20160318141204.73: *4* f.Pass
    def do_Pass(self, node):
        return self.indent('pass\n')

    #@+node:ekr.20160318141204.75: *4* f.Raise
    def do_Raise(self, node):
        args = []
        for attr in ('exc', 'cause'):
            if getattr(node, attr, None) is not None:
                args.append(self.visit(getattr(node, attr)))
        args_s = f" {', '.join(args)}" if args else ''
        return self.indent('raise%s\n' % args_s)


    #@+node:ekr.20160318141204.76: *4* f.Return
    def do_Return(self, node):
        if node.value:
            return self.indent('return %s\n' % (
                self.visit(node.value).strip()))
        return self.indent('return\n')

    #@+node:ekr.20160318141204.77: *4* f.Starred
    # Starred(expr value, expr_context ctx)

    def do_Starred(self, node):
        return '*' + self.visit(node.value)
    #@+node:ekr.20160318141204.79: *4* f.Try
    # Try(stmt* body, excepthandler* handlers, stmt* orelse, stmt* finalbody)

    def do_Try(self, node):  # Python 3

        result = []
        result.append(self.indent('try:\n'))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        if node.handlers:
            for z in node.handlers:
                result.append(self.visit(z))
        if node.orelse:
            result.append(self.indent('else:\n'))
            for z in node.orelse:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        if node.finalbody:
            result.append(self.indent('finally:\n'))
            for z in node.finalbody:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        return ''.join(result)
    #@+node:ekr.20160318141204.82: *4* f.While
    def do_While(self, node):
        result = []
        result.append(self.indent('while %s:\n' % self.visit(node.test)))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        if node.orelse:
            result.append('else:\n')
            for z in node.orelse:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        return ''.join(result)

    #@+node:ekr.20160318141204.83: *4* f.With
    # With(withitem* items, stmt* body)

    def do_With(self, node):
        result = []
        result.append(self.indent('with '))
        vars_list = []
        if getattr(node, 'items', None):
            for item in node.items:
                result.append(self.visit(item.context_expr))
                result.append(' as ')
                if getattr(item, 'optional_vars', None):
                    try:
                        for z in item.optional_vars: # pragma: no cover (expect TypeError)
                            vars_list.append(self.visit(z))
                    except TypeError:
                        vars_list.append(self.visit(item.optional_vars))
                    
        result.append(','.join(vars_list))
        result.append(':\n')
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)
    #@+node:ekr.20160318141204.84: *4* f.Yield
    def do_Yield(self, node):
        # do_Expr has already indented this *expression*.
        if getattr(node, 'value', None):
            return 'yield %s' % self.visit(node.value)
        return 'yield'
    #@+node:ekr.20160318141204.85: *4* f.YieldFrom
    # YieldFrom(expr value)

    def do_YieldFrom(self, node):
        # do_Expr has already indented this *expression*.
        return 'yield from %s' % self.visit(node.value)
    #@+node:ekr.20160318141204.86: *3* f.Utils

    # Utils...

    #@+node:ekr.20160318141204.87: *4* f.kind
    def kind(self, node):
        """Return the name of node's class."""
        return node.__class__.__name__
    #@+node:ekr.20160318141204.88: *4* f.indent
    def indent(self, s):
        return '%s%s' % (' ' * 4 * self.level, s)
    #@+node:ekr.20160318141204.89: *4* f.op_name
    #@@nobeautify

    def op_name(self, node, strict=True):
        """Return the print name of an operator node."""
        d = {
            # Binary operators.
            'Add': '+',
            'BitAnd': '&',
            'BitOr': '|',
            'BitXor': '^',
            'Div': '/',
            'FloorDiv': '//',
            'LShift': '<<',
            'Mod': '%',
            'Mult': '*',
            'Pow': '**',
            'RShift': '>>',
            'Sub': '-',
            # Boolean operators.
            'And': ' and ',
            'Or': ' or ',
            # Comparison operators
            'Eq': '==',
            'Gt': '>',
            'GtE': '>=',
            'In': ' in ',
            'Is': ' is ',
            'IsNot': ' is not ',
            'Lt': '<',
            'LtE': '<=',
            'NotEq': '!=',
            'NotIn': ' not in ',
            # Context operators.
            'AugLoad': '<AugLoad>',
            'AugStore': '<AugStore>',
            'Del': '<Del>',
            'Load': '<Load>',
            'Param': '<Param>',
            'Store': '<Store>',
            # Unary operators.
            'Invert': '~',
            'Not': ' not ',
            'UAdd': '+',
            'USub': '-',
        }
        name = d.get(self.kind(node), '<%s>' % node.__class__.__name__)
        if strict: assert name, self.kind(node)
        return name
    #@-others
#@+node:ekr.20160318141204.90: ** class AstArgFormatter (AstFormatter)
class AstArgFormatter(AstFormatter):
    """
    Just like the AstFormatter class, except it prints the class
    names of constants instead of actual values.
    """
    #@+others
    #@+node:ekr.20160318141204.91: *3* arg_formatter.Constants & Name
    # Return generic markers to allow better pattern matches.

    def do_Constant(self, node):
        return 'None' if node.value is None else node.value.__class__.__name__

    def do_BoolOp(self, node):  # pragma: no cover (obsolete)
        return 'bool'

    def do_Bytes(self, node):  # pragma: no cover (obsolete)
        return 'bytes'

    def do_Name(self, node):  # pragma: no cover (obsolete)
        return 'bool' if node.id in ('True', 'False') else node.id

    def do_Num(self, node):  # pragma: no cover (obsolete)
        return 'number'

    def do_Str(self, node):  # pragma: no cover (obsolete)
        """This represents a string constant."""
        return 'str'
    #@-others
#@+node:ekr.20160318141204.125: ** class Controller
class Controller:
    """
    Make Python stub (.pyi) files in the ~/stubs directory for every file
    in the [Source Files] section of the configuration file.
    """
    #@+others
    #@+node:ekr.20160318141204.126: *3* msf.ctor
    def __init__(self):
        """Ctor for Controller class."""
        self.options = {}
        # Ivars set on the command line...
        self.config_fn = None
        self.enable_coverage_tests = False
        self.enable_unit_tests = False
        self.files = []
        # Ivars set in the config file...
        self.output_fn = None
        self.output_directory = None
        self.overwrite = False
        self.prefix_lines = []
        self.silent = False
        self.trace_matches = False
        self.trace_patterns = False
        self.trace_reduce = False
        self.trace_visitors = False
        self.update_flag = False
        self.verbose = False  # Trace config arguments.
        self.warn = False
        # Pattern lists, set by config sections...
        self.section_names = ('Global', 'Def Name Patterns', 'General Patterns')
        self.def_patterns = []  # [Def Name Patterns]
        self.general_patterns = []  # [General Patterns]
        self.names_dict = {}
        self.op_name_dict = self.make_op_name_dict()
        self.patterns_dict = {}
        self.regex_patterns = []
    #@+node:ekr.20160318141204.128: *3* msf.make_stub_file
    directory_warning_given = False

    def make_stub_file(self, fn):  # pragma: no cover
        """
        Make a stub file in ~/stubs for all source files mentioned in the
        [Source Files] section of the configuration file.
        """
        global g_input_file_name
        extension = fn[fn.rfind('.'):]
        if not extension == '.py' and not (self.force_pyx and extension == '.pyx'):  
            print('not a python file', fn)
            return
        #
        # Read the input file.
        if not os.path.exists(fn):
            print('not found', fn)
            return
        # Set g_input_file_name for error messages.
        g_input_file_name = g.shortFileName(fn)
        try:
            with open(fn, 'r') as f:
                s = f.read()
        except UnicodeDecodeError:
            # Try utf-8 encoding.
            with open(fn, 'r', encoding='utf-8') as f:
                s = f.read()
        #
        # Compute the output file name.
        if self.output_directory:
            if not os.path.exists(self.output_directory):
                if not self.directory_warning_given:
                    self.directory_warning_given = True
                    print('output directory not found:', repr(self.output_directory))
                return
            base_fn = os.path.basename(fn)
            out_fn = os.path.join(self.output_directory, base_fn)
            out_fn = out_fn[:-len(extension)] + '.pyi'
        else:
            out_fn = fn[:-len(extension)] + '.pyi'
        self.output_fn = os.path.normpath(out_fn)
        #
        # Process s.
        node = ast.parse(s, filename=fn, mode='exec')
        StubTraverser(controller=self).run(node)
    #@+node:ekr.20160318141204.131: *3* msf.scan_command_line
    def scan_command_line(self):  # pragma: no cover
        """Set ivars from command-line arguments."""
        # The parser implements the --help option.
        description = 'Create stub (.pyi) files using patterns, not type inference.'
        usage = 'make_stub_files.py [options] file1, file2, ...'
        parser = argparse.ArgumentParser(description=description, usage=usage)
        add = parser.add_argument
        add('files', metavar='FILE', type=str, nargs='+',
            help='input files')
        add('-c', '--config', dest='fn', metavar='FILE',
            help='full path to configuration file')
        add('-d', '--dir', dest='dir',
            help='full path to the output directory')
        add('-f', '--force-pyx', action='store_true', default=False,
            help='force the parsing of .pyx files')
        add('-o', '--overwrite', action='store_true', default=False,
            help='overwrite existing stub (.pyi) files')
        add('-s', '--silent', action='store_true', default=False,
            help='run without messages')
        add('--trace-matches', action='store_true', default=False,
            help='trace Pattern.matches')
        add('--trace-patterns', action='store_true', default=False,
            help='trace pattern creation')
        add('--trace-reduce', action='store_true', default=False,
            help='trace st.reduce_types')
        add('--trace-visitors', action='store_true', default=False,
            help='trace visitor methods')
        add('-u', '--update', action='store_true', default=False,
            help='update stubs in existing stub file')
        add('-v', '--verbose', action='store_true', default=False,
            help='verbose output in .pyi file')
        add('-w', '--warn', action='store_true', default=False,
            help='warn about unannotated args')
        # Parse.
        args = parser.parse_args()
        # Handle the args...
        self.overwrite = args.overwrite
        self.silent = args.silent
        self.trace_matches = args.trace_matches
        self.trace_patterns = args.trace_patterns
        self.trace_reduce = args.trace_reduce
        self.trace_visitors = args.trace_visitors
        self.update_flag = args.update
        self.verbose = args.verbose
        self.warn = args.warn
        self.force_pyx = args.force_pyx
        if args.fn:
            self.config_fn = args.fn
        if args.dir:
            dir_ = args.dir and args.dir.strip()
            dir_ = finalize(dir_)
            g.trace('dir', dir_)
            if os.path.exists(dir_):
                self.output_directory = dir_
            else:
                print('--dir: directory does not exist: %s' % dir_)
                print('exiting')
                sys.exit(1)
        if args.force_pyx:
            print('--force-pyx: .pyx files will be parsed as regular python, cython syntax is not supported')
        self.files = args.files
    #@+node:ekr.20160318141204.132: *3* msf.scan_options & helpers
    def scan_options(self):  # pragma: no cover
        """Set all configuration-related ivars."""
        if self.verbose:
            print('')
            print(f"configuration file: {self.config_fn}")
        if not self.config_fn:
            return
        self.parser = parser = self.create_parser()
        s = self.get_config_string()
        self.init_parser(s)
        if self.files:
            files_source = 'command-line'
            files = self.files
            if isinstance(files, str):
                files = [files]
        elif parser.has_section('Global'):
            files_source = 'config file'
            files = parser.get('Global', 'files')
            files = [z.strip() for z in files.split('\n') if z.strip()]
        else:
            return
        if self.verbose:
            print(f"Files (from {files_source})...")
        files2 = []
        not_found = []
        for z in files:
            # Warn if z does not exist.
            files3 = glob.glob(finalize(z))
            if files3:
                if self.verbose:
                    for z in files3:
                        print(f"  {z}")
                files2.extend(files3)
            else:
                not_found.append(z)
        if not_found:
            print('Not found...')
            for z in not_found:
                print(f"  {z}")
        self.files = files2
        if 'output_directory' in parser.options('Global'):
            s = parser.get('Global', 'output_directory').strip()
            output_dir = finalize(s)
            if os.path.exists(output_dir):
                self.output_directory = output_dir
                if self.verbose:
                    print(f"output directory: {output_dir}")
            else:
                print(f"output directory not found: {output_dir}")
                self.output_directory = None  # inhibit run().
        if 'prefix_lines' in parser.options('Global'):
            prefix = parser.get('Global', 'prefix_lines')
            prefix_lines = prefix.split('\n')
                # The parser does not preserve leading whitespace.
            self.prefix_lines = [z for z in prefix_lines if z.strip()]
            # Annoying
                # if self.verbose:
                    # print('Prefix lines...\n')
                    # for z in self.prefix_lines:
                        # print('  %s' % z)
                    # print('')
        if self.verbose:
            print('')
        self.def_patterns = self.scan_patterns('Def Name Patterns')
        self.general_patterns = self.scan_patterns('General Patterns')
        self.make_patterns_dict()
    #@+node:ekr.20160318141204.133: *4* msf.make_op_name_dict
    def make_op_name_dict(self):
        """
        Make a dict whose keys are operators ('+', '+=', etc),
        and whose values are lists of values of ast.Node.__class__.__name__.
        """
        d = {
            '.': ['Attr',],
            '(*)': ['Call', 'Tuple',],
            '[*]': ['List', 'Subscript',],
            '{*}': ['???',],
            # 'and': 'BoolOp',
            # 'or':  'BoolOp',
        }
        for op in (
            '+', '-', '*', '/', '%', '**', '<<',
            '>>', '|', '^', '&', '//',
        ):
            d[op] = ['BinOp',]
        for op in (
            '==', '!=', '<', '<=', '>', '>=',
            'is', 'is not', 'in', 'not in',
        ):
            d[op] = ['Compare',]
        return d
    #@+node:ekr.20160318141204.134: *4* msf.create_parser
    def create_parser(self):  # pragma: no cover
        """Create a RawConfigParser and return it."""
        parser = configparser.RawConfigParser(dict_type=OrderedDict)
        parser.optionxform = str
        return parser
    #@+node:ekr.20160318141204.135: *4* msf.find_pattern_ops
    def find_pattern_ops(self, pattern):  ###
        """Return a list of operators in pattern.find_s."""
        trace = False or self.trace_patterns
        if pattern.is_regex():  ###
            # Add the pattern to the regex patterns list.
            g.trace(pattern)
            self.regex_patterns.append(pattern)
            return []
        d = self.op_name_dict
        keys1, keys2, keys3, keys9 = [], [], [], []
        for op in d:
            aList = d.get(op)
            if op.replace(' ', '').isalnum():
                # an alpha op, like 'not, 'not in', etc.
                keys9.append(op)
            elif len(op) == 3:
                keys3.append(op)
            elif len(op) == 2:
                keys2.append(op)
            elif len(op) == 1:
                keys1.append(op)
            else:
                g.trace('bad op', op)  # pragma: no cover
        ops = []
        s = s1 = pattern.find_s
        for aList in (keys3, keys2, keys1):
            for op in aList:
                # Must match word here!
                if s.find(op) > -1:
                    s = s.replace(op, '')
                    ops.append(op)
        # Handle the keys9 list very carefully.
        for op in keys9:
            target = ' %s ' % op
            if target in s:
                ops.append(op)  ###
                break  # Only one match allowed.
        if trace and ops: g.trace(s1, ops)
        return ops
    #@+node:ekr.20160318141204.136: *4* msf.get_config_string
    def get_config_string(self):  # pragma: no cover
        """Read the configuration file."""
        fn = finalize(self.config_fn)
        if os.path.exists(fn):
            with open(fn, 'r') as f:
                return f.read()
        print(f"\nconfiguration file not found: {fn}")
        return ''

    #@+node:ekr.20160318141204.137: *4* msf.init_parser
    def init_parser(self, s):  # pragma: no cover
        """Add double back-slashes to all patterns starting with '['."""
        if not s:
            return
        aList = []
        for s in s.split('\n'):
            if self.is_section_name(s):
                aList.append(s)
            elif s.strip().startswith('['):
                aList.append(r'\\' + s[1:])
            else:
                aList.append(s)
        s = '\n'.join(aList) + '\n'
        file_object = io.StringIO(s)
        self.parser.read_file(file_object)
    #@+node:ekr.20160318141204.138: *4* msf.is_section_name
    def is_section_name(self, s):  ###

        def munge(s):
            return s.strip().lower().replace(' ', '')

        s = s.strip()
        if s.startswith('[') and s.endswith(']'):
            s = munge(s[1:-1])
            for s2 in self.section_names:
                if s == munge(s2):
                    return True
        return False
    #@+node:ekr.20160318141204.139: *4* msf.make_patterns_dict
    def make_patterns_dict(self):  ###
        """Assign all patterns to the appropriate ast.Node."""
        for pattern in self.general_patterns:
            ops = self.find_pattern_ops(pattern)
            if ops:
                for op in ops:
                    # Add the pattern to op's list.
                    op_names = self.op_name_dict.get(op)
                    for op_name in op_names:
                        aList = self.patterns_dict.get(op_name, [])
                        aList.append(pattern)
                        self.patterns_dict[op_name] = aList
            else:
                # Enter the name in self.names_dict.
                name = pattern.find_s
                # Special case for 'number'
                if name == 'number':  ###
                    aList = self.patterns_dict.get('Num', [])
                    aList.append(pattern)
                    self.patterns_dict['Num'] = aList
                elif name in self.names_dict:
                    g.trace('duplicate pattern', pattern)  # pragma: no cover (user error)
                else:
                    self.names_dict[name] = pattern.repl_s
        if 0:
            g.trace('names_dict...')
            for z in sorted(self.names_dict):
                print('  %s: %s' % (z, self.names_dict.get(z)))
        if 0:
            g.trace('patterns_dict...')
            for z in sorted(self.patterns_dict):
                aList = self.patterns_dict.get(z)
                print(z)
                for pattern in sorted(aList):
                    print('  ' + repr(pattern))
        # Note: retain self.general_patterns for use in argument lists.
    #@+node:ekr.20160318141204.140: *4* msf.scan_patterns
    def scan_patterns(self, section_name):  ###
        """Parse the config section into a list of patterns, preserving order."""
        trace = False or self.trace_patterns
        parser = self.parser
        aList = []
        if parser.has_section(section_name):
            seen = set()
            for key in parser.options(section_name):
                value = parser.get(section_name, key)
                # A kludge: strip leading \\ from patterns.
                if key.startswith(r'\\'):
                    key = '[' + key[2:]  ###
                if key in seen:
                    g.trace('duplicate key', key)  # pragma: no cover (user error)
                else:
                    seen.add(key)
                    aList.append(Pattern(key, value))
            if trace:  # pragma: no cover
                g.trace('%s...\n' % section_name)
                for z in aList:
                    print(z)
                print('')
        return aList
    #@-others
#@+node:ekr.20160318141204.92: ** class LeoGlobals
class LeoGlobals:  # pragma: no cover
    """A class supporting g.pdb and g.trace for compatibility with Leo."""
    #@+others
    #@+node:ekr.20160318141204.94: *3* g._callerName
    def _callerName(self, n=1, files=False):
        # print('_callerName: %s %s' % (n,files))
        try:  # get the function name from the call stack.
            f1 = sys._getframe(n)  # The stack frame, n levels up.
            code1 = f1.f_code  # The code object
            name = code1.co_name
            if name == '__init__':
                name = '__init__(%s,line %s)' % (
                    self.shortFileName(code1.co_filename), code1.co_firstlineno)
            if files:
                return '%s:%s' % (self.shortFileName(code1.co_filename), name)
            return name  # The code name
        except ValueError:
            # print('g._callerName: ValueError',n)
            return ''  # The stack is not deep enough.
        except Exception:
            # es_exception()
            return ''  # "<no caller name>"
    #@+node:ekr.20180902035806.1: *3* g.caller
    def caller(self, i=1):
        """Return the caller name i levels up the stack."""
        return self.callers(i + 1).split(',')[0]
    #@+node:ekr.20160318141204.95: *3* g.callers
    def callers(self, n=4, count=0, excludeCaller=True, files=False):
        """Return a list containing the callers of the function that called g.callerList.

        If the excludeCaller keyword is True (the default), g.callers is not on the list.

        If the files keyword argument is True, filenames are included in the list.
        """
        # sys._getframe throws ValueError in both cpython and jython if there are less than i entries.
        # The jython stack often has less than 8 entries,
        # so we must be careful to call g._callerName with smaller values of i first.
        result = []
        i = 3 if excludeCaller else 2
        while 1:
            s = self._callerName(i, files=files)
            # print(i,s)
            if s:
                result.append(s)
            if not s or len(result) >= n: break
            i += 1
        result.reverse()
        if count > 0: result = result[:count]
        sep = '\n' if files else ','
        return sep.join(result)
    #@+node:ekr.20160318141204.96: *3* g.cls
    def cls(self):
        """Clear the screen."""
        if sys.platform.lower().startswith('win'):
            os.system('cls')
    #@+node:ekr.20180902034437.1: *3* g.objToSTring & helpers
    def objToString(self, obj, indent='', printCaller=False, tag=None):
        """Pretty print any Python object to a string."""
        # pylint: disable=undefined-loop-variable
            # Looks like a a pylint bug.
        #
        # Compute s.
        if isinstance(obj, dict):
            s = self.dictToString(obj, indent=indent)
        elif isinstance(obj, list):
            s = self.listToString(obj, indent=indent)
        elif isinstance(obj, tuple):
            s = self.tupleToString(obj, indent=indent)
        elif isinstance(obj, str):
            # Print multi-line strings as lists.
            s = obj
            lines = g.splitLines(s)
            if len(lines) > 1:
                s = self.objToString(lines, indent=indent)
            else:
                s = repr(s)
        else:
            s = repr(obj)
        #
        # Compute the return value.
        if printCaller and tag:
            prefix = '%s: %s' % (g.caller(), tag)
        elif printCaller or tag:
            prefix = self.caller() if printCaller else tag
        else:
            prefix = None
        return '%s...\n%s\n' % (prefix, s) if prefix else s

    toString = objToString
    #@+node:ekr.20180902041247.1: *4* g.dictToString
    def dictToString(self, d, indent='', tag=None):
        """Pretty print a Python dict to a string."""
        # pylint: disable=unnecessary-lambda
        if not d:
            return '{}'
        result = ['{\n']
        indent2 = indent + ' ' * 4
        n = 2 + len(indent) + max([len(repr(z)) for z in d.keys()])
        for i, key in enumerate(sorted(d, key=lambda z: repr(z))):
            pad = ' ' * max(0, (n - len(repr(key))))
            result.append('%s%s:' % (pad, key))
            result.append(self.objToString(d.get(key), indent=indent2))
            if i + 1 < len(d.keys()):
                result.append(',')
            result.append('\n')
        result.append(indent + '}')
        s = ''.join(result)
        return '%s...\n%s\n' % (tag, s) if tag else s
    #@+node:ekr.20180902041311.1: *4* g.listToString
    def listToString(self, obj, indent='', tag=None):
        """Pretty print a Python list to a string."""
        if not obj:
            return '[]'
        result = ['[']
        indent2 = indent + ' ' * 4
        for i, obj2 in enumerate(obj):
            if len(obj) > 1:
                result.append('\n' + indent2)
            result.append(self.objToString(obj2, indent=indent2))
            if i + 1 < len(obj) > 1:
                result.append(',')
            elif len(obj) > 1:
                result.append('\n' + indent)
        result.append(']')
        s = ''.join(result)
        return '%s...\n%s\n' % (tag, s) if tag else s
    #@+node:ekr.20180902041320.1: *4* g.tupleToString
    def tupleToString(self, obj, indent='', tag=None):
        """Pretty print a Python tuple to a string."""
        if not obj:
            return '(),'
        result = ['(']
        indent2 = indent + ' ' * 4
        for i, obj2 in enumerate(obj):
            if len(obj) > 1:
                result.append('\n' + indent2)
            result.append(self.objToString(obj2, indent=indent2))
            if len(obj) == 1 or i + 1 < len(obj):
                result.append(',')
            elif len(obj) > 1:
                result.append('\n' + indent)
        result.append(')')
        s = ''.join(result)
        return '%s...\n%s\n' % (tag, s) if tag else s
    #@+node:ekr.20160318141204.98: *3* g.pdb
    def pdb(self):
        try:
            import leo.core.leoGlobals as leo_g
            leo_g.pdb()
        except ImportError:
            import pdb
            pdb.set_trace()
    #@+node:ekr.20180902034446.1: *3* g.printObj
    def printObj(self, obj, indent='', printCaller=False, tag=None):
        """Pretty print any Python object using g.pr."""
        print(self.objToString(obj, indent=indent, printCaller=printCaller, tag=tag))

    #@+node:ekr.20160318141204.99: *3* g.shortFileName
    def shortFileName(self, fileName, n=None):
        # pylint: disable=invalid-unary-operand-type
        if n is None or n < 1:
            return os.path.basename(fileName)
        return '/'.join(fileName.replace('\\', '/').split('/')[-n :])
    #@+node:ekr.20160318141204.100: *3* g.splitLines
    def splitLines(self, s):
        """Split s into lines, preserving trailing newlines."""
        return s.splitlines(True) if s else []
    #@+node:ekr.20160318141204.101: *3* g.trace
    def trace(self, *args, **keys):

        # Compute the caller name.
        try:
            f1 = sys._getframe(1)
            code1 = f1.f_code
            name = code1.co_name
        except Exception:
            name = ''
        print('%s: %s' % (name, ' '.join(str(z) for z in args)))

        
    #@-others
#@+node:ekr.20160318141204.102: ** class Pattern
class Pattern:
    """
    A class representing regex or balanced patterns.
    
    Sample matching code, for either kind of pattern:
        
        for m in reversed(pattern.all_matches(s)):
            s = pattern.replace(m, s)
    """
    #@+others
    #@+node:ekr.20160318141204.103: *3* pattern.ctor
    def __init__(self, find_s, repl_s=''):
        """Ctor for the Pattern class."""
        self.find_s = find_s
        self.repl_s = repl_s
        if self.is_regex():
            self.regex = re.compile(find_s)
        elif self.is_balanced():
            self.regex = None
        else:
            # Escape all dangerous characters.
            result = []
            for ch in find_s:
                if ch == '_' or ch.isalnum():
                    result.append(ch)
                else:
                    result.append('\\' + ch)  # pragma: no cover
            self.regex = re.compile(''.join(result))
    #@+node:ekr.20160318141204.104: *3* pattern.__eq__, __ne__, __hash__
    def __eq__(self, obj):
        """Return True if two Patterns are equivalent."""
        if isinstance(obj, Pattern):
            return self.find_s == obj.find_s and self.repl_s == obj.repl_s
        return NotImplemented  # pragma: no cover

    def __ne__(self, obj):
        """Return True if two Patterns are not equivalent."""
        return not self.__eq__(obj)

    def __hash__(self):
        """Pattern.__hash__"""
        return len(self.find_s) + len(self.repl_s)
    #@+node:ekr.20160318141204.105: *3* pattern.str & repr
    def __repr__(self):  # pragma: no cover
        """Pattern.__repr__"""
        return '%s: %s' % (self.find_s, self.repl_s)

    __str__ = __repr__
    #@+node:ekr.20160318141204.106: *3* pattern.is_balanced
    def is_balanced(self):
        """Return True if self.find_s is a balanced pattern."""
        s = self.find_s
        if s.endswith('*'):
            return True
        for pattern in ('(*)', '[*]', '{*}'):
            if s.find(pattern) > -1:
                return True
        return False
    #@+node:ekr.20160318141204.107: *3* pattern.is_regex
    def is_regex(self):
        """
        Return True if self.find_s is a regular pattern.
        For now a kludgy convention suffices.
        """
        return self.find_s.endswith('$')
            # A dollar sign is not valid in any Python expression.
    #@+node:ekr.20160318141204.108: *3* pattern.all_matches & helpers
    def all_matches(self, s):
        """
        Return a list of match objects for all matches in s.
        These are regex match objects or (start, end) for balanced searches.
        """
        if self.is_balanced():
            aList, i = [], 0
            while i < len(s):
                progress = i
                j = self.full_balanced_match(s, i)
                if j is None:
                    i += 1#   pragma: no cover
                else:
                    aList.append((i, j),)
                    i = j
                assert progress < i
            return aList
        return list(self.regex.finditer(s))
    #@+node:ekr.20160318141204.109: *4* pattern.full_balanced_match
    def full_balanced_match(self, s, i):
        """Return the index of the end of the match found at s[i:] or None."""
        pattern = self.find_s
        j = 0  # index into pattern
        while i < len(s) and j < len(pattern) and pattern[j] in ('*', s[i]):
            progress = i
            if pattern[j : j + 3] in ('(*)', '[*]', '{*}'):
                delim = pattern[j]
                i = self.match_balanced(delim, s, i)
                j += 3
            elif j == len(pattern) - 1 and pattern[j] == '*':
                # A trailing * matches the rest of the string.
                j += 1
                i = len(s)
                break
            else:
                i += 1
                j += 1
            assert progress < i
        found = i <= len(s) and j == len(pattern)
        return i if found else None
    #@+node:ekr.20160318141204.110: *4* pattern.match_balanced
    def match_balanced(self, delim, s, i):
        """
        delim == s[i] and delim is in '([{'
        Return the index of the end of the balanced parenthesized string, or len(s)+1.
        """
        global g_input_file_name
        assert s[i] == delim, s[i]
        assert delim in '([{'
        delim2 = ')]}'['([{'.index(delim)]
        assert delim2 in ')]}'
        level = 0
        while i < len(s):
            progress = i
            ch = s[i]
            i += 1
            if ch == delim:
                level += 1
            elif ch == delim2:
                level -= 1
                if level == 0:
                    return i
            assert progress < i
        # Unmatched: a syntax error.
        print('%20s: unmatched %s in %s' % (g_input_file_name, delim, s))  # pragma: no cover
        return len(s) + 1  # pragma: no cover
    #@+node:ekr.20160318141204.111: *3* pattern.match (trace-matches)
    def match(self, s, trace=False):  ###
        """
        Perform the match on the entire string if possible.
        Return (found, new s)
        """
        if self.is_balanced():
            j = self.full_balanced_match(s, 0)
            if j is None:
                return False, s
            start, end = 0, len(s)
            s = self.replace_balanced(s, start, end)
            return True, s
        m = self.regex.match(s)
        if m and m.group(0) == s:
            s = self.replace_regex(m, s)
            return True, s
        return False, s
    #@+node:ekr.20160318141204.112: *3* pattern.match_entire_string
    def match_entire_string(self, s):
        """Return True if s matches self.find_s"""
        if self.is_balanced():
            j = self.full_balanced_match(s, 0)
            return j == len(s)
        m = self.regex.match(s)
        return m and m.group(0) == s
    #@+node:ekr.20160318141204.113: *3* pattern.replace & helpers
    def replace(self, m, s):  ###
        """Perform any kind of replacement."""
        if self.is_balanced():
            start, end = m
            return self.replace_balanced(s, start, end)
        return self.replace_regex(m, s)
    #@+node:ekr.20160318141204.114: *4* pattern.replace_balanced
    def replace_balanced(self, s1, start, end):
        """
        Use m (returned by all_matches) to replace s by the string implied by repr_s.
        Within repr_s, * star matches corresponding * in find_s
        """
        s = s1[start:end]
        f, r = self.find_s, self.repl_s
        i1 = f.find('(*)')
        i2 = f.find('[*]')
        i3 = f.find('{*}')
        if -1 == i1 == i2 == i3:
            return s1[:start] + r + s1[end:]
        j = r.find('*')
        if j == -1:
            return s1[:start] + r + s1[end:]
        i = min([z for z in [i1, i2, i3] if z > -1])
        assert i > -1  # i is an index into f AND s
        delim = f[i]
        assert s[:i] == f[:i], (s[:i], f[:i])
        k = self.match_balanced(delim, s, i)
        s_star = s[i + 1 : k - 1]
        repl = r[:j] + s_star + r[j + 1 :]
        return s1[:start] + repl + s1[end:]
    #@+node:ekr.20160318141204.115: *4* pattern.replace_regex
    def replace_regex(self, m, s):
        """Do the replacement in s specified by m."""
        s = self.repl_s
        for i in range(9):
            group = '\\%s' % i
            if s.find(group) > -1:
                s = s.replace(group, m.group(i))
        return s
    #@-others
#@+node:ekr.20160318141204.116: ** class ReduceTypes
class ReduceTypes:
    """
    A helper class for the top-level reduce_types function.
    
    This class reduces a list of type hints to a string containing the
    reduction of all types in the list.
    """
    #@+others
    #@+node:ekr.20160318141204.117: *3* rt.ctor
    def __init__(self, aList=None, name=None, trace=False):
        """Ctor for ReduceTypes class."""
        self.aList = aList
        self.name = name
        self.optional = False
        self.trace = trace
    #@+node:ekr.20160318141204.118: *3* rt.is_known_type
    def is_known_type(self, s):
        """
        Return True if s is nothing but a single known type.

        It suits the other methods of this class *not* to test inside inner
        brackets. This prevents unwanted Any types.
        """
        s = s.strip()
        table = (
            '', 'None',  # Tricky.
            'complex', 'float', 'int', 'long', 'number',
            'dict', 'list', 'tuple',
            'bool', 'bytes', 'str', 'unicode',
        )
        for s2 in table:
            if s2 == s:
                return True
            if s2 and Pattern(s2 + '(*)', s).match_entire_string(s):  # 2021/08/08
                return True
        if s.startswith('[') and s.endswith(']'):
            inner = s[1:-1]
            return self.is_known_type(inner) if inner else True
        if s.startswith('(') and s.endswith(')'):
            inner = s[1:-1]
            return self.is_known_type(inner) if inner else True
        if s.startswith('{') and s.endswith('}'):
            return True
        table = (
            # Pep 484: https://www.python.org/dev/peps/pep-0484/
            # typing module: https://docs.python.org/3/library/typing.html
            # Test the most common types first.
            'Any', 'Dict', 'List', 'Optional', 'Tuple', 'Union',
            # Not generated by this program, but could arise from patterns.
            'AbstractSet', 'AnyMeta', 'AnyStr',
            'BinaryIO', 'ByteString',
            'Callable', 'CallableMeta', 'Container',
            'Final', 'Generic', 'GenericMeta', 'Hashable',
            'IO', 'ItemsView', 'Iterable', 'Iterator',
            'KT', 'KeysView',
            'Mapping', 'MappingView', 'Match',
            'MutableMapping', 'MutableSequence', 'MutableSet',
            'NamedTuple', 'OptionalMeta',
            # 'POSIX', 'PY2', 'PY3',
            'Pattern', 'Reversible',
            'Sequence', 'Set', 'Sized',
            'SupportsAbs', 'SupportsFloat', 'SupportsInt', 'SupportsRound',
            'T', 'TextIO', 'TupleMeta', 'TypeVar', 'TypingMeta',
            'Undefined', 'UnionMeta',
            'VT', 'ValuesView', 'VarBinding',
        )
        for s2 in table:
            if s2 == s:
                return True
            # Don't look inside bracketss.
            pattern = Pattern(s2 + '[*]', s)
            if pattern.match_entire_string(s):
                return True
        return False
    #@+node:ekr.20160318141204.119: *3* rt.reduce_collection
    def reduce_collection(self, aList, kind):
        """
        Reduce the inner parts of a collection for the given kind.
        Return a list with only collections of the given kind reduced.
        """
        assert isinstance(aList, list)
        assert None not in aList, aList
        pattern = Pattern('%s[*]' % kind)
        others, r1, r2 = [], [], []
        for s in sorted(set(aList)):
            if pattern.match_entire_string(s):
                r1.append(s)
            else:
                others.append(s)
        for s in sorted(set(r1)):
            parts = []
            s2 = s[len(kind) + 1 : -1]
            for s3 in s2.split(','):
                s3 = s3.strip()
                parts.append(s3 if self.is_known_type(s3) else 'Any')
            r2.append('%s[%s]' % (kind, ', '.join(parts)))
        result = others
        result.extend(r2)
        return sorted(set(result))
    #@+node:ekr.20160318141204.120: *3* rt.reduce_numbers
    def reduce_numbers(self, aList):
        """
        Return aList with all number types in aList replaced by the most
        general numeric type in aList.
        """
        found = None
        numbers = ('number', 'complex', 'float', 'long', 'int')
        for kind in numbers:
            for z in aList:
                if z == kind:
                    found = kind
                    break
            if found:
                break
        if found:
            assert found in numbers, found
            aList = [z for z in aList if z not in numbers]
            aList.append(found)
        return aList
    #@+node:ekr.20160318141204.121: *3* rt.reduce_types
    def reduce_types(self):
        """
        self.aList consists of arbitrarily many types because this method is
        called from format_return_expressions.
        
        Return a *string* containing the reduction of all types in this list.
        Returning a string means that all traversers always return strings,
        never lists.
        """
        r = [('None' if z in ('', None) else z) for z in self.aList]
        assert None not in r
        self.optional = 'None' in r
            # self.show adds Optional if this flag is set.
        r = [z for z in r if z != 'None']
        if not r:
            self.optional = False
            return self.show('None')
        r = sorted(set(r))
        assert r
        assert None not in r
        r = self.reduce_numbers(r)
        for kind in ('Dict', 'List', 'Tuple',):
            r = self.reduce_collection(r, kind)
        r = self.reduce_unknowns(r)
        r = sorted(set(r))
        assert r
        assert 'None' not in r
        if len(r) == 1:
            return self.show(r[0])
        return self.show('Union[%s]' % (', '.join(sorted(r))))
    #@+node:ekr.20160318141204.122: *3* rt.reduce_unknowns
    def reduce_unknowns(self, aList):
        """Replace all unknown types in aList with Any."""
        return [z if self.is_known_type(z) else 'Any' for z in aList]
    #@+node:ekr.20160318141204.123: *3* rt.show
    def show(self, s, known=True):  # pragma: no cover.
        """Show the result of reduce_types."""
        aList, name = self.aList, self.name
        trace = self.trace
        s = s.strip()
        if self.optional:
            s = 'Optional[%s]' % s
        if trace and (not known or len(aList) > 1):
            if name:
                if name.find('.') > -1:
                    context = ''.join(name.split('.')[1:])
                else:
                    context = name
            else:
                context = g.callers(3).split(',')[0].strip()
            context = truncate(context, 26)
            known = '' if known else '? '
            pattern = sorted(set([z.replace('\n', ' ') for z in aList]))
            pattern = '[%s]' % truncate(', '.join(pattern), 53 - 2)
            print('reduce_types: %-26s %53s ==> %s%s' % (context, pattern, known, s))
                # widths above match the corresponding indents in match_all and match.
        return s
    #@+node:ekr.20160318141204.124: *3* rt.split_types
    def split_types(self, s):
        """Split types on *outer level* commas."""
        aList, i1, level = [], 0, 0
        for i, ch in enumerate(s):
            if ch == '[':
                level += 1
            elif ch == ']':
                level -= 1
            elif ch == ',' and level == 0:
                aList.append(s[i1:i])
                i1 = i + 1
        aList.append(s[i1:].strip())
        return aList
    #@-others
#@+node:ekr.20160318141204.141: ** class Stub
class Stub:
    """
    A class representing all the generated stub for a class or def.
    stub.full_name should represent the complete context of a def.
    """
    #@+others
    #@+node:ekr.20160318141204.142: *3* stub.ctor
    def __init__(self, kind, name, parent=None, stack=None):
        """Stub ctor. Equality depends only on full_name and kind."""
        self.children = []
        self.full_name = '%s.%s' % ('.'.join(stack), name) if stack else name
        self.kind = kind
        self.name = name
        self.out_list = []
        self.parent = parent
        self.stack = stack  # StubTraverser.context_stack.
        if stack:
            assert stack[-1] == parent.name, (stack[-1], parent.name)
        if parent:
            assert isinstance(parent, Stub)
            parent.children.append(self)
    #@+node:ekr.20160318141204.143: *3* stub.__eq__ and __ne__
    def __eq__(self, obj):
        """
        Stub.__eq__. Return whether two stubs refer to the same method.
        Do *not* test parent links. That would interfere with --update logic.
        """
        if isinstance(obj, Stub):
            return self.full_name == obj.full_name and self.kind == obj.kind
        return NotImplemented  # pragma: no cover

    def __ne__(self, obj):
        """Stub.__ne__"""
        return not self.__eq__(obj)
    #@+node:ekr.20160318141204.144: *3* stub.__hash__
    def __hash__(self):
        """Stub.__hash__. Equality depends *only* on full_name and kind."""
        return len(self.kind) + sum([ord(z) for z in self.full_name])
    #@+node:ekr.20160318141204.145: *3* stub.__repr__and __str__
    def __repr__(self):
        """Stub.__repr__."""
        # return 'Stub: %s %s' % (id(self), self.full_name)
        return 'Stub: %s\n%s' % (self.full_name, g.objToString(self.out_list))

    __str__ = __repr__
    #@+node:ekr.20160318141204.146: *3* stub.parents and level
    def level(self):
        """Return the number of parents."""
        return len(self.parents())

    def parents(self):
        """Return a list of this stub's parents."""
        return self.full_name.split('.')[:-1]
    #@-others
#@+node:ekr.20160318141204.147: ** class StubFormatter (AstFormatter)
class StubFormatter(AstFormatter):
    """
    Formats an ast.Node and its descendants,
    making pattern substitutions in Name and operator nodes.
    """
    #@+others
    #@+node:ekr.20160318141204.148: *3* sf.ctor
    def __init__(self, controller, traverser):
        """Ctor for StubFormatter class."""
        self.controller = x = controller
        self.traverser = traverser
            # 2016/02/07: to give the formatter access to the class_stack.
        self.def_patterns = x.def_patterns
        self.general_patterns = x.general_patterns
        self.names_dict = x.names_dict
        self.patterns_dict = x.patterns_dict
        self.raw_format = AstFormatter().format
        self.regex_patterns = x.regex_patterns
        self.trace_matches = x.trace_matches
        self.trace_patterns = x.trace_patterns
        self.trace_reduce = x.trace_reduce
        self.trace_visitors = x.trace_visitors
        self.verbose = x.verbose
        # mypy workarounds
        self.seen_names = []
    #@+node:ekr.20160318141204.149: *3* sf.match_all
    matched_d = {}

    def match_all(self, node, s, trace=False):  ###
        """Match all the patterns for the given node."""
        trace = trace or self.trace_matches
        # verbose = True
        d = self.matched_d
        name = node.__class__.__name__
        s1 = truncate(s, 40)
        caller = g.callers(2).split(',')[1].strip()
            # The direct caller of match_all.
        patterns = self.patterns_dict.get(name, []) + self.regex_patterns
        for pattern in patterns:
            found, s = pattern.match(s, trace=False)
            if found:
                if trace:  # pragma: no cover
                    aList = d.get(name, [])
                    if pattern not in aList:
                        aList.append(pattern)
                        d[name] = aList
                        print('match_all:    %-12s %26s %40s ==> %s' % (caller, pattern, s1, s))
                break
        return s
    #@+node:ekr.20160318141204.151: *3* sf.trace_visitor
    def trace_visitor(self, node, op, s):  # pragma: no cover
        """Trace node's visitor."""
        if self.trace_visitors:
            caller = g.callers(2).split(',')[1]
            s1 = AstFormatter().format(node).strip()
            print('%12s op %-6s: %s ==> %s' % (caller, op.strip(), s1, s))
    #@+node:ekr.20160318141204.152: *3* sf.Operands
    # StubFormatter visitors for operands...
    #@+node:ekr.20160318141204.153: *4* sf.Attribute
    # Attribute(expr value, identifier attr, expr_context ctx)

    def do_Attribute(self, node):
        """StubFormatter.do_Attribute."""
        s = '%s.%s' % (
            self.visit(node.value),
            node.attr)  # Don't visit node.attr: it is always a string.
        s2 = self.names_dict.get(s)
        return s2 or s
    #@+node:ekr.20160318141204.154: *4* sf.Constants: Constant, Bytes, Num, Str
    # Return generic markers to allow better pattern matches.

    def do_Constant(self, node):
        return 'None' if node.value is None else node.value.__class__.__name__

    def do_Bytes(self, node):  # pragma: no cover (obsolete)
        return 'bytes'

    def do_Num(self, node):  # pragma: no cover (obsolete)
        return 'number'

    def do_Str(self, node):  # pragma: no cover (obsolete)
        """This represents a string constant."""
        return 'str'
    #@+node:ekr.20160318141204.155: *4* sf.Dict
    def do_Dict(self, node):
        keys = [self.visit(z) for z in node.keys]
        values = [self.visit(z) for z in node.values]
        if len(keys) != len(values):  # pragma: no cover (defensive)
            message = (
                f"Error: sf.Dict: len(keys) {len(keys)} != len(values) {len(values)}\n"
                f"keys: {keys!r}, vals: {values!r}")
            print(message)
            return message
        if not keys:
            return 'Dict'
        result = []
        # pylint: disable=consider-using-enumerate
        for i in range(len(keys)):
            result.append('%s:%s' % (keys[i], values[i]))
        return ('Dict[%s]' % ', '.join(result))
    #@+node:ekr.20160318141204.156: *4* sf.List
    def do_List(self, node):
        """StubFormatter.List."""
        elts = [self.visit(z) for z in node.elts]
        elts = [z for z in elts if z]  # Defensive.
        return 'List[%s]' % ', '.join(elts) if elts else 'List'
    #@+node:ekr.20160318141204.157: *4* sf.Name
    # seen_names = [] # t--ype: List[str]

    def do_Name(self, node):
        """StubFormatter ast.Name visitor."""
        d = self.names_dict
        name = d.get(node.id, node.id)
        s = 'bool' if name in ('True', 'False') else name
        if False and node.id not in self.seen_names:  # pragma: no cover 
            self.seen_names.append(node.id)
            if d.get(node.id):
                g.trace(node.id, '==>', d.get(node.id))
            elif node.id == 'aList':
                g.trace('**not found**', node.id)
        return s
    #@+node:ekr.20160318141204.158: *4* sf.Tuple
    def do_Tuple(self, node):
        """StubFormatter.Tuple."""
        elts = [self.visit(z) for z in node.elts]
        return 'Tuple[%s]' % ', '.join(elts)
    #@+node:ekr.20160318141204.159: *3* sf.Operators
    # StubFormatter visitors for operators...
    #@+node:ekr.20160318141204.160: *4* sf.BinOp
    # BinOp(expr left, operator op, expr right)

    def do_BinOp(self, node):
        """StubFormatter.BinOp visitor."""
        trace = self.trace_reduce
        numbers = ['number', 'complex', 'float', 'long', 'int',]
        op = self.op_name(node.op)
        lhs = self.visit(node.left)
        rhs = self.visit(node.right)
        ### ???
        if op.strip() in ('is', 'is not', 'in', 'not in'):  # pragma: no cover (python 2?)
            s = 'bool'
        elif lhs == rhs:  # pragma: no cover (python 2?)
            s = lhs
                # Perhaps not always right,
                # but it is correct for Tuple, List, Dict.
        elif lhs in numbers and rhs in numbers:
            s = reduce_types([lhs, rhs], trace=trace)
                # reduce_numbers would be wrong: it returns a list.
        elif lhs == 'str' and op in '%+*':
            # str + any implies any is a string.
            s = 'str'
        else:
            # Fall back to the base-class behavior.
            s = '%s%s%s' % (
                self.visit(node.left),
                op,
                self.visit(node.right))
        s = self.match_all(node, s)
        self.trace_visitor(node, op, s)
        return s
    #@+node:ekr.20160318141204.161: *4* sf.BoolOp
    # BoolOp(boolop op, expr* values)

    def do_BoolOp(self, node):  # pragma: no cover (obsolete)
        """StubFormatter.BoolOp visitor for 'and' and 'or'."""
        trace = self.trace_reduce
        op = self.op_name(node.op)
        values = [self.visit(z).strip() for z in node.values]
        s = reduce_types(values, trace=trace)
        s = self.match_all(node, s)
        self.trace_visitor(node, op, s)
        return s
    #@+node:ekr.20160318141204.164: *4* sf.Compare
    # Compare(expr left, cmpop* ops, expr* comparators)

    def do_Compare(self, node):
        """
        StubFormatter ast.Compare visitor for these ops:
        '==', '!=', '<', '<=', '>', '>=', 'is', 'is not', 'in', 'not in',
        """
        s = 'bool'  # Correct regardless of arguments.
        ops = ','.join([self.op_name(z) for z in node.ops])
        self.trace_visitor(node, ops, s)
        return s
    #@+node:ekr.20160318141204.165: *4* sf.IfExp
    # If(expr test, stmt* body, stmt* orelse)

    def do_IfExp(self, node):
        """StubFormatterIfExp (ternary operator)."""
        trace = self.trace_reduce
        aList = [
            self.match_all(node, self.visit(node.body)),
            self.match_all(node, self.visit(node.orelse)),
        ]
        s = reduce_types(aList, trace=trace)
        s = self.match_all(node, s)
        self.trace_visitor(node, 'if', s)
        return s
    #@+node:ekr.20160318141204.166: *4* sf.Subscript
    # Subscript(expr value, slice slice, expr_context ctx)

    def do_Subscript(self, node):
        """StubFormatter.Subscript."""
        s = '%s[%s]' % (
            self.visit(node.value),
            self.visit(node.slice))
        s = self.match_all(node, s)
        self.trace_visitor(node, '[]', s)
        return s
    #@+node:ekr.20160318141204.167: *4* sf.UnaryOp
    # UnaryOp(unaryop op, expr operand)

    def do_UnaryOp(self, node):
        """StubFormatter.UnaryOp for unary +, -, ~ and 'not' operators."""
        op = self.op_name(node.op)
        if op.strip() == 'not':
            return 'bool'
        s = op + self.visit(node.operand)  # bug fix: 2021/08/07.
        s = self.match_all(node, s)
        self.trace_visitor(node, op, s)
        return s
    #@+node:ekr.20210807145722.1: *3* sf.Statements
    #@+node:ekr.20160318141204.162: *4* sf.Call & sf.keyword
    # Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

    def do_Call(self, node):
        """StubFormatter.Call visitor."""
        func = self.visit(node.func)
        args = [self.visit(z) for z in node.args]
        for z in node.keywords:
            # Calls *base class* s.do_keyword.
            args.append(self.visit(z))
        args = [z for z in args if z]  # Kludge: Defensive coding.
        # Explicit pattern:
        if func in ('dict', 'list', 'set', 'tuple',):
            if args:
                s = '%s[%s]' % (func.capitalize(), ', '.join(args))
            else:
                s = '%s' % func.capitalize()
        else:
            s = '%s(%s)' % (func, ', '.join(args))
        s = self.match_all(node, s, trace=False)
        self.trace_visitor(node, 'call', s)
        return s
    #@+node:ekr.20160318141204.168: *4* sf.Return
    def do_Return(self, node):
        """
        StubFormatter ast.Return vsitor.
        Return only the return expression itself.
        """
        s = AstFormatter.do_Return(self, node)
        s = s.strip()
        assert s.startswith('return'), repr(s)
        return s[len('return'):].strip()
    #@-others
#@+node:ekr.20160318141204.169: ** class StubTraverser (ast.NodeVisitor)
class StubTraverser(ast.NodeVisitor):
    """
    An ast.Node traverser class that outputs a stub for each class or def.
    Names of visitors must start with visit_. The order of traversal does
    not matter, because so few visitors do anything.
    """
    #@+others
    #@+node:ekr.20160318141204.170: *3* st.ctor
    def __init__(self, controller):
        """Ctor for StubTraverser class."""
        self.controller = x = controller  # A Controller instance.
        # Internal state ivars...
        self.class_name_stack = []
        self.class_defs_count = 0
            # The number of defs seen for this class.
        self.context_stack = []
        sf = StubFormatter(controller=controller, traverser=self)
        self.format = sf.format
        self.arg_format = AstArgFormatter().format
        self.level = 0
        self.output_file = None
        self.parent_stub = None
        self.raw_format = AstFormatter().format
        self.returns = []
        self.stubs_dict = {}
            # Keys are stub.full_name's.  Values are stubs.
        self.warn_list = []
        # Copies of controller ivars...
        self.output_fn = x.output_fn
        self.overwrite = x.overwrite
        self.prefix_lines = x.prefix_lines
        self.silent = x.silent
        self.regex_patterns = x.regex_patterns
        self.update_flag = x.update_flag
        self.trace_matches = x.trace_matches
        self.trace_patterns = x.trace_patterns
        self.trace_reduce = x.trace_reduce
        self.trace_visitors = x.trace_visitors
        self.verbose = x.verbose
        self.warn = x.warn
        # Copies of controller patterns...
        self.def_patterns = x.def_patterns
        self.names_dict = x.names_dict
        self.general_patterns = x.general_patterns
        self.patterns_dict = x.patterns_dict
    #@+node:ekr.20160318141204.171: *3* st.add_stub
    def add_stub(self, d, stub):
        """Add the stub to d, checking that it does not exist."""
        global g_input_file_name
        key = stub.full_name
        assert key
        if key in d:
            print('%20s: ignoring duplicate entry for %s' % (g_input_file_name, key))  # pragma: no cover
        else:
            d[key] = stub
    #@+node:ekr.20160318141204.172: *3* st.indent & out
    def indent(self, s):
        """Return s, properly indented."""
        # This version of indent *is* used.
        return '%s%s' % (' ' * 4 * self.level, s)

    def out(self, s):  # pragma: no cover
        """Output the string to the console or the file."""
        s = self.indent(s)
        if self.parent_stub:
            self.parent_stub.out_list.append(s)
        elif self.output_file:
            self.output_file.write(s + '\n')
        else:
            print(s)
    #@+node:ekr.20160318141204.173: *3* st.run (main line) & helpers
    def run(self, node):  # pragma: no cover
        """StubTraverser.run: write the stubs in node's tree to self.output_fn."""
        fn = self.output_fn
        dir_ = os.path.dirname(fn)
        if os.path.exists(fn) and not self.overwrite:
            print('file exists: %s' % fn)
            return
        if dir_ and not os.path.exists(dir_):
            print('output directory not not found: %s' % dir_)
            return
        # Create parent_stub.out_list.
        self.parent_stub = Stub(kind='root', name='<new-stubs>')
        for z in self.prefix_lines or []:
            self.parent_stub.out_list.append(z)
        self.visit(node)
        if self.update_flag:
            self.parent_stub = self.update(fn, new_root=self.parent_stub)
        # Output the stubs.
        self.output_file = open(fn, 'w')
        self.output_time_stamp()
        self.output_stubs(self.parent_stub)
        self.output_file.close()
        self.output_file = None
        self.parent_stub = None
        if self.verbose:
            print('wrote: %s' % fn)
    #@+node:ekr.20160318141204.174: *4* st.output_stubs
    def output_stubs(self, stub):
        """Output this stub and all its descendants."""
        for s in stub.out_list or []:
            # Indentation must be present when an item is added to stub.out_list.
            if self.output_file:
                self.output_file.write(s.rstrip() + '\n')
            else:
                print(s)  # pragma: no cover
        # Recursively print all children.
        for child in stub.children:
            self.output_stubs(child)
    #@+node:ekr.20160318141204.175: *4* st.output_time_stamp
    def output_time_stamp(self):  ###
        """Put a time-stamp in the output file."""
        if self.output_file:
            self.output_file.write('# make_stub_files: %s\n' %
                time.strftime("%a %d %b %Y at %H:%M:%S"))
    #@+node:ekr.20160318141204.176: *4* st.update & helpers
    def update(self, fn, new_root):  ###
        """
        Merge the new_root tree with the old_root tree in fn (a .pyi file).

        new_root is the root of the stub tree from the .py file.
        old_root (read below) is the root of stub tree from the .pyi file.
        
        Return old_root, or new_root if there are any errors.
        """
        s = self.get_stub_file(fn)
        if not s or not s.strip():
            return new_root
        if '\t' in s:
            # Tabs in stub files make it impossible to parse them reliably.
            g.trace('Can not update stub files containing tabs.')
            return new_root
        # Read old_root from the .pyi file.
        old_d, old_root = self.parse_stub_file(s, root_name='<old-stubs>')
        if old_root:
            # Merge new stubs into the old tree.
            if 0:
                print(self.trace_stubs(old_root, header='old_root'))
                print(self.trace_stubs(new_root, header='new_root'))
            print('***** updating stubs from %s *****' % fn)
            self.merge_stubs(self.stubs_dict.values(), old_root, new_root)
            # print(self.trace_stubs(old_root, header='updated_root'))
            return old_root
        return new_root
    #@+node:ekr.20160318141204.177: *5* st.get_stub_file
    def get_stub_file(self, fn):  # pragma: no cover
        """Read the stub file into s."""
        if os.path.exists(fn):
            try:
                s = open(fn, 'r').read()
            except Exception:
                print('--update: error reading %s' % fn)
                s = None
            return s
        print('--update: not found: %s' % fn)
        return None
    #@+node:ekr.20160318141204.178: *5* st.parse_stub_file
    def parse_stub_file(self, s, root_name):
        """
        Parse s, the contents of a stub file, into a tree of Stubs.
        
        Parse by hand, so that --update can be run with Python 2.
        """
        ### Still needed ???
        assert '\t' not in s
        d = {}
        root = Stub(kind='root', name=root_name)
        indent_stack = [-1]  # To prevent the root from being popped.
        stub_stack = [root]
        lines = []
        pat = re.compile(r'^([ ]*)(def|class)\s+([a-zA-Z_]+)(.*)')
        for line in g.splitLines(s):
            m = pat.match(line)
            if m:
                indent, kind, name = (len(m.group(1)), m.group(2), m.group(3))
                old_indent = indent_stack[-1]
                # Terminate any previous lines.
                old_stub = stub_stack[-1]
                old_stub.out_list.extend(lines)
                lines = [line]
                # Adjust the stacks.
                if indent == old_indent:
                    stub_stack.pop()
                elif indent > old_indent:
                    indent_stack.append(indent)
                else:  # indent < old_indent
                    # The indent_stack can't underflow because
                    # indent >= 0 and indent_stack[0] < 0
                    assert indent >= 0
                    while indent <= indent_stack[-1]:
                        indent_stack.pop()
                        old_stub = stub_stack.pop()
                        assert old_stub != root
                    indent_stack.append(indent)
                # Create and push the new stub *after* adjusting the stacks.
                assert stub_stack
                parent = stub_stack[-1]
                stack = [z.name for z in stub_stack[1:]]
                parent = stub_stack[-1]
                stub = Stub(kind, name, parent, stack)
                self.add_stub(d, stub)
                stub_stack.append(stub)
            else:
                parent = stub_stack[-1]
                lines.append(line)
        # Terminate the last stub.
        old_stub = stub_stack[-1]
        old_stub.out_list.extend(lines)
        return d, root
    #@+node:ekr.20160318141204.179: *5* st.merge_stubs & helpers
    def merge_stubs(self, new_stubs, old_root, new_root, trace=False):
        """
        Merge the new_stubs *list* into the old_root *tree*.
        - new_stubs is a list of Stubs from the .py file.
        - old_root is the root of the stubs from the .pyi file.
        - new_root is the root of the stubs from the .py file.
        """
        # Part 1: Delete old stubs do *not* exist in the *new* tree.
        aList = self.check_delete(new_stubs, old_root, new_root, trace)
            # Checks that all ancestors of deleted nodes will be deleted.
        aList = list(reversed(self.sort_stubs_by_hierarchy(aList)))
            # Sort old stubs so that children are deleted before parents.
        for stub in aList:
            if trace: g.trace('deleting  %s' % stub)
            parent = self.find_parent_stub(stub, old_root) or old_root
            parent.children.remove(stub)
            assert not self.find_stub(stub, old_root), stub
        # Part 2: Insert new stubs that *not* exist in the *old* tree.
        aList = [z for z in new_stubs if not self.find_stub(z, old_root)]
        aList = self.sort_stubs_by_hierarchy(aList)
            # Sort new stubs so that parents are created before children.
        for stub in aList:
            if trace: g.trace('inserting %s' % stub)
            parent = self.find_parent_stub(stub, old_root) or old_root
            parent.children.append(stub)
            assert self.find_stub(stub, old_root), stub
    #@+node:ekr.20160318141204.180: *6* st.check_delete
    def check_delete(self, new_stubs, old_root, new_root, trace):
        """Return a list of nodes that can be deleted."""
        old_stubs = self.flatten_stubs(old_root)
        old_stubs.remove(old_root)
        aList = [z for z in old_stubs if z not in new_stubs]
        if trace:  # pragma: no cover
            dump_list('old_stubs', old_stubs)
            dump_list('new_stubs', new_stubs)
            dump_list('to-be-deleted stubs', aList)
        delete_list = []
        # Check that all parents of to-be-delete nodes will be deleted.
        for z in aList:
            z1 = z
            for i in range(20):
                z = z.parent
                if not z:  # pragma: no cover
                    g.trace('can not append: new root not found', z)
                    break
                elif z == old_root:
                    delete_list.append(z1)
                    break
                elif z not in aList:  # pragma: no cover
                    g.trace("can not delete %s because of %s" % (z1, z))
                    break
            else:  # pragma: no cover
                g.trace('can not happen: parent loop')
        if trace:  # pragma: no cover
            dump_list('delete_list', delete_list)
        return delete_list
    #@+node:ekr.20160318141204.181: *6* st.flatten_stubs
    def flatten_stubs(self, root):
        """Return a flattened list of all stubs in root's tree."""
        aList = [root]
        for child in root.children:
            self.flatten_stubs_helper(child, aList)
        return aList

    def flatten_stubs_helper(self, root, aList):
        """Append all stubs in root's tree to aList."""
        aList.append(root)
        for child in root.children:
            self.flatten_stubs_helper(child, aList)
    #@+node:ekr.20160318141204.182: *6* st.find_parent_stub
    def find_parent_stub(self, stub, root):
        """Return stub's parent **in root's tree**."""
        return self.find_stub(stub.parent, root) if stub.parent else None
    #@+node:ekr.20160318141204.183: *6* st.find_stub
    def find_stub(self, stub, root):
        """Return the stub **in root's tree** that matches stub."""
        if stub == root:  # Must use Stub.__eq__!
            return root  # not stub!
        for child in root.children:
            stub2 = self.find_stub(stub, child)
            if stub2: return stub2
        return None
    #@+node:ekr.20160318141204.184: *6* st.sort_stubs_by_hierarchy
    def sort_stubs_by_hierarchy(self, stubs1):
        """
        Sort the list of Stubs so that parents appear before all their
        descendants.
        """
        stubs, result = stubs1[:], []
        for i in range(50):
            if stubs:
                # Add all stubs with i parents to the results.
                found = [z for z in stubs if z.level() == i]
                result.extend(found)
                for z in found:
                    stubs.remove(z)
            else:
                return result
        # Abort the merge.
        g.trace('can not happen: unbounded stub levels.')  # pragma: no cover
        return []  # pragma: no cover
    #@+node:ekr.20160318141204.185: *5* st.trace_stubs
    def trace_stubs(self, stub, aList=None, header=None, level=-1):  # pragma: no cover
        """Return a trace of the given stub and all its descendants."""
        indent = ' ' * 4 * max(0, level)
        if level == -1:
            aList = ['===== %s...\n' % (header) if header else '']
        for s in stub.out_list:
            aList.append('%s%s' % (indent, s.rstrip()))
        for child in stub.children:
            self.trace_stubs(child, level=level + 1, aList=aList)
        if level == -1:
            return '\n'.join(aList) + '\n'
        return ''
    #@+node:ekr.20160318141204.186: *3* st.visit_ClassDef
    # ClassDef(identifier name, expr* bases,
    #       keyword* keywords, expr? starargs, expr? kwargs
    #       stmt* body, expr* decorator_list)
    #
    # keyword arguments supplied to call (NULL identifier for **kwargs)
    # keyword = (identifier? arg, expr value)

    def visit_ClassDef(self, node):  ###

        # Create the stub in the old context.
        old_stub = self.parent_stub
        self.class_defs_count = 0
        self.parent_stub = Stub('class', node.name, old_stub, self.context_stack)
        self.add_stub(self.stubs_dict, self.parent_stub)
        # Enter the new context.
        self.class_name_stack.append(node.name)
        self.context_stack.append(node.name)
        if self.trace_matches or self.trace_reduce:  # pragma: no cover
            print('\nclass %s\n' % node.name)
        #
        # Fix issue #2: look ahead to see if there are any functions in this class.
        empty = not any(isinstance(z, ast.FunctionDef) for z in node.body)
        tail = ' ...' if empty else ''
        #
        # Format...
        bases = [self.visit(z) for z in node.bases] if node.bases else []
        if getattr(node, 'keywords', None):  # Python 3
            for keyword in node.keywords:
                bases.append('%s=%s' % (keyword.arg, self.visit(keyword.value)))
        if getattr(node, 'starargs', None):  # Python 3
            bases.append('*%s', self.visit(node.starargs))
        if getattr(node, 'kwargs', None):  # Python 3
            bases.append('*%s', self.visit(node.kwargs))
        if not node.name.startswith('_'):
            if node.bases:
                s = '(%s)' % ', '.join([self.format(z) for z in node.bases])
            else:
                s = ''
            self.out('class %s%s:%s' % (node.name, s, tail))
        # Visit...
        self.level += 1
        for z in node.body:
            self.visit(z)
        # Restore the context
        self.context_stack.pop()
        self.class_name_stack.pop()
        self.level -= 1
        self.parent_stub = old_stub
    #@+node:ekr.20160318141204.187: *3* st.visit_FunctionDef & helpers
    # FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list, expr? returns)

    def visit_FunctionDef(self, node):

        # Create the stub in the old context.
        old_stub = self.parent_stub
        self.parent_stub = Stub('def', node.name, old_stub, self.context_stack)
        self.add_stub(self.stubs_dict, self.parent_stub)
        # Enter the new context.
        self.returns = []
        self.level += 1
        self.context_stack.append(node.name)
        for z in node.body:
            self.visit(z)
        self.context_stack.pop()
        self.level -= 1
        # Format *after* traversing
        self.out('def %s(%s) -> %s' % (
            node.name,
            self.format_arguments(node.args),
            self.format_returns(node)))
        self.parent_stub = old_stub
    #@+node:ekr.20160318141204.188: *4* st.format_arguments & helper
    # arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

    def format_arguments(self, node):
        """
        Format the arguments node.
        Similar to AstFormat.do_arguments, but it is not a visitor!
        """
        assert isinstance(node, ast.arguments), node
        args = [self.raw_format(z) for z in node.args]
        defaults = [self.raw_format(z) for z in node.defaults]
        # Assign default values to the last args.
        result = []
        n_plain = len(args) - len(defaults)
        for i, arg in enumerate(args):
            s = self.munge_arg(arg)
            if i < n_plain:
                result.append(s)
            else:
                result.append('%s=%s' % (s, defaults[i - n_plain]))
        # Now add the vararg and kwarg args.
        name = getattr(node, 'vararg', None)
        if name:
            if hasattr(ast, 'arg'):  # python 3:
                name = self.raw_format(name)
            result.append('*' + name)
        name = getattr(node, 'kwarg', None)
        if name:
            if hasattr(ast, 'arg'):  # python 3:
                name = self.raw_format(name)
            result.append('**' + name)
        return ', '.join(result)
    #@+node:ekr.20160318141204.189: *5* st.munge_arg
    type_pattern = re.compile(r'.*:.*')

    def munge_arg(self, s):
        """Add an annotation for s if possible."""
        if s == 'self':
            return s
        for pattern in self.general_patterns:
            if pattern.match_entire_string(s):  ###
                return '%s: %s' % (s, pattern.repl_s)
        if self.warn and s not in self.warn_list:  # pragma: no cover
            self.warn_list.append(s)
            print('no annotation for %s' % s)
        # Fix issue #3.
        if self.type_pattern.match(s):
            return s
        return s + ': Any'
    #@+node:ekr.20160318141204.190: *4* st.format_returns & helpers
    def format_returns(self, node):
        """
        Calculate the return type:
        - Return None if there are no return statements.
        - Patterns in [Def Name Patterns] override all other patterns.
        - Otherwise, return a list of return values.
        """
        name = self.get_def_name(node)
        raw = [self.raw_format(z) for z in self.returns]
        # Allow StubFormatter.do_Return to do the hack.
        r = [self.format(z) for z in self.returns]
        # Step 1: Return None if there are no return statements.
        if not [z for z in self.returns if z.value is not None]:
            empty = not any(isinstance(z, ast.FunctionDef) for z in node.body)
            tail = ': ...' if empty else ':'
            return 'None' + tail
        # Step 2: [Def Name Patterns] override all other patterns.
        for pattern in self.def_patterns:
            found, s = pattern.match(name)
            if found:
                return s + ': ...'
        # Step 3: remove recursive calls.
        raw, r = self.remove_recursive_calls(name, raw, r)
        # Step 4: Calculate return types.
        return self.format_return_expressions(node, name, raw, r)
    #@+node:ekr.20160318141204.191: *5* st.format_return_expressions
    def format_return_expressions(self, node, name, raw_returns, reduced_returns):
        """
        aList is a list of maximally reduced return expressions.
        For each expression e in Alist:
        - If e is a single known type, add e to the result.
        - Otherwise, add Any # e to the result.
        Return the properly indented result.
        """
        assert len(raw_returns) == len(reduced_returns)
        lws = '\n' + ' ' * 4
        n = len(raw_returns)
        known = all(is_known_type(e) for e in reduced_returns)
        empty = not any(isinstance(z, ast.FunctionDef) for z in node.body)
        tail = ': ...' if empty else ':'
        # pylint: disable=no-else-return
        if not known or self.verbose:
            # First, generate the return lines.
            aList = []
            for i in range(n):
                e, raw = reduced_returns[i], raw_returns[i]
                known2 = ' ' if is_known_type(e) else '?'
                aList.append('# %s %s: %s' % (' ', i, raw.rstrip()))
                aList.append('# %s %s: return %s' % (known2, i, e))
            results = ''.join([lws + self.indent(z) for z in aList])
            # Put the return lines in their proper places.
            if known:
                s = reduce_types(reduced_returns, name=name, trace=self.trace_reduce)
                return s + tail + results
            return 'Any' + tail + results
        s = reduce_types(reduced_returns, name=name, trace=self.trace_reduce)
        return s + tail
    #@+node:ekr.20160318141204.192: *5* st.get_def_name
    def get_def_name(self, node):
        """Return the representaion of a function or method name."""
        if self.class_name_stack:
            name = '%s.%s' % (self.class_name_stack[-1], node.name)
            # All ctors should return None
            if node.name == '__init__':
                name = 'None'
        else:
            name = node.name  ###
        return name
    #@+node:ekr.20160318141204.193: *5* st.remove_recursive_calls
    def remove_recursive_calls(self, name, raw, reduced):  ###
        """Remove any recursive calls to name from both lists."""
        # At present, this works *only* if the return is nothing but the recursive call.
        assert len(raw) == len(reduced)
        pattern = Pattern('%s(*)' % name)
        n = len(reduced)
        raw_result, reduced_result = [], []
        for i in range(n):
            if pattern.match_entire_string(reduced[i]):
                pass
            else:
                raw_result.append(raw[i])
                reduced_result.append(reduced[i])
        return raw_result, reduced_result
    #@+node:ekr.20160318141204.194: *3* st.visit_Return
    def visit_Return(self, node):  ###
        self.returns.append(node)
            # New: return the entire node, not node.value.
    #@-others
#@+node:ekr.20210803055042.1: ** class TestMakeStubFiles(unittest.TestCase)
class TestMakeStubFiles(unittest.TestCase):  # pragma: no cover
    """Unit tests for make_stub_files.py"""
    #@+others
    #@+node:ekr.20210805090544.1: *3* test issues...
    #@+node:ekr.20180901040718.1: *4* test_bug2_empty
    def test_bug2_empty(self):
        # https://github.com/edreamleo/make-stub-files/issues/2
        tag = 'test_bug2_empty'
        s = 'class InvalidTag(Exception):\n    pass'
        controller = Controller()
        node = ast.parse(s, filename=tag, mode='exec')
        st = StubTraverser(controller=controller)
        # From StubTraverser.run.
        st.parent_stub = Stub(kind='root', name='<new-stubs>')
        st.visit(node)
        # Allocate a StringIo file for output_stubs.
        st.output_file = io.StringIO()
        st.output_stubs(st.parent_stub)
        # Test.
        lines = g.splitLines(st.output_file.getvalue())
        expected = ['class InvalidTag(Exception): ...\n']
        self.assertEqual(lines, expected)
    #@+node:ekr.20180901044640.1: *4* test_bug2_non_empty
    def test_bug2_non_empty(self):
        # https://github.com/edreamleo/make-stub-files/issues/2
        tag = 'test_bug2_non_empty'
        s = (
            'class NonEmptyClass:\n'
            '\n'
            '    def spam():\n'
            '        pass\n'
        )
        expected = [
            'class NonEmptyClass:\n',
            '    def spam() -> None: ...\n',
        ]
        controller = Controller()
        node = ast.parse(s, filename=tag, mode='exec')
        st = StubTraverser(controller=controller)
        # From StubTraverser.run.
        st.parent_stub = Stub(kind='root', name='<new-stubs>')
        st.visit(node)
        # Allocate a StringIo file for output_stubs.
        st.output_file = io.StringIO()
        st.output_stubs(st.parent_stub)
        # Test.
        lines = g.splitLines(st.output_file.getvalue())
        self.assertEqual(lines, expected)
    #@+node:ekr.20180901051603.1: *4* test_bug3
    def test_bug3(self):
        # https://github.com/edreamleo/make-stub-files/issues/3
        tag = 'test_bug3'
        s = (
            'class UnsupportedAlgorithm(Exception):\n'
            '    def __init__(self, message: Any, reason: Optional[str]=None) -> None:\n'
            '        pass\n'
        )
        expected = [
            'class UnsupportedAlgorithm(Exception):\n',
            '    def __init__(self, message: Any, reason: Optional[str]=None) -> None: ...\n',
        ]
        controller = Controller()
        node = ast.parse(s, filename=tag, mode='exec')
        st = StubTraverser(controller=controller)
        # From StubTraverser.run.
        st.parent_stub = Stub(kind='root', name='<new-stubs>')
        st.visit(node)
        # Allocate a StringIo file for output_stubs.
        st.output_file = io.StringIO()
        st.output_stubs(st.parent_stub)
        # Test.
        lines = g.splitLines(st.output_file.getvalue())
        self.assertEqual(lines, expected)
    #@+node:ekr.20210805090943.1: *3* test_ast_formatter_class
    def test_ast_formatter_class(self):
        formatter = AstFormatter()
        if 0:  # For debugging.
            tests = ["""\
                def yield_test():
                    yield 1
                """
            ]
        else:
            tests = [
            #@+<< define tests >>
            #@+node:ekr.20210805144859.1: *4* << define tests >> (test_ast_formatter_class)
            # Tests are either a single string, or a tuple: (source, expected).

            # Test 1. Class.
            """\
            class AstFormatter:
                def format(self, node: Node) -> Union[Any, str]:
                    pass
            """,
            # Test 2: Constant.
            """\
            a = 1
            b = 2.5
            c = False
            d = None
            """,
            # Test 3: ClassDef
            (
            """\
            @class_decorator
            class TestClass(str, base2=int):
                pass
            """,
            """\
            @class_decorator
            class TestClass(str, base2=int): ...
                pass
            """,
            ),
            # Test 4: FunctionDef
            """\
            @function_decorator
            def f():
                pass
            """,
            # Test 5: Position-only arg.
            """\
            def pos_only_arg(arg, /):
                pass
            """,
            # Test 6: Keyword-only arg.
            """\
            def kwd_only_arg(*, arg, arg2=None):
                pass
            """,
            # Test 7: Position-only and keyword-only args.
            """\
            def combined_example(pos_only, /, standard, *, kwd_only):
                pass
            """,
            # Test 8: Call.
            "print(*args, **kwargs)\n",
            # Test 9: Slices: Python 3.9 does not use ExtSlice.
            "print(s[0:1:2])\n",
            # Test 10: Continue.
            """\
            while 1:
                continue
            """,
            # Test 11: Delete.
            "del a\n",
            # Test 12: ExceptHandler.
            """\
            try:
                pass
            except Exception as e:
                print('oops')
            else:
                print('else')
            finally:
                print('finally')
            """,
            # Test 13: ImportFrom.
            "from a import b as c\n",
            # Test 14: Nonlocal.
            """\
            def nonlocal_test():
                nonlocal a
            """,
            # Test 15: Raise.
            """\
            raise Exception('spam', 'eggs')
            raise
            """,
            # Test 16: While.
            """\
            while True:
                print(True)
            else:
                print('else')
            """,
            # Test 17: With.
            """\
            with open(f, 'r') as f:
                f.read()
            """,
            # Test 18: Yield and YieldFrom.
            """\
            def yield_test():
                yield 1
                yield from z
                yield
            """,
            #@-<< define tests >>
            ]
        for i, source_data in enumerate(tests):
            filename = f"test {i+1}"
            if isinstance(source_data, str):
                source = textwrap.dedent(source_data)
                expected_s = textwrap.dedent(source)
            else:
                source, expected = source_data
                source = textwrap.dedent(source)
                expected_s = textwrap.dedent(expected)
            node = ast.parse(source, filename=filename, mode='exec')
            try:
                result_s = formatter.format(node)
            except Exception:
                self.fail(filename)
            lines = g.splitLines(result_s)
            expected = g.splitLines(expected_s)
            self.assertEqual(expected, lines, msg=filename)
    #@+node:ekr.20210807133723.1: *3* test_ast_arg_formatter_class
    def test_ast_arg_formatter_class(self):
        formatter = AstArgFormatter()
        tests = [
            #@+<< define tests >>
            #@+node:ekr.20210807133723.2: *4* << define tests >> (test_ast_arg_formatter_class)
            # Tests are either a single string, or a tuple: (source, expected).

            (
            """\
            a = 1
            b = 2.5
            c = False
            d = None
            """,
            """\
            a = int
            b = float
            c = bool
            d = None
            """,
            )
            #@-<< define tests >>
        ]
        for i, source_data in enumerate(tests):
            filename = f"test {i+1}"
            if isinstance(source_data, str):
                source = textwrap.dedent(source_data)
                expected_s = textwrap.dedent(source)
            else:
                source, expected = source_data
                source = textwrap.dedent(source)
                expected_s = textwrap.dedent(expected)
            node = ast.parse(source, filename=filename, mode='exec')
            try:
                result_s = formatter.format(node)
            except Exception:
                self.fail(filename)
            lines = g.splitLines(result_s)
            expected = g.splitLines(expected_s)
            self.assertEqual(expected, lines, msg=filename)
    #@+node:ekr.20210806011736.1: *3* test_ast_formatter_class_on_file
    def test_ast_formatter_class_on_file(self):
        # Use the source of *this* file as a single test.
        filename = __file__
        formatter = AstFormatter()
        with open(filename, 'r') as f:
            source = f.read()
        node = ast.parse(source, filename=filename, mode='exec')
        result_s = formatter.format(node)
        assert result_s
    #@+node:ekr.20210805091045.1: *3* test class ReduceTypes
    #@+node:ekr.20210808033520.1: *4* test_rt_is_known_type
    def test_rt_is_known_type(self):
        table = (
            ('None', True),
            ('(xxx)', False),
            ('str(xxx)', True),
            ('[str]', True),
            ('{whatever}', True),
        )
        for s, expected in table:
            result = ReduceTypes().is_known_type(s)
            self.assertEqual(result, expected, msg=repr(s))
    #@+node:ekr.20210804105256.1: *4* test_rt_reduce_numbers
    def test_rt_reduce_numbers(self):
        a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
        table = (
            ([i,i],     [i]),
            ([i],       [i]),
            ([f, i],    [f]),
            ([c, i],    [c]),
            ([l, a],    [a, l]),
        )
        for aList, expected in table:
            got = ReduceTypes().reduce_numbers(aList)
            self.assertEqual(expected, got, msg=repr(aList))
    #@+node:ekr.20210804111613.1: *4* test_rt_reduce_types
    def test_rt_reduce_types(self):

        a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
        none = 'None'
        x = 'xyzzy'
        y = 'pdq'
        table = (
            ([i,i],         i),
            ([i],           i),
            ([f, i],        f),
            ([c, i],        c),
            ([l, a],        'Union[Any, long]'),
            # Handle None
            ([None],        none),
            ([None, None],  none),
            ([None, a, c],  'Optional[Union[Any, complex]]'),
            # Handle unknown types, and special cases
            ([i, x],        'Union[Any, int]'),
            ([None, x],     'Optional[Any]'),
            ([none, x],     'Optional[Any]'),
            (['', x],       'Optional[Any]'),
            ([none, x, c],  'Optional[Union[Any, complex]]'),
            ([x, y],        'Any'),
            # Collection merging.  More could be done...
            (['Dict[int, str]', 'Dict[Any, str]'],          'Union[Dict[Any, str], Dict[int, str]]'),
            (['List[int, str]', 'List[Any, str]'],          'Union[List[Any, str], List[int, str]]'),
            (['Union[int, str]', 'Union[Any, str]'],        'Union[Union[Any, str], Union[int, str]]'),
            (['Union[int, str]', 'int', 'Union[Any, str]'], 'Union[Union[Any, str], Union[int, str], int]'),
            (['Tuple[xyz, pdq]'],                           'Tuple[Any, Any]'),
        )
        for aList, expected in table:
            got = reduce_types(aList)  # Call the global function for better coverage.
            self.assertEqual(expected, got, msg=repr(aList))
    #@+node:ekr.20210804111803.1: *4* test_rt_split_types
    def test_rt_split_types(self):
        table = (
            ('list',                    ['list']),
            ('List[a,b]',               ['List[a,b]']),
            ('List[a,b], List[c,d]',    ['List[a,b]', 'List[c,d]']),
        )
        for s, expected in table:
            got = ReduceTypes().split_types(s)
            self.assertEqual(expected, got, msg=repr(s))
    #@+node:ekr.20210804103146.1: *3* test class Pattern (mostly complete)
    def test_pattern_class(self):
        table = (
            # s,  Pattern.find_s, Pattern.repl_s, expected
            ('aabbcc', '(a+)(b+)(c+)$', r'\3\2\1', 'ccbbaa'),
            ('[str]', r'\[str\]$', 'xxx', 'xxx'), # Guido bug.
            ('s3', r's[1-3]?\b$', 'str', 'str'), # lengthening bug.
            ('s', 's', 'str', 'str'),
            ('abc', 'abc', 'ABC', 'ABC'),
            ('str(str)', 'str(*)', 'str', 'str'),
            ('[whatever]', '[*]', 'List[*]', 'List[whatever]'), # * on the RHS.
            ('(int,str)', '(*)', 'Tuple[*]', 'Tuple[int,str]'), # Guido bug 2.
            ('abcxyz', 'abc*', 'xxx', 'xxx'), # New test for trailing *.
            ('list(self.regex.finditer(str))','list(*)','List[*]',
             'List[self.regex.finditer(str)]'),
        )
        for s, find, repl, expected in table:
            pattern = Pattern(find, repl)
            result = pattern.match_entire_string(s)
            self.assertTrue(result, msg=repr(s))
            aList = pattern.all_matches(s)
            self.assertTrue(len(aList) == 1, msg=repr(aList))
            found, s2 = pattern.match(s)
            self.assertTrue(found, msg=f"after pattern.match({s!r})")
            assert s2 == expected, (s, pattern, 'expected', expected, 'got', s2)
        p1 = Pattern('abc','xyz')
        p2 = Pattern('abc','xyz')
        p3 = Pattern('abc','pdq')
        self.assertEqual(p1, p2)
        self.assertNotEqual(p1, p3)
        self.assertNotEqual(p2, p3)
        aSet = set()
        aSet.add(p1)
        self.assertTrue(p1 in aSet)
        self.assertTrue(p2 in aSet)
        self.assertFalse(p3 in aSet)
        self.assertEqual(list(aSet), [p1])
        self.assertEqual(list(aSet), [p2])
        aSet.add(p3)
        self.assertTrue(p1.match_entire_string('abc'))
        self.assertFalse(p1.match_entire_string('abcx'))
    #@+node:ekr.20210804112556.1: *3* test class Stub (complete)
    def test_stub_class(self):
        # Test equality...
        stub1 = Stub(kind='def', name='foo')
        stub2 = Stub(kind='class', name='foo')
        stub3 = Stub(kind='def', name='bar')
        stub4 = Stub(kind='def', name='foo')
        stub4.out_list = ['xyzzy']  # Contents of out_list must not affect equality!
        aList = [stub1, stub3]
        self.assertNotEqual(stub1, stub2)
        self.assertNotEqual(stub1, stub3)
        self.assertEqual(stub1, stub4)
        self.assertTrue(stub1 in aList)
        self.assertFalse(stub2 in aList)
        self.assertTrue(stub3 in aList)
        # Test __hash__
        d = {stub1: 'stub1'}
        self.assertTrue(stub1 in d)
        self.assertFalse(stub2 in d)
        # Test parents and level.
        stub_1 = Stub(kind='def', name='stub_1')
        stub_2 = Stub(kind='def', name='stub_2', parent=stub_1, stack=['stub_1'])
        stub_3 = Stub(kind='def', name='stub_3', parent=stub_2, stack=['stub_1', 'stub_2'])
        self.assertEqual(stub_1.parents(), [], msg=repr(stub_1.parents()))
        self.assertEqual(stub_2.parents(), ['stub_1'], msg=repr(stub_2.parents()))
        self.assertEqual(stub_3.parents(), ['stub_1', 'stub_2'], msg=repr(stub_3.parents()))
        self.assertEqual(stub_1.level(), 0)
        self.assertEqual(stub_2.level(), 1)
        self.assertEqual(stub_3.level(), 2)
    #@+node:ekr.20210807133118.1: *3* test_stub_formatter_class
    def test_stub_formatter_class(self):
        
        controller = Controller()
        traverser = StubTraverser(controller)
        formatter = StubFormatter(controller, traverser)
        if 0:  # For debugging.
            tests = [(
                "a = ['1', 2]\n",
                "a = List[str, int]\n",
            )]
        else:
            tests = [
            #@+<< define tests >>
            #@+node:ekr.20210807133228.1: *4* << define tests >> (test_stub_formatter_class)
            # Tests are either a single string, or a tuple: (source, expected).

            # Test 1: Constant.
            (
            """\
            a = 1
            b = 2.5
            c = False
            d = None
            s = "abc"
            """,
            """\
            a = int
            b = float
            c = bool
            d = None
            s = str
            """
            ),
            # Test 2: Attribute.
            "print(a.b)\n",
            # Test 3: BinOp.
            (
            """\
            print(1 + 2)
            print(3 + 4.1)
            print('s' + a)
            print(a + b)
            """,
            """\
            print(int)
            print(float)
            print(str)
            print(a+b)
            """,
            ),
            # Test 4: Compare
            (
            """\
            print(a in b)
            """,
            """\
            print(bool)
            """
            ),
            # Test 5: Dict
            (
            """\
            a = {}
            b = {'1': 1}
            c = dict()
            """,
            """\
            a = Dict
            b = Dict[str:int]
            c = Dict
            """,
            ),
            # Test 6: Call.
            (
            """\
            print(*args, **kwargs)
            print(dict(a, b))
            """,
            """\
            print(*args, **kwargs)
            print(Dict[a, b])
            """
            ),
            # Test 7: ifExp.
            (
            "print(1 if True else 2)\n",
            "print(int)\n",
            ),
            # Test 8: List.
            (
            "a = ['1', 2]\n",
            "a = List[str, int]\n",
            ),
            # Test 9: Tuple.
            (
            "a = ('1', 2)\n",
            "a = Tuple[str, int]\n",
            ),
            # Test 10: UnaryOp.
            (
            """\
            a = -b
            c = not d
            """,
            """\
            a = -b
            c = bool
            """
            ),
            # Test 11: Subscript.
            (
            "a = b[1:2:3]\n",
            "a = b[int:int:int]\n"
            ),
            # Test 12: Return.
            (
            # sf.Return only returns the return expression(!)
            "return 99\n",
            "int",
            )
            #@-<< define tests >>
            ]
        for i, source_data in enumerate(tests):
            filename = f"test {i+1}"
            if isinstance(source_data, str):
                source = textwrap.dedent(source_data)
                expected_s = textwrap.dedent(source)
            else:
                source, expected = source_data
                source = textwrap.dedent(source)
                expected_s = textwrap.dedent(expected)
            node = ast.parse(source, filename=filename, mode='exec')
            try:
                result_s = formatter.format(node)
            except Exception:
                self.fail(filename)
            lines = g.splitLines(result_s)
            expected = g.splitLines(expected_s)
            self.assertEqual(expected, lines, msg=filename)
    #@+node:ekr.20210805092921.1: *3* test class StubTraverser
    #@+node:ekr.20210804111915.1: *4* test_st_find
    def test_st_find(self):

        s = """\
    def is_known_type(s: str) -> Union[Any,bool]: ...
    def main() -> None: ...
    def merge_types(a1: Any, a2: Any) -> str: ...

    class AstFormatter:
        def format(self, node: Node) -> Union[Any,str]: ...
        def visit(self, node: Node) -> str: ...
        def do_ClassDef(self, node: Node) -> str: ...
        def do_FunctionDef(self, node: Node) -> str: ...
    """
        controller = Controller()
        st = StubTraverser(controller=controller)
        d, root = st.parse_stub_file(s, root_name='<root>')  # Root *is* used below.
        if 0:
            print(st.trace_stubs(root, header='root'))
        stub1 = Stub(kind='class', name='AstFormatter')
        stub2 = Stub(kind='def', name='format', parent=stub1, stack=['AstFormatter'])
        stub3 = Stub(kind='def', name='helper', parent = stub2, stack=['AstFormatter', 'format'])
        # stub4 = Stub(kind='def', name='main')
        for stub in (stub1, stub2, stub3,):  # (stub1, stub2, stub3):
            found = st.find_stub(stub, root)
            id_found = found and id(found) or None
            if 0:
                print('found  %s => %9s %35s ==> %s' % (id(stub), id_found, stub, found))
            found = st.find_parent_stub(stub, root)
            id_found = found and id(found) or None
            if 0:
                print('parent %s => %9s %35s ==> %s' % (id(stub), id_found, stub, found))
    #@+node:ekr.20210804112211.1: *4* test_st_flatten_stubs
    def test_st_flatten_stubs(self):
        s = """\
        def is_known_type(s: str) -> Union[Any,bool]: ...
        def main() -> None: ...
        def merge_types(a1: Any, a2: Any) -> str: ...
        
        class AstFormatter:
            def format(self, node: Node) -> Union[Any,str]: ...
            def visit(self, node: Node) -> str: ...
            def do_ClassDef(self, node: Node) -> str: ...
            def do_FunctionDef(self, node: Node) -> str: ...
        """
        controller = Controller()
        st = StubTraverser(controller=controller)
        d, root = st.parse_stub_file(s, root_name='<root>')
        if 0:
            print(st.trace_stubs(root, header='root'))
        aList = st.flatten_stubs(root)
        self.assertTrue(aList)
        if 0:
            for i, stub in enumerate(aList):
                print('%2s %s' % (i, stub))
        for stub in aList:
            found = st.find_stub(stub, root)
            self.assertTrue(found, msg=repr(stub))
    #@+node:ekr.20210804112405.1: *4* test_st_merge_stubs
    def test_st_merge_stubs(self):
        # To do:
        # - Test between-stub lines and leading lines.
        # - Round-trip tests!
        #@+<< old_stubs >>
        #@+node:ekr.20210804112405.3: *5* << old_stubs >>
        old_s = """\
        def main() -> None: ...
        def merge_types(a1: Any, a2: Any) -> str: ...
        def pdb(self) -> None: ...
        def reduce_types(aList: List[Any], name: str=None, trace: bool=False) -> Any: ...
        class Pattern(object):
            def __init__(self, find_s: str, repl_s: str='') -> None: ...
            def __eq__(self, obj: Any) -> bool: ...
            def __ne__(self, obj: Any) -> bool: ...
            def __hash__(self) -> int: ...
            def __repr__(self) -> str: ...
            def is_balanced(self) -> bool: ...
            def is_regex(self) -> Any: ...
                #   0: return self.find_s.endswith('$')
                # ? 0: return self.find_s.endswith(str)
        """
        #@-<< old_stubs >>
        #@+<< new_stubs >>
        #@+node:ekr.20210804112405.4: *5* << new_stubs >>
        new_s = """\
        def is_known_type(s: str) -> Union[Any,bool]: ...
        def main() -> None: ...
        def merge_types(a1: Any, a2: Any) -> str: ...
        def pdb(self) -> None: ...
        def reduce_numbers(aList: List[Any]) -> List[Any]: ...
        def reduce_types(aList: List[Any], name: str=None, trace: bool=False) -> Any: ...

        class AstFormatter:
            def format(self, node: Node) -> Union[Any,str]: ...
            def visit(self, node: Node) -> str: ...
            def do_ClassDef(self, node: Node) -> str: ...
            def do_FunctionDef(self, node: Node) -> str: ...
        """
        #@-<< new_stubs >>
        controller = Controller()
        st = StubTraverser(controller=controller)
        # dump('old_s', old_s)
        # dump('new_s', new_s)
        old_d, old_root = st.parse_stub_file(old_s, root_name='<old-root>')
        new_d, new_root = st.parse_stub_file(new_s, root_name='<new-root>')
        if 0:
            dump_dict('old_d', old_d)
            dump_dict('new_d', new_d)
            print(st.trace_stubs(old_root, header='trace_stubs(old_root)'))
            print(st.trace_stubs(new_root, header='trace_stubs(new_root)'))
        if 0:  # separate unit test. Passed.
            aList = st.sort_stubs_by_hierarchy(new_root)
            dump_list(aList, 'after sort_stubs_by_hierarcy')
        new_stubs = new_d.values()
        st.merge_stubs(new_stubs, old_root, new_root, trace=False)
        if 0:
            print(st.trace_stubs(old_root, header='trace_stubs(old_root)'))
    #@+node:ekr.20210807193409.1: *4* test_st_format_returns
    def test_st_format_returns(self):
        # Create the stubs.
        tag = 'test_st_format_returns'
        tests = [
        #@+<< test_st_format_returns tests >>
        #@+node:ekr.20210807210106.1: *5* << test_st_format_returns tests >>
        # Test 1:
        """\
        def test_1(self):
            if 1:
                return True
            return False
        """,
        # Test 2:
        """\
        def test_2():
            return xyzzy
        """,
        # Test3:
        """\
        def test_2(*args, **kwargs):
            return args
        """,
        #@-<< test_st_format_returns tests >>
        ]
        controller=Controller()
        for i, s in enumerate(tests):
            for verbose in (True, False):
                for patterns in ([], [Pattern('test_*')]):
                    # Instantiate new StubController, to avoid duplicate entries.
                    st = StubTraverser(controller=controller)
                    st.def_patterns = patterns
                    st.verbose = verbose
                    test_name = f"test {i}"
                    source = textwrap.dedent(s)
                    d, root = st.parse_stub_file(source, root_name=tag)
                    node = ast.parse(source, filename=test_name, mode='exec')
                    st.parent_stub = Stub(kind='root', name=test_name)
                    st.visit(node)
    #@+node:ekr.20210805093615.1: *3* test file: make_stub_files.py
    def test_file_msb(self):
        """Run make_stub_files on itself."""
        if 1:
            # This test is was only briefly useful.
            # In general, this test masks proper testing.
            self.skipTest('Prevents proper coverage data')
        elif 1:
            # Actually creates stubs.
            # f"python {msf} -c {cfg} -o -v {src}"
            directory = os.path.dirname(__file__)
            config_fn = os.path.normpath(os.path.abspath(os.path.expanduser('make_stub_files.cfg')))
            sys.argv = ['python', '-c', config_fn, '-o', '-v', __file__]
            main()
        else: # Works: (Like main function)
            controller = Controller()
            # Set ivars instead of calling scan_command_line.
            fn = __file__
            directory = os.path.dirname(__file__)
            controller.config_fn = finalize(os.path.join(directory, 'make_stub_files.cfg'))
            assert os.path.exists(controller.config_fn), controller.config_fn
            controller.overwrite = True
            # Go!
            controller.scan_options()
            for fn in controller.files:
                controller.make_stub_file(fn)
    #@+node:ekr.20210805093004.1: *3* test top-level functions
    #@+node:ekr.20210806153836.1: *4* test_finalize
    def test_finalize(self):
        result = finalize(__file__)
        self.assertEqual(result, __file__)
    #@+node:ekr.20210806154007.1: *4* test_is_known_type
    def test_is_known_type(self):
        self.assertTrue(is_known_type('str'))
    #@+node:ekr.20160207115947.1: *4* test_truncate
    def test_truncate(self):
        table = (
            ('abc',     'abc'),
            ('abcd',    'abcd'),
            ('abcde',   'abcde'),
            ('abcdef',  'ab...'),
            ('abcdefg', 'ab...'),
        )
        for s1, s2 in table:
            got = truncate(s1, 5)
            self.assertEqual(s2, got, msg=f"s1: {s1!r}")
    #@-others
#@-others
g = LeoGlobals()
g_input_file_name = None
if __name__ == "__main__":
    main()  # pragma: no cover
#@-leo
