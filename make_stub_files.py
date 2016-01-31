#!/usr/bin/env python
'''
This script makes a stub (.pyi) file in the output directory for each
source file listed on the command line (wildcard file names are supported).

For full details, see README.md.

This file is in the public domain.
'''

import ast
from collections import OrderedDict
    # Requires Python 2.7 or above. Without OrderedDict
    # the configparser will give random order for patterns.
try:
    import ConfigParser as configparser # Python 2
except ImportError:
    import configparser # Python 3
import glob
import optparse
import os
import re
import sys


class AstFormatter:
    '''
    A class to recreate source code from an AST.
    
    This does not have to be perfect, but it should be close.
    '''
    # pylint: disable=consider-using-enumerate

    # Entries...

    def format(self, node):
        '''Format the node (or list of nodes) and its descendants.'''
        self.level = 0
        val = self.visit(node)
        return val and val.strip() or ''

    def visit(self, node):
        '''Return the formatted version of an Ast node, or list of Ast nodes.'''
        if isinstance(node, (list, tuple)):
            return ','.join([self.visit(z) for z in node])
        elif node is None:
            return 'None'
        else:
            assert isinstance(node, ast.AST), node.__class__.__name__
            method_name = 'do_' + node.__class__.__name__
            method = getattr(self, method_name)
            s = method(node)
            # pylint: disable=unidiomatic-typecheck
            assert type(s) == type('abc'), type(s)
            return s

    # Contexts...

    # ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

    def do_ClassDef(self, node):
        result = []
        name = node.name # Only a plain string is valid.
        bases = [self.visit(z) for z in node.bases] if node.bases else []
        if bases:
            result.append(self.indent('class %s(%s):\n' % (name, ','.join(bases))))
        else:
            result.append(self.indent('class %s:\n' % name))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)

    # FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

    def do_FunctionDef(self, node):
        '''Format a FunctionDef node.'''
        result = []
        if node.decorator_list:
            for z in node.decorator_list:
                result.append('@%s\n' % self.visit(z))
        name = node.name # Only a plain string is valid.
        args = self.visit(node.args) if node.args else ''
        result.append(self.indent('def %s(%s):\n' % (name, args)))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)

    def do_Interactive(self, node):
        for z in node.body:
            self.visit(z)

    def do_Module(self, node):
        assert 'body' in node._fields
        result = ''.join([self.visit(z) for z in node.body])
        return result # 'module:\n%s' % (result)

    def do_Lambda(self, node):
        return self.indent('lambda %s: %s' % (
            self.visit(node.args),
            self.visit(node.body)))

    # Expressions...

    def do_Expr(self, node):
        '''An outer expression: must be indented.'''
        return self.indent('%s\n' % self.visit(node.value))

    def do_Expression(self, node):
        '''An inner expression: do not indent.'''
        return '%s\n' % self.visit(node.body)

    def do_GeneratorExp(self, node):
        elt = self.visit(node.elt) or ''
        gens = [self.visit(z) for z in node.generators]
        gens = [z if z else '<**None**>' for z in gens] ### Kludge: probable bug.
        return '<gen %s for %s>' % (elt, ','.join(gens))

    def do_AugLoad(self, node):
        return 'AugLoad'

    def do_Del(self, node):
        return 'Del'

    def do_Load(self, node):
        return 'Load'

    def do_Param(self, node):
        return 'Param'

    def do_Store(self, node):
        return 'Store'

    # Operands...

    # arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

    def do_arguments(self, node):
        '''Format the arguments node.'''
        kind = self.kind(node)
        assert kind == 'arguments', kind
        args = [self.visit(z) for z in node.args]
        defaults = [self.visit(z) for z in node.defaults]
        # Assign default values to the last args.
        args2 = []
        n_plain = len(args) - len(defaults)
        for i in range(len(args)):
            if i < n_plain:
                args2.append(args[i])
            else:
                args2.append('%s=%s' % (args[i], defaults[i - n_plain]))
        # Now add the vararg and kwarg args.
        name = getattr(node, 'vararg', None)
        if name: args2.append('*' + name)
        name = getattr(node, 'kwarg', None)
        if name: args2.append('**' + name)
        return ','.join(args2)

    # Python 3:
    # arg = (identifier arg, expr? annotation)

    def do_arg(self, node):
        if node.annotation:
            return self.visit(node.annotation)
        else:
            return ''

    # Attribute(expr value, identifier attr, expr_context ctx)

    def do_Attribute(self, node):
        return '%s.%s' % (
            self.visit(node.value),
            node.attr) # Don't visit node.attr: it is always a string.

    def do_Bytes(self, node): # Python 3.x only.
        return str(node.s)

    # Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

    def do_Call(self, node):
        func = self.visit(node.func)
        args = [self.visit(z) for z in node.args]
        for z in node.keywords:
            # Calls f.do_keyword.
            args.append(self.visit(z))
        if getattr(node, 'starargs', None):
            args.append('*%s' % (self.visit(node.starargs)))
        if getattr(node, 'kwargs', None):
            args.append('**%s' % (self.visit(node.kwargs)))
        args = [z for z in args if z] # Kludge: Defensive coding.
        return '%s(%s)' % (func, ','.join(args))

    # keyword = (identifier arg, expr value)

    def do_keyword(self, node):
        # node.arg is a string.
        value = self.visit(node.value)
        # This is a keyword *arg*, not a Python keyword!
        return '%s=%s' % (node.arg, value)

    def do_comprehension(self, node):
        result = []
        name = self.visit(node.target) # A name.
        it = self.visit(node.iter) # An attribute.
        result.append('%s in %s' % (name, it))
        ifs = [self.visit(z) for z in node.ifs]
        if ifs:
            result.append(' if %s' % (''.join(ifs)))
        return ''.join(result)

    def do_Dict(self, node):
        result = []
        keys = [self.visit(z) for z in node.keys]
        values = [self.visit(z) for z in node.values]
        if len(keys) == len(values):
            result.append('{\n' if keys else '{')
            items = []
            for i in range(len(keys)):
                items.append('  %s:%s' % (keys[i], values[i]))
            result.append(',\n'.join(items))
            result.append('\n}' if keys else '}')
        else:
            print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
                repr(keys), repr(values)))
        return ''.join(result)

    def do_Ellipsis(self, node):
        return '...'

    def do_ExtSlice(self, node):
        return ':'.join([self.visit(z) for z in node.dims])

    def do_Index(self, node):
        return self.visit(node.value)

    def do_List(self, node):
        # Not used: list context.
        # self.visit(node.ctx)
        elts = [self.visit(z) for z in node.elts]
        elst = [z for z in elts if z] # Defensive.
        return '[%s]' % ','.join(elts)

    def do_ListComp(self, node):
        elt = self.visit(node.elt)
        gens = [self.visit(z) for z in node.generators]
        gens = [z if z else '<**None**>' for z in gens] ### Kludge: probable bug.
        return '%s for %s' % (elt, ''.join(gens))

    def do_Name(self, node):
        return node.id

    def do_Num(self, node):
        return repr(node.n)

    # Python 2.x only

    def do_Repr(self, node):
        return 'repr(%s)' % self.visit(node.value)

    def do_Slice(self, node):
        lower, upper, step = '', '', ''
        if getattr(node, 'lower', None) is not None:
            lower = self.visit(node.lower)
        if getattr(node, 'upper', None) is not None:
            upper = self.visit(node.upper)
        if getattr(node, 'step', None) is not None:
            step = self.visit(node.step)
        if step:
            return '%s:%s:%s' % (lower, upper, step)
        else:
            return '%s:%s' % (lower, upper)

    def do_Str(self, node):
        '''This represents a string constant.'''
        return repr(node.s)

    # Subscript(expr value, slice slice, expr_context ctx)

    def do_Subscript(self, node):
        value = self.visit(node.value)
        the_slice = self.visit(node.slice)
        return '%s[%s]' % (value, the_slice)

    def do_Tuple(self, node):
        elts = [self.visit(z) for z in node.elts]
        return '(%s)' % ','.join(elts)

    # Operators...

    def do_BinOp(self, node):
        return '%s%s%s' % (
            self.visit(node.left),
            self.op_name(node.op),
            self.visit(node.right))

    def do_BoolOp(self, node):
        op_name = self.op_name(node.op)
        values = [self.visit(z) for z in node.values]
        return op_name.join(values)

    def do_Compare(self, node):
        result = []
        lt = self.visit(node.left)
        ops = [self.op_name(z) for z in node.ops]
        comps = [self.visit(z) for z in node.comparators]
        result.append(lt)
        if len(ops) == len(comps):
            for i in range(len(ops)):
                result.append('%s%s' % (ops[i], comps[i]))
        else:
            print('can not happen: ops', repr(ops), 'comparators', repr(comps))
        return ''.join(result)

    def do_UnaryOp(self, node):
        return '%s%s' % (
            self.op_name(node.op),
            self.visit(node.operand))

    def do_IfExp(self, node):
        return '%s if %s else %s ' % (
            self.visit(node.body),
            self.visit(node.test),
            self.visit(node.orelse))

    # Statements...

    def do_Assert(self, node):
        test = self.visit(node.test)
        if getattr(node, 'msg', None):
            message = self.visit(node.msg)
            return self.indent('assert %s, %s' % (test, message))
        else:
            return self.indent('assert %s' % test)

    def do_Assign(self, node):
        return self.indent('%s=%s\n' % (
            '='.join([self.visit(z) for z in node.targets]),
            self.visit(node.value)))

    def do_AugAssign(self, node):
        return self.indent('%s%s=%s\n' % (
            self.visit(node.target),
            self.op_name(node.op), # Bug fix: 2013/03/08.
            self.visit(node.value)))

    def do_Break(self, node):
        return self.indent('break\n')

    def do_Continue(self, node):
        return self.indent('continue\n')

    def do_Delete(self, node):
        targets = [self.visit(z) for z in node.targets]
        return self.indent('del %s\n' % ','.join(targets))

    def do_ExceptHandler(self, node):
        result = []
        result.append(self.indent('except'))
        if getattr(node, 'type', None):
            result.append(' %s' % self.visit(node.type))
        if getattr(node, 'name', None):
            if isinstance(node.name, ast.AST):
                result.append(' as %s' % self.visit(node.name))
            else:
                result.append(' as %s' % node.name) # Python 3.x.
        result.append(':\n')
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)

    # Python 2.x only

    def do_Exec(self, node):
        body = self.visit(node.body)
        args = [] # Globals before locals.
        if getattr(node, 'globals', None):
            args.append(self.visit(node.globals))
        if getattr(node, 'locals', None):
            args.append(self.visit(node.locals))
        if args:
            return self.indent('exec %s in %s\n' % (
                body, ','.join(args)))
        else:
            return self.indent('exec %s\n' % (body))

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

    def do_Global(self, node):
        return self.indent('global %s\n' % (
            ','.join(node.names)))

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

    def do_Import(self, node):
        names = []
        for fn, asname in self.get_import_names(node):
            if asname:
                names.append('%s as %s' % (fn, asname))
            else:
                names.append(fn)
        return self.indent('import %s\n' % (
            ','.join(names)))

    def get_import_names(self, node):
        '''Return a list of the the full file names in the import statement.'''
        result = []
        for ast2 in node.names:
            if self.kind(ast2) == 'alias':
                data = ast2.name, ast2.asname
                result.append(data)
            else:
                print('unsupported kind in Import.names list', self.kind(ast2))
        return result

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

    def do_Pass(self, node):
        return self.indent('pass\n')

    # Python 2.x only

    def do_Print(self, node):
        vals = []
        for z in node.values:
            vals.append(self.visit(z))
        if getattr(node, 'dest', None):
            vals.append('dest=%s' % self.visit(node.dest))
        if getattr(node, 'nl', None):
            vals.append('nl=%s' % node.nl)
        return self.indent('print(%s)\n' % (
            ','.join(vals)))

    def do_Raise(self, node):
        args = []
        for attr in ('type', 'inst', 'tback'):
            if getattr(node, attr, None) is not None:
                args.append(self.visit(getattr(node, attr)))
        if args:
            return self.indent('raise %s\n' % (
                ','.join(args)))
        else:
            return self.indent('raise\n')

    def do_Return(self, node):
        if node.value:
            return self.indent('return %s\n' % (
                self.visit(node.value)))
        else:
            return self.indent('return\n')

    def do_TryExcept(self, node):
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
            result.append('else:\n')
            for z in node.orelse:
                self.level += 1
                result.append(self.visit(z))
                self.level -= 1
        return ''.join(result)

    def do_TryFinally(self, node):
        result = []
        result.append(self.indent('try:\n'))
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        result.append(self.indent('finally:\n'))
        for z in node.finalbody:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        return ''.join(result)

    def do_While(self, node):
        result = []
        result.append(self.indent('while %s:\n' % (
            self.visit(node.test))))
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

    def do_With(self, node):
        result = []
        result.append(self.indent('with '))
        if hasattr(node, 'context_expression'):
            result.append(self.visit(node.context_expresssion))
        vars_list = []
        if hasattr(node, 'optional_vars'):
            try:
                for z in node.optional_vars:
                    vars_list.append(self.visit(z))
            except TypeError: # Not iterable.
                vars_list.append(self.visit(node.optional_vars))
        result.append(','.join(vars_list))
        result.append(':\n')
        for z in node.body:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
        result.append('\n')
        return ''.join(result)

    def do_Yield(self, node):
        if getattr(node, 'value', None):
            return self.indent('yield %s\n' % (
                self.visit(node.value)))
        else:
            return self.indent('yield\n')

    # Utils...

    def kind(self, node):
        '''Return the name of node's class.'''
        return node.__class__.__name__

    def indent(self, s):
        return '%s%s' % (' ' * 4 * self.level, s)

    def op_name (self,node,strict=True):
        '''Return the print name of an operator node.'''
        d = {
            # Binary operators. 
            'Add':       '+',
            'BitAnd':    '&',
            'BitOr':     '|',
            'BitXor':    '^',
            'Div':       '/',
            'FloorDiv':  '//',
            'LShift':    '<<',
            'Mod':       '%',
            'Mult':      '*',
            'Pow':       '**',
            'RShift':    '>>',
            'Sub':       '-',
            # Boolean operators.
            'And':   ' and ',
            'Or':    ' or ',
            # Comparison operators
            'Eq':    '==',
            'Gt':    '>',
            'GtE':   '>=',
            'In':    ' in ',
            'Is':    ' is ',
            'IsNot': ' is not ',
            'Lt':    '<',
            'LtE':   '<=',
            'NotEq': '!=',
            'NotIn': ' not in ',
            # Context operators.
            'AugLoad':  '<AugLoad>',
            'AugStore': '<AugStore>',
            'Del':      '<Del>',
            'Load':     '<Load>',
            'Param':    '<Param>',
            'Store':    '<Store>',
            # Unary operators.
            'Invert':   '~',
            'Not':      ' not ',
            'UAdd':     '+',
            'USub':     '-',
        }
        name = d.get(self.kind(node),'<%s>' % node.__class__.__name__)
        if strict: assert name,self.kind(node)
        return name


class Pattern:
    '''
    A class representing regex or balanced patterns.
    
    Sample matching code, for either kind of pattern::
        
        for start, end in reversed(pattern.all_matches(s)):
            s = s[:start] + pattern.repl_s + s[end:]
    '''

    def __init__ (self, find_s, repl_s, trace=False):
        '''Ctor for the Pattern class.'''
        sep = r'\b'
        self.find_s = find_s
        self.repl_s = repl_s
        self.regex = (
            None if self.is_balanced() else
            re.compile(sep+find_s.strip(sep)+sep))
        self.trace = trace

    def __repr__(self):
        '''Pattern.__repr__'''
        return 'Pattern: %s ==> %s' % (self.find_s, self.repl_s)
        
    __str__ = __repr__

    def is_balanced(self):
        '''Return True if self.s is a balanced pattern.'''
        s = self.find_s
        for pattern in ('(*)', '[*]', '{*}'):
            if s.find(pattern) > -1:
                return True
        return False

    def all_matches(self, s, trace=False):
        '''Return a list of tubles (start, end) for all matches in s.'''
        trace = trace or self.trace
        if self.is_balanced():
            aList, i = [], 0
            while i < len(s):
                progress = i
                j = self.full_balanced_match(s, i, trace=trace)
                if j is None:
                    i += 1
                else:
                    aList.append((i,j),)
                    i = j
                assert progress < i
            return aList
        else:
            return [tuple((m.start(), m.end()),) for m in self.regex.finditer(s)]

    def full_balanced_match(self, s, i, trace=False):
        '''Return the index of the end of the match found at s[i:] or None.'''
        i1 = i
        trace = trace or self.trace
        pattern = self.find_s
        j = 0 # index into pattern
        while i < len(s) and j < len(pattern) and s[i] == pattern[j]:
            progress = i
            if pattern[j:j+3] in ('(*)', '[*]', '{*}'):
                delim = pattern[j]
                i = self.match_balanced(delim, s, i)
                j += 3
            else:
                i += 1
                j += 1
            assert progress < i
        found = i <= len(s) and j == len(pattern)
        if trace and found:
            print('full_balanced_match %s -> %s' % (pattern, s[i1:i]))
        return i if found else None

    def match_balanced(self, delim, s, i):
        '''
        delim == s[i] and delim is in '([{'
        Return the index of the end of the balanced parenthesized string, or len(s)+1.
        '''
        trace = self.trace
        assert s[i] == delim, s[i]
        assert delim in '([{'
        delim2 = ')]}'['([{'.index(delim)]
        assert delim2 in ')]}'
        i1, level = i, 0
        while i < len(s):
            progress = i
            ch = s[i]
            i += 1
            if ch == delim:
                level += 1
            elif ch == delim2:
                level -= 1
                if level == 0:
                    if trace: print('match_balanced: found: %s' % s[i1:i])
                    return i
            assert progress < i
        # Unmatched: a syntax error.
        print('***** unmatched %s in %s' % (delim, s))
        return len(s) + 1

    def match_entire_string(self, s):
        '''Return True if s matches self.find_s'''
        trace = True
        if self.is_balanced():
            j = self.full_balanced_match(s, 0)
            return j is not None
        else:
            m = self.regex.match(s)
            return m and m.group(0) == s


class StandAloneMakeStubFile:
    '''
    A class to make Python stub (.pyi) files in the ~/stubs directory for
    every file mentioned in the [Source Files] section of
    ~/stubs/make_stub_files.cfg.
    '''

    def __init__ (self):
        '''Ctor for StandAloneMakeStubFile class.'''
        self.options = {}
        # Ivars set on the command line...
        self.config_fn = self.finalize('~/stubs/make_stub_files.cfg')
        self.enable_unit_tests = False
        self.files = [] # May also be set in the config file.
        self.trace = False # Trace pattern substitutions.
        self.verbose = False # Trace config arguments.
        # Ivars set in the config file...
        self.output_fn = None
        self.output_directory = self.finalize('~/stubs')
        self.overwrite = False
        self.prefix_lines = []
        self.trace = False
        self.warn = False
        # Pattern lists, set by config sections...
        self.arg_patterns = [] # [Arg Patterns]
        self.def_patterns = [] # [Def Name Patterns]
        self.general_patterns = [] # [General Patterns]
        self.return_patterns = [] # [Return Patterns]
        
    def finalize(self, fn):
        '''Finalize and regularize a filename.'''
        fn = os.path.expanduser(fn)
        fn = os.path.abspath(fn)
        fn = os.path.normpath(fn)
        return fn

    def make_stub_file(self, fn):
        '''
        Make a stub file in ~/stubs for all source files mentioned in the
        [Source Files] section of ~/stubs/make_stub_files.cfg
        '''
        if not fn.endswith('.py'):
            print('not a python file', fn)
            return
        if not os.path.exists(fn):
            print('not found', fn)
            return
        base_fn = os.path.basename(fn)
        out_fn = os.path.join(self.output_directory, base_fn)
        out_fn = out_fn[:-3] + '.pyi'
        self.output_fn = os.path.normpath(out_fn)
        s = open(fn).read()
        node = ast.parse(s,filename=fn,mode='exec')
        StubTraverser(controller=self).run(node)

    def run(self):
        '''
        Make stub files for all files.
        Do nothing if the output directory does not exist.
        '''
        if self.enable_unit_tests:
            self.run_all_unit_tests()
        dir_ = self.output_directory
        if dir_:
            if os.path.exists(dir_):
                for fn in self.files:
                    self.make_stub_file(fn)
            else:
                print('output directory not found: %s' % dir_)
        else:
            print('no output directory')

    def run_all_unit_tests(self):
        
        # pylint: disable=relative-import
        from test import test_msf
        import unittest
        loader = unittest.TestLoader()
        suite = loader.loadTestsFromTestCase(test_msf.TestMakeStubFiles)
        unittest.TextTestRunner(verbosity=0).run(suite)

    def scan_command_line(self):
        '''Set ivars from command-line arguments.'''
        # This automatically implements the --help option.
        usage = "usage: make_stub_files.py [options] file1, file2, ..."
        parser = optparse.OptionParser(usage=usage)
        add = parser.add_option
        add('-c', '--config', dest='fn',
            help='full path to alternate configuration file')
        add('-d', '--dir', dest='dir',
            help='full path to the output directory')
        add('-o', '--overwrite', action='store_true', default=False,
            help='overwrite existing stub (.pyi) files')
        add('-t', '--trace', action='store_true', default=False,
            help='trace argument substitutions')
        add('-u', '--unit-test', action='store_true', default=False,
            help='enable unit tests at startup')
        add('-v', '--verbose', action='store_true', default=False,
            help='trace configuration settings')
        add('-w', '--warn', action='store_true', default=False,
            help='warn about unannotated args')
        # Parse the options
        options, args = parser.parse_args()
        # Handle the options...
        self.enable_unit_tests=options.unit_test
        self.overwrite = options.overwrite
        self.trace = self.trace or options.trace
        self.verbose = self.verbose or options.verbose
        self.warn = options.warn
        if options.fn:
            self.config_fn = options.fn
        if options.dir:
            dir_ = options.dir
            dir_ = self.finalize(dir_)
            if os.path.exists(dir_):
                self.output_directory = dir_
            else:
                print('--dir: directory does not exist: %s' % dir_)
                print('exiting')
                sys.exit(1)
        # If any files remain, set self.files.
        if args:
            args = [self.finalize(z) for z in args]
            if args:
                self.files = args
    def scan_options(self):
        '''Set all configuration-related ivars.'''
        verbose = self.verbose
        self.parser = parser = configparser.ConfigParser(dict_type=OrderedDict)
            # Requires Python 2.7
        parser.optionxform = str
        fn = self.finalize(self.config_fn)
        if os.path.exists(fn):
            if verbose:
                print('\nconfiguration file: %s\n' % fn)
        else:
            print('\nconfiguration file not found: %s' % fn)
            return
        parser.read(fn)
        if self.files:
            files_source = 'command-line'
            files = self.files
        else:
            files_source = 'config file'
            files = parser.get('Global', 'files')
            files = [z.strip() for z in files.split('\n') if z.strip()]
        files2 = []
        for z in files:
            files2.extend(glob.glob(self.finalize(z)))
        self.files = [z for z in files2 if z and os.path.exists(z)]
        if verbose:
            print('Files (from %s)...\n' % files_source)
            for z in self.files:
                print(z)
            print('')
        if 'output_directory' in parser.options('Global'):
            s = parser.get('Global', 'output_directory')
            output_dir = self.finalize(s)
            if os.path.exists(output_dir):
                self.output_directory = output_dir
                if verbose:
                    print('output directory: %s\n' % output_dir)
            else:
                print('output directory not found: %s\n' % output_dir)
                self.output_directory = None # inhibit run().
        if 'prefix_lines' in parser.options('Global'):
            prefix = parser.get('Global', 'prefix_lines')
            self.prefix_lines = [z.strip() for z in prefix.split('\n') if z.strip()]
            if verbose:
                print('Prefix lines...\n')
                for z in self.prefix_lines:
                    print(z)
                print('')
        self.arg_patterns = self.scan_patterns('Arg Patterns')
        self.def_patterns = self.scan_patterns('Def Name Patterns')
        self.general_patterns = self.scan_patterns('General Patterns')
        self.return_patterns = self.scan_patterns('Return Patterns')

    def scan_patterns(self, section_name):
        '''Parse the config section into a list of patterns, preserving order.'''
        parser, verbose = self.parser, self.verbose
        aList = []
        if section_name in parser.sections():
            if verbose: print('%s...\n' % section_name)
            for key in parser.options(section_name):
                value = parser.get(section_name, key)
                pattern = Pattern(key, value, self.trace)
                aList.append(pattern)
                if verbose: print(pattern)
            if verbose: print('')
        elif verbose:
            print('no section: %s' % section_name)
            print(parser.sections())
            print('')
        return aList


class StubFormatter (AstFormatter):
    '''
    Just like the AstFormatter class, except it prints the class
    names of constants instead of actual values.
    '''

    # Return generic markers allow better pattern matches.

    def do_BoolOp(self, node): # Python 2.x only.
        return 'bool'

    def do_Bytes(self, node): # Python 3.x only.
        return 'bytes' # return str(node.s)

    def do_Name(self, node):
        return 'bool' if node.id in ('True', 'False') else node.id

    def do_Num(self, node):
        return 'number' # return repr(node.n)

    def do_Str(self, node):
        '''This represents a string constant.'''
        return 'str' # return repr(node.s)


class StubTraverser (ast.NodeVisitor):
    '''An ast.Node traverser class that outputs a stub for each class or def.'''

    def __init__(self, controller):
        '''Ctor for StubTraverser class.'''
        self.controller = x = controller
            # A StandAloneMakeStubFile instance.
        # Internal state ivars...
        self.class_name_stack = []
        self.format = StubFormatter().format
        self.in_function = False
        self.level = 0
        self.output_file = None
        self.raw_format = AstFormatter().format
        self.returns = []
        self.warn_list = []
        # Copies of controller ivars...
        self.output_fn = x.output_fn
        self.overwrite = x.overwrite
        self.prefix_lines = x.prefix_lines
        self.trace = x.trace
        self.warn = x.warn
        # Copies of controller patterns...
        self.arg_patterns = x.arg_patterns
        self.def_patterns = x.def_patterns
        self.general_patterns = x.general_patterns
        self.return_patterns = x.return_patterns

    def indent(self, s):
        '''Return s, properly indented.'''
        return '%s%s' % (' ' * 4 * self.level, s)

    def out(self, s):
        '''Output the string to the console or the file.'''
        if self.output_file:
            self.output_file.write(self.indent(s)+'\n')
        else:
            print(self.indent(s))

    def run(self, node):
        '''StubTraverser.run: write the stubs in node's tree to self.output_fn.'''
        fn = self.output_fn
        dir_ = os.path.dirname(fn)
        if os.path.exists(fn) and not self.overwrite:
            print('file exists: %s' % fn)
        elif not dir_ or os.path.exists(dir_):
            self.output_file = open(fn, 'w')
            for z in self.prefix_lines or []:
                self.out(z.strip())
            self.visit(node)
            self.output_file.close()
            self.output_file = None
            print('wrote: %s' % fn)
        else:
            print('output directory not not found: %s' % dir_)


    # ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

    def visit_ClassDef(self, node):

        # Format...
        if not node.name.startswith('_'):
            if node.bases:
                s = '(%s)' % ','.join([self.format(z) for z in node.bases])
            else:
                s = ''
            self.out('class %s%s:' % (node.name, s))
        # Visit...
        self.level += 1
        old_in_function = self.in_function
        self.in_function = False
        self.class_name_stack.append(node.name)
        for z in node.body:
            self.visit(z)
        self.class_name_stack.pop()
        self.level -= 1
        self.in_function = old_in_function

    # FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

    def visit_FunctionDef(self, node):
        
        # Do nothing if we are already in a function.
        # We do not generate stubs for inner defs.
        if self.in_function: # or node.name.startswith('_'):
            return
        # First, visit the function body.
        self.returns = []
        self.in_function = True
        self.level += 1
        for z in node.body:
            self.visit(z)
        self.level -= 1
        self.in_function = False
        # Format *after* traversing
        self.out('def %s(%s) -> %s' % (
            node.name,
            self.format_arguments(node.args),
            self.format_returns(node)))

    # arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

    def format_arguments(self, node):
        '''
        Format the arguments node.
        Similar to AstFormat.do_arguments, but it is not a visitor!
        '''
        assert isinstance(node,ast.arguments), node
        args = [self.format(z) for z in node.args]
        defaults = [self.raw_format(z) for z in node.defaults]
        # Assign default values to the last args.
        result = []
        n_plain = len(args) - len(defaults)
        # pylint: disable=consider-using-enumerate
        for i in range(len(args)):
            s = self.munge_arg(args[i])
            if i < n_plain:
                result.append(s)
            else:
                result.append('%s=%s' % (s, defaults[i - n_plain]))
        # Now add the vararg and kwarg args.
        name = getattr(node, 'vararg', None)
        if name: result.append('*' + name)
        name = getattr(node, 'kwarg', None)
        if name: result.append('**' + name)
        return ', '.join(result)

    def munge_arg(self, s):
        '''Add an annotation for s if possible.'''
        if s == 'self':
            return s
        default_pattern = None
        for patterns in (self.arg_patterns, self.general_patterns):
            for pattern in patterns:
                if pattern.find_s == '.*':
                    default_pattern = pattern
                        # Match the default pattern last.
                else:
                    # Succeed only if the entire pattern matches.
                    if pattern.match_entire_string(s):
                        return '%s: %s' % (s, pattern.repl_s)
        if default_pattern:
            return '%s: %s' % (s, default_pattern.repl_s)
        else:
            if self.warn and s not in self.warn_list:
                self.warn_list.append(s)
                print('no annotation for %s' % s)
            return s

    def format_returns(self, node):
        '''
        Calculate the return type:
        - Return None if there are no return statements.
        - Patterns in [Def Name Patterns] override all other patterns.
        - Otherwise, return a list of return values.
        '''
        # Shortcut everything if node.name matches any
        # pattern in self.def_patterns
        trace = self.trace
        name = self.get_def_name(node)
        r = [self.format(z) for z in self.returns]
        # Step 1: Return None if there are no return statements.
        if trace and self.returns:
            print('format_returns: name: %s r:\n%s' % (name, r))
        if not [z for z in self.returns if z != None]:
            return 'None: ...'
        # Step 2: [Def Name Patterns] override all other patterns.
        for pattern in self.def_patterns:
            find_s, repl_s = pattern.find_s, pattern.repl_s
            match = re.search(find_s, name)
            if match and match.group(0) == name:
                if trace:
                    print('*name pattern %s: %s -> %s' % (find_s, name, repl_s))
                return repl_s + ': ...'
        # Step 3: munge each return value, and merge them.
        r = [self.munge_ret(name, z) for z in r]
            # Make type substitutions.
        r = sorted(set(r))
            # Remove duplicates
        if len(r) == 0:
            return 'None: ...'
        if len(r) == 1:
            kind = None
        elif 'None' in r:
            r.remove('None')
            kind = 'Optional'
        else:
            kind = 'Union'
        return self.format_return_expressions(r, kind)

    def format_return_expressions(self, aList, kind):
        '''
        aList is a list of return expressions.
        All patterns have been applied.
        For each expression e:
        - If e is a single known type, add e to the result.
        - Otherwise, add Any # e to the result.
        Return the properly indented result.
        '''
        comments, results, unknowns = [], [], False
        lws =  '\n' + ' '*4
        for i, e in enumerate(aList):
            comma = ',' if i < len(aList) - 1 else ''
            comments.append('# ' + e)
            results.append(e + comma)
            if not self.is_known_type(e):
                unknowns = True
        if unknowns:
            comments = ''.join([lws + self.indent(z) for z in comments])
            return 'Any: ...' + comments
        if kind == 'Union' and len(results) == 1:
            kind = None
        if len(results) == 1:
            s = results[0]
        else:
            s = ''.join([lws + self.indent(z) for z in results])
        if kind:
            s = '%s[%s]' % (kind, s)
        return s + ': ...'
        

    def is_known_type(self, s):
        '''
        Return True if s is nothing but a single known type.
        Recursively test inner types in square brackets.
        '''
        if s in (
            'bool', 'bytes', 'complex', 'dict', 'float', 'int',
            'list', 'long', 'str', 'tuple', 'unicode',
        ):
            return True
        table = (
            'AbstractSet', 'Any', 'AnyMeta', 'AnyStr',
            'BinaryIO', 'ByteString',
            'Callable', 'CallableMeta', 'Container',
            'Dict', 'Final', 'Generic', 'GenericMeta', 'Hashable',
            'IO', 'ItemsView', 'Iterable', 'Iterator',
            'KT', 'KeysView', 'List',
            'Mapping', 'MappingView', 'Match',
            'MutableMapping', 'MutableSequence', 'MutableSet',
            'NamedTuple', 'Optional', 'OptionalMeta',
            # 'POSIX', 'PY2', 'PY3',
            'Pattern', 'Reversible',
            'Sequence', 'Set', 'Sized',
            'SupportsAbs', 'SupportsFloat', 'SupportsInt', 'SupportsRound',
            'T', 'TextIO', 'Tuple', 'TupleMeta',
            'TypeVar', 'TypingMeta',
            'Undefined', 'Union', 'UnionMeta',
            'VT', 'ValuesView', 'VarBinding',
        )
        for s2 in table:
            if s2 == s:
                return True
            pattern = Pattern(s2+'[*]', s)
            if pattern.match_entire_string(s):
                # Look inside the square brackets.
                brackets = s[len(s2):]
                assert brackets and brackets[0] == '[' and brackets[-1] == ']'
                s3 = brackets[1:-1]
                if s3:
                    return all([self.is_known_type(z) for z in s3.split(',')])
                else:
                    return True
        return False
    def get_def_name(self, node):
        '''Return the representaion of a function or method name.'''
        if self.class_name_stack:
            name = '%s.%s' % (self.class_name_stack[-1], node.name)
            # All ctors should return None
            if node.name == '__init__':
                name = 'None'
        else:
            name = node.name
        return name

    def munge_ret(self, name, s):
        '''replace a return value by a type if possible.'''
        trace = self.trace
        if trace: print('munge_ret ==== %s' % name)
        count, found = 0, True
        while found and count < 100:
            count, found = count + 1, False
            for patterns in ( self.general_patterns, self.return_patterns):
                found2, s = self.match_return_patterns(name, patterns, s)
                found = found or found2
        if trace: print('munge_ret -----: %s' % s)
        return s

    def match_return_patterns(self, name, patterns, s):
        '''
        Match all the given patterns, except the .* pattern.
        Return (found, s) if any succeed.
        '''
        trace = self.trace # or name.endswith('munge_arg')
        s1 = s
        default_pattern = None
        if trace: print('match_patterns ===== %s: %s' % (name, s1))
        for pattern in patterns:
            if pattern.find_s == '.*':
                # The user should use [Def Name Patterns] instead.
                pass
            else:
                # Find all non-overlapping matches.
                matches = pattern.all_matches(s, trace=trace)
                # Replace in reverse order.
                s2 = s
                for start, end in reversed(matches):
                    s = s[:start] + pattern.repl_s + s[end:]
                    if trace and s2 != s:
                        print('match_patterns %s' % matches)
                        sep = '\n' if len(s2) > 20 or len(s) > 20 else ' '
                        print('match_patterns match: %s%s%s -->%s%s' % (
                            pattern.repl_s, sep, s2, sep, s))
        found = s1 != s
        if trace and found:
            print('match_patterns returns %s\n' % s)
        return found, s
        

    def visit_Return(self, node):

        self.returns.append(node.value)

def main():
    '''
    The driver for the stand-alone version of make-stub-files.
    All options come from ~/stubs/make_stub_files.cfg.
    '''
    controller = StandAloneMakeStubFile()
    controller.scan_command_line()
    controller.scan_options()
    controller.run()
    print('done')

def pdb():
    '''Invoke pdb in a way that can be used safely in Leo.'''
    try:
        import leo.core.leoGlobals as g
        g.pdb()
    except ImportError:
        import pdb
        pdb.set_trace()

if __name__ == "__main__":
    main()
