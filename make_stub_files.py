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
import time
try:
    import io.StringIO as StringIO # Python 3
except ImportError:
    import StringIO
import sys


# Top-level functions

def is_known_type(s):
    '''
    Return True if s is nothing but a single known type.
    Recursively test inner types in square brackets.
    '''
    trace = False
    s1 = s
    s = s.strip()
    table = (
        # None,
        'None', 
        'complex', 'float', 'int', 'long', 'number',
        'dict', 'list', 'tuple',
        'bool', 'bytes', 'str', 'unicode',
    )
    for s2 in table:
        if s2 == s:
            return True
        elif Pattern(s2+'(*)', s).match_entire_string(s):
            return True
    if s.startswith('[') and s.endswith(']'):
        inner = s[1:-1]
        return is_known_type(inner) if inner else True
    elif s.startswith('(') and s.endswith(')'):
        inner = s[1:-1]
        return is_known_type(inner) if inner else True
    elif s.startswith('{') and s.endswith('}'):
        return True ### Not yet.
        # inner = s[1:-1]
        # return is_known_type(inner) if inner else True
    table = (
        # Pep 484: https://www.python.org/dev/peps/pep-0484/
        # typing module: https://docs.python.org/3/library/typing.html
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
            # if s.startswith('Dict[List'): g.pdb()
            brackets = s[len(s2):]
            assert brackets and brackets[0] == '[' and brackets[-1] == ']'
            s3 = brackets[1:-1]
            if s3:
                return all([is_known_type(z.strip())
                    for z in split_types(s3)])
            else:
                return True
    if trace: g.trace('Fail:', s1)
    return False

def main():
    '''
    The driver for the stand-alone version of make-stub-files.
    All options come from ~/stubs/make_stub_files.cfg.
    '''
    # g.cls()
    controller = StandAloneMakeStubFile()
    controller.scan_command_line()
    controller.scan_options()
    controller.run()
    print('done')

def merge_types(a1, a2):
    '''
    a1 and a2 may be strings or lists.
    return a list containing both of them, flattened, without duplicates.
    '''
    # Not used at present, and perhaps never.
    # Only useful if visitors could return either lists or strings.
    assert a1 is not None
    assert a2 is not None
    r1 = a1 if isinstance(a1, (list, tuple)) else [a1]
    r2 = a2 if isinstance(a2, (list, tuple)) else [a2]
    return sorted(set(r1 + r2))

def pdb(self):
    '''Invoke a debugger during unit testing.'''
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.pdb()
    except ImportError:
        import pdb
        pdb.set_trace()

def reduce_numbers(aList):
    '''
    Return aList with all number types in aList replaced by the most
    general numeric type in aList.
    '''
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

def reduce_types(aList, newlines=False, trace=False):
    '''
    Return a string containing the reduction of all types in aList.
    The --trace-reduce command-line option sets trace=True.
    '''
    trace = False or trace
    aList1 = aList[:]
    def show(s, known=True):
        '''Show the result of the reduction.'''
        s2 = s.replace('\n','').replace(' ','').strip().replace(',]',']')
            # Undo newline option if possible.
        if trace:
            r = sorted(set([z.replace('\n',' ') for z in aList1]))
            if True or len(r) > 1:
                sep = ' ' if known else '?'
                if 1:
                    caller = g.callers(2).split(',')[0]
                    g.trace('%30s %s <== %-40s' % (s2, sep, r), caller)
                else:
                    g.trace('%30s %s <== %s' % (s2, sep, r))
        return s2 if len(s2) < 25 else s
    while None in aList:
        aList.remove(None)
    if not aList:
        return show('None')
    r = sorted(set(aList))
    if not all([is_known_type(z) for z in r]):
        return show('Any', known=False)
    elif len(r) == 1:
        return show(r[0])
    if 'None' in r:
        kind = 'Optional'
        while 'None' in r:
            r.remove('None')
        return show('Optional[%s]' % r[0])
    r = reduce_numbers(r)
    if len(r) == 1:
        return show(r[0])
    elif newlines:
        return show('Union[\n    %s,\n]' % (',\n    '.join(sorted(r))))
    else:
        return show('Union[%s]' % (', '.join(sorted(r))))

def split_types(s):
    '''Split types on *outer level* commas.'''
    aList, i1, level = [], 0, 0
    for i, ch in enumerate(s):
        if ch == '[':
            level += 1
        elif ch == ']':
            level -= 1
        elif ch == ',' and level == 0:
            aList.append(s[i1:i])
            i1 = i+1
    aList.append(s[i1:].strip())
    return aList

def truncate(s, n):
    '''Return s truncated to n characers.'''
    return s if len(s) <= n else s[:n-3] + '...'


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
        gens = [z if z else '<**None**>' for z in gens] # Kludge: probable bug.
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
            # result.append('{\n' if keys else '{')
            result.append('{')
            items = []
            for i in range(len(keys)):
                items.append('%s:%s' % (keys[i], values[i]))
            result.append(', '.join(items))
            result.append('}')
            # result.append(',\n'.join(items))
            # result.append('\n}' if keys else '}')
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
        gens = [z if z else '<**None**>' for z in gens] # Kludge: probable bug.
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
        return '(%s)' % ', '.join(elts)

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


class AstArgFormatter (AstFormatter):
    '''
    Just like the AstFormatter class, except it prints the class
    names of constants instead of actual values.
    '''

    # Return generic markers to allow better pattern matches.

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


class LeoGlobals:
    '''A class supporting g.pdb and g.trace for compatibility with Leo.'''

    def _callerName(self, n=1, files=False):
        # print('_callerName: %s %s' % (n,files))
        try: # get the function name from the call stack.
            f1 = sys._getframe(n) # The stack frame, n levels up.
            code1 = f1.f_code # The code object
            name = code1.co_name
            if name == '__init__':
                name = '__init__(%s,line %s)' % (
                    self.shortFileName(code1.co_filename), code1.co_firstlineno)
            if files:
                return '%s:%s' % (self.shortFileName(code1.co_filename), name)
            else:
                return name # The code name
        except ValueError:
            # print('g._callerName: ValueError',n)
            return '' # The stack is not deep enough.
        except Exception:
            # es_exception()
            return '' # "<no caller name>"

    def callers(self, n=4, count=0, excludeCaller=True, files=False):
        '''Return a list containing the callers of the function that called g.callerList.

        If the excludeCaller keyword is True (the default), g.callers is not on the list.

        If the files keyword argument is True, filenames are included in the list.
        '''
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
        if count > 0: result = result[: count]
        sep = '\n' if files else ','
        return sep.join(result)

    def cls(self):
        '''Clear the screen.'''
        if sys.platform.lower().startswith('win'):
            os.system('cls')

    def pdb(self):
        try:
            import leo.core.leoGlobals as leo_g
            leo_g.pdb()
        except ImportError:
            import pdb
            pdb.set_trace()

    def shortFileName(self,fileName, n=None):
        if n is None or n < 1:
            return os.path.basename(fileName)
        else:
            return '/'.join(fileName.replace('\\', '/').split('/')[-n:])

    def splitLines(self, s):
        '''Split s into lines, preserving trailing newlines.'''
        return s.splitlines(True) if s else []

    def trace(self, *args, **keys):
        try:
            import leo.core.leoGlobals as leo_g
            leo_g.trace(caller_level=2, *args, **keys)
        except ImportError:
            print(args, keys)


class Pattern(object):
    '''
    A class representing regex or balanced patterns.
    
    Sample matching code, for either kind of pattern:
        
        for m in reversed(pattern.all_matches(s)):
            s = pattern.replace(m, s)
    '''

    def __init__ (self, find_s, repl_s=''):
        '''Ctor for the Pattern class.'''
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
                    result.append('\\'+ch)
            self.regex = re.compile(''.join(result))

    def __eq__(self, obj):
        """Return True if two Patterns are equivalent."""
        if isinstance(obj, Pattern):
            return self.find_s == obj.find_s and self.repl_s == obj.repl_s
        else:
            return NotImplemented

    def __ne__(self, obj):
        """Return True if two Patterns are not equivalent."""
        return not self.__eq__(obj)

    def __hash__(self):
        '''Pattern.__hash__'''
        return len(self.find_s) + len(self.repl_s)

    def __repr__(self):
        '''Pattern.__repr__'''
        return 'Pattern: %s ==> %s' % (self.find_s, self.repl_s)
        
    __str__ = __repr__

    def is_balanced(self):
        '''Return True if self.find_s is a balanced pattern.'''
        s = self.find_s
        if s.endswith('*'):
            return True
        for pattern in ('(*)', '[*]', '{*}'):
            if s.find(pattern) > -1:
                return True
        return False

    def is_regex(self):
        '''
        Return True if self.find_s is a regular pattern.
        For now a kludgy convention suffices.
        '''
        return self.find_s.endswith('$')
            # A dollar sign is not valid in any Python expression.

    def all_matches(self, s):
        '''
        Return a list of match objects for all matches in s.
        These are regex match objects or (start, end) for balanced searches.
        '''
        trace = False
        if self.is_balanced():
            aList, i = [], 0
            while i < len(s):
                progress = i
                j = self.full_balanced_match(s, i)
                if j is None:
                    i += 1
                else:
                    aList.append((i,j),)
                    i = j
                assert progress < i
            return aList
        else:
            return list(self.regex.finditer(s))

    def full_balanced_match(self, s, i):
        '''Return the index of the end of the match found at s[i:] or None.'''
        i1 = i
        trace = False
        if trace: g.trace(self.find_s, s[i:].rstrip())
        pattern = self.find_s
        j = 0 # index into pattern
        while i < len(s) and j < len(pattern) and pattern[j] in ('*', s[i]):
            progress = i
            if pattern[j:j+3] in ('(*)', '[*]', '{*}'):
                delim = pattern[j]
                i = self.match_balanced(delim, s, i)
                j += 3
            elif j == len(pattern)-1 and pattern[j] == '*':
                # A trailing * matches the rest of the string.
                j += 1
                i = len(s)
                break
            else:
                i += 1
                j += 1
            assert progress < i
        found = i <= len(s) and j == len(pattern)
        if trace and found:
            g.trace('%s -> %s' % (pattern, s[i1:i]))
        return i if found else None

    def match_balanced(self, delim, s, i):
        '''
        delim == s[i] and delim is in '([{'
        Return the index of the end of the balanced parenthesized string, or len(s)+1.
        '''
        trace = False
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
                    if trace: g.trace('found: %s' % s[i1:i])
                    return i
            assert progress < i
        # Unmatched: a syntax error.
        print('***** unmatched %s in %s' % (delim, s))
        return len(s) + 1

    def match(self, s, trace=False):
        '''
        Perform the match on the entire string if possible.
        Return (found, new s)
        '''
        trace = False or trace
        if self.is_balanced():
            j = self.full_balanced_match(s, 0)
            if j is None:
                return False, s
            else:
                s1 = s
                start, end = 0, len(s)
                s = self.replace_balanced(s, start, end)
                if trace: g.trace('%50s' % (truncate(s1,50)), self)
                return True, s
        else:
            m = self.regex.match(s)
            if m and m.group(0) == s:
                s1 = s
                s = self.replace_regex(m, s)
                if trace: g.trace('%50s' % (truncate(s1,50)), self)
                return True, s
            else:
                return False, s

    def match_entire_string(self, s):
        '''Return True if s matches self.find_s'''
        if self.is_balanced():
            j = self.full_balanced_match(s, 0)
            return j is not None
        else:
            m = self.regex.match(s)
            return m and m.group(0) == s

    def replace(self, m, s):
        '''Perform any kind of replacement.'''
        if self.is_balanced():
            start, end = m
            return self.replace_balanced(s, start, end)
        else:
            return self.replace_regex(m, s)

    def replace_balanced(self, s1, start, end):
        '''
        Use m (returned by all_matches) to replace s by the string implied by repr_s.
        Within repr_s, * star matches corresponding * in find_s
        '''
        trace = False
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
        assert i > -1 # i is an index into f AND s
        delim = f[i]
        if trace: g.trace('head', s[:i], f[:i])
        assert s[:i] == f[:i], (s[:i], f[:i])
        if trace: g.trace('delim',delim)
        k = self.match_balanced(delim, s, i)
        s_star = s[i+1:k-1]
        if trace: g.trace('s_star',s_star)
        repl = r[:j] + s_star + r[j+1:]
        if trace: g.trace('repl',self.repl_s,'==>',repl)
        return s1[:start] + repl + s1[end:]

    def replace_regex(self, m, s):
        '''Do the replacement in s specified by m.'''
        s = self.repl_s
        for i in range(9):
            group = '\\%s' % i
            if s.find(group) > -1:
                # g.trace(i, m.group(i))
                s = s.replace(group, m.group(i))
        return s


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
        self.config_fn = None
            # self.finalize('~/stubs/make_stub_files.cfg')
        self.enable_unit_tests = False
        self.files = [] # May also be set in the config file.
        # Ivars set in the config file...
        self.output_fn = None
        self.output_directory = self.finalize('.')
            # self.finalize('~/stubs')
        self.overwrite = False
        self.prefix_lines = []
        self.trace_matches = False
        self.trace_patterns = False
        self.trace_reduce = False
        self.trace_visitors = False
        self.update_flag = False
        self.verbose = False # Trace config arguments.
        self.warn = False
        # Pattern lists, set by config sections...
        self.section_names = (
            'Global', 'Def Name Patterns', 'General Patterns')
        self.def_patterns = [] # [Def Name Patterns]
        self.general_patterns = [] # [General Patterns]
        self.names_dict = {}
        self.op_name_dict = self.make_op_name_dict()
        self.patterns_dict = {}

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
        if self.files:
            dir_ = self.output_directory
            if dir_:
                if os.path.exists(dir_):
                    for fn in self.files:
                        self.make_stub_file(fn)
                else:
                    print('output directory not found: %s' % dir_)
            else:
                print('no output directory')
        elif not self.enable_unit_tests:
            print('no input files')

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
            help='full path to configuration file')
        add('-d', '--dir', dest='dir',
            help='full path to the output directory')
        add('-o', '--overwrite', action='store_true', default=False,
            help='overwrite existing stub (.pyi) files')
        add('-t', '--test', action='store_true', default=False,
            help='run unit tests on startup')
        add('--trace-matches', action='store_true', default=False,
            help='trace Pattern.matches')
        add('--trace-patterns', action='store_true', default=False,
            help='trace pattern creation')
        add('--trace-reduce', action='store_true', default=False,
            help='trace st.reduce_types')
        ### To do
        # add('--trace-visitors', action='store_true', default=False,
            # help='trace visitor results')
        add('-u', '--update', action='store_true', default=False,
            help='update existing stub file')
        add('-v', '--verbose', action='store_true', default=False,
            help='verbose output in .pyi file')
        add('-w', '--warn', action='store_true', default=False,
            help='warn about unannotated args')
        # Parse the options
        options, args = parser.parse_args()
        # Handle the options...
        self.enable_unit_tests=options.test
        self.overwrite = options.overwrite
        self.trace_matches = options.trace_matches
        self.trace_patterns = options.trace_patterns
        self.trace_reduce = options.trace_reduce
        ### self.trace_visitors = options.trace_visitors
        self.update_flag = options.update
        self.verbose = options.verbose
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
        trace = False
        if not self.config_fn:
            return
        self.parser = parser = self.create_parser()
        s = self.get_config_string()
        self.init_parser(s)
        if self.files:
            files_source = 'command-line'
            files = self.files
        elif parser.has_section('Global'):
            files_source = 'config file'
            files = parser.get('Global', 'files')
            files = [z.strip() for z in files.split('\n') if z.strip()]
        else:
            return
        files2 = []
        for z in files:
            files2.extend(glob.glob(self.finalize(z)))
        self.files = [z for z in files2 if z and os.path.exists(z)]
        if trace:
            print('Files (from %s)...\n' % files_source)
            for z in self.files:
                print(z)
            print('')
        if 'output_directory' in parser.options('Global'):
            s = parser.get('Global', 'output_directory')
            output_dir = self.finalize(s)
            if os.path.exists(output_dir):
                self.output_directory = output_dir
                if self.verbose:
                    print('output directory: %s\n' % output_dir)
            else:
                print('output directory not found: %s\n' % output_dir)
                self.output_directory = None # inhibit run().
        if 'prefix_lines' in parser.options('Global'):
            prefix = parser.get('Global', 'prefix_lines')
            self.prefix_lines = prefix.split('\n')
                # The parser does not preserve leading whitespace.
            if trace:
                print('Prefix lines...\n')
                for z in self.prefix_lines:
                    print(z)
                print('')
        self.def_patterns = self.scan_patterns('Def Name Patterns')
        self.general_patterns = self.scan_patterns('General Patterns')
        self.make_patterns_dict()

    def make_op_name_dict(self):
        '''
        Make a dict whose keys are operators ('+', '+=', etc),
        and whose values are lists of values of ast.Node.__class__.__name__.
        '''
        d = {
            '.':   ['Attr',],
            '(*)': ['Call', 'Tuple',],
            '[*]': ['List', 'Subscript',],
            '{*}': ['???',],
            ### 'and': 'BoolOp',
            ### 'or':  'BoolOp',
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

    def create_parser(self):
        '''Create a RawConfigParser and return it.'''
        parser = configparser.RawConfigParser(dict_type=OrderedDict)
            # Requires Python 2.7
        parser.optionxform = str
        return parser

    def find_pattern_ops(self, pattern):
        '''Return a list of operators in pattern.find_s.'''
        trace = False or self.trace_patterns
        d = self.op_name_dict
        keys1, keys2, keys3, keys9 = [], [], [], []
        for op in d:
            aList = d.get(op)
            if op.replace(' ','').isalnum():
                # an alpha op, like 'not, 'not in', etc.
                keys9.append(op)
            elif len(op) == 3:
                keys3.append(op)
            elif len(op) == 2:
                keys2.append(op)
            elif len(op) == 1:
                keys1.append(op)
            else:
                g.trace('bad op', op)
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
            if s.find(target) > -1:
                ops.append(op)
                break # Only one match allowed.
                
        if trace and ops: g.trace(s1, ops)
        return ops

    def get_config_string(self):
        
        fn = self.finalize(self.config_fn)
        if os.path.exists(fn):
            if self.verbose:
                print('\nconfiguration file: %s\n' % fn)
            f = open(fn, 'r')
            s = f.read()
            f.close()
            return s
        else:
            print('\nconfiguration file not found: %s' % fn)
            return ''
        

    def init_parser(self, s):
        '''Add double back-slashes to all patterns starting with '['.'''
        trace = False
        if not s: return
        aList = []
        for s in s.split('\n'):
            if self.is_section_name(s):
                aList.append(s)
            elif s.strip().startswith('['):
                aList.append(r'\\'+s[1:])
                if trace: g.trace('*** escaping:',s)
            else:
                aList.append(s)
        s = '\n'.join(aList)+'\n'
        if trace: g.trace(s)
        file_object = StringIO.StringIO(s)
        self.parser.readfp(file_object)

    def is_section_name(self, s):
        
        def munge(s):
            return s.strip().lower().replace(' ','')
        
        s = s.strip()
        if s.startswith('[') and s.endswith(']'):
            s = munge(s[1:-1])
            for s2 in self.section_names:
                if s == munge(s2):
                    return True
        return False

    def make_patterns_dict(self):
        '''Assign all patterns to the appropriate ast.Node.'''
        trace = False or self.trace_patterns
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
                if name == 'number':
                    aList = self.patterns_dict.get('Num', [])
                    aList.append(pattern)
                    self.patterns_dict['Num'] = aList
                elif name in self.names_dict:
                    g.trace('duplicate pattern', pattern)
                else:
                    self.names_dict [name] = pattern.repl_s
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
                    print('  '+repr(pattern))
        # Note: retain self.general_patterns for use in argument lists.

    def scan_patterns(self, section_name):
        '''Parse the config section into a list of patterns, preserving order.'''
        trace = False or self.trace_patterns
        parser = self.parser
        aList = []
        if parser.has_section(section_name):
            seen = set()
            for key in parser.options(section_name):
                value = parser.get(section_name, key)
                # A kludge: strip leading \\ from patterns.
                if key.startswith(r'\\'):
                    key = '[' + key[2:]
                    if trace: g.trace('removing escapes', key)
                if key in seen:
                    g.trace('duplicate key', key)
                else:
                    seen.add(key)
                    aList.append(Pattern(key, value))
            if trace:
                g.trace('%s...\n' % section_name)
                for z in aList:
                    print(z)
                print('')
        # elif trace:
            # print('no section: %s' % section_name)
            # print(parser.sections())
            # print('')
        return aList


class Stub(object):
    '''
    A class representing a stub: it's name, text, parent and children.
    This class is a prerequisite for -- update.
    '''

    def __init__(self, kind, name, parent):
        '''Stub ctor.'''
        self.children = []
        self.kind = kind
        self.name = name
        self.out_list = []
        self.parent = parent
        if parent:
            assert isinstance(parent, Stub)
            parent.children.append(self)

    def __repr__(self):
        '''Stub.__repr__.'''
        return 'Stub: %s' % self.name
        
    __str__ = __repr__

    def __eq__(self, obj):
        """Stub.__eq__. Return ordering among siblings."""
        if isinstance(obj, Stub):
            return self.name == obj.name
        else:
            return NotImplemented

    def __ne__(self, obj):
        """Stub.__ne__"""
        return not self.__eq__(obj)

    def __gt__(self, obj):
        '''Stub.__eq__. Return ordering among siblings..'''
        if isinstance(obj, Stub):
            return self.name > obj.name
        else:
            return NotImplemented

    def __lt__(self, other):
        return not self.__eq__(other) and not self.__gt__(other)
        
    def __ge__(self, other):
        return self.__eq__(other) or self.__gt__(other)

    def __le__(self, other):
        return self.__eq__(other) or self.__lt__(other)

    def __hash__(self):
        '''Stub.__hash__'''
        if self.parent:
            return self.parent.hash() + len(self.children)
        else:
            return len(self.children)

    def full_name(self):
        '''Return full path to top parent.'''
        if self.parent:
            return '%s.%s' % (self.parent.full_name(), self.name)
        else:
            return self.name


class StubFormatter (AstFormatter):
    '''
    Formats an ast.Node and its descendants,
    making pattern substitutions in Name and operator nodes.
    '''

    def __init__(self, controller):
        '''Ctor for StubFormatter class.'''
        self.controller = x = controller
        self.general_patterns = x.general_patterns
        self.names_dict = x.names_dict
        self.patterns_dict = x.patterns_dict
        self.trace_matches = x.trace_matches
        self.trace_patterns = x.trace_patterns
        self.trace_reduce = x.trace_reduce
        self.trace_visitors = x.trace_visitors
        self.verbose = x.verbose

    matched_d = {}

    def match_all(self, node, s):
        '''Match all the patterns for the given node.'''
        trace = False or self.trace_matches
        d = self.matched_d
        name = node.__class__.__name__
        for pattern in self.patterns_dict.get(name, []):
            s1 = s
            found, s = pattern.match(s,trace=trace)
            if found:
                if trace:
                    aList = d.get(name, [])
                    if pattern not in aList:
                        aList.append(pattern)
                        d [name] = aList
                        g.trace('%46s %s' % (name, pattern))
                break
        return s

    def visit(self, node):
        '''StubFormatter.visit: supports --verbose tracing.'''
        s = AstFormatter.visit(self, node)
        # if self.verbose:
            # g.trace('%12s %s' % (node.__class__.__name__,s))
        return s

    # StubFormatter visitors for operands...

    # Attribute(expr value, identifier attr, expr_context ctx)

    attrs_seen = []

    def do_Attribute(self, node):
        '''StubFormatter.do_Attribute.'''
        trace = False
        s = '%s.%s' % (
            self.visit(node.value),
            node.attr) # Don't visit node.attr: it is always a string.
        s2 = self.names_dict.get(s)
        if trace and s2 and s2 not in self.attrs_seen:
            self.attrs_seen.append(s2)
            g.trace(s, '==>', s2)
        return s2 or s

    # Return generic markers to allow better pattern matches.

    def do_Bytes(self, node): # Python 3.x only.
        return 'bytes' # return str(node.s)

    def do_Num(self, node):
        # make_patterns_dict treats 'number' as a special case.
        # return self.names_dict.get('number', 'number')
        return 'number' # return repr(node.n)

    def do_Str(self, node):
        '''This represents a string constant.'''
        return 'str' # return repr(node.s)

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
        else:
            print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
                repr(keys), repr(values)))
        # return ''.join(result)
        return 'Dict[%s]' % ''.join(result)

    def do_List(self, node):
        '''StubFormatter.List.'''
        elts = [self.visit(z) for z in node.elts]
        elst = [z for z in elts if z] # Defensive.
        # g.trace('=====',elts)
        return 'List[%s]' % ', '.join(elts)

    seen_names = []

    def do_Name(self, node):
        '''StubFormatter ast.Name visitor.'''
        trace = False
        d = self.names_dict
        name = d.get(node.id, node.id)
        s = 'bool' if name in ('True', 'False') else name
        if trace and node.id not in self.seen_names:
            self.seen_names.append(node.id)
            if d.get(node.id):
                g.trace(node.id, '==>', d.get(node.id))
            elif node.id == 'aList':
                g.trace('**not found**', node.id)
        return s

    def do_Tuple(self, node):
        '''StubFormatter.Tuple.'''
        elts = [self.visit(z) for z in node.elts]
        if 1:
            return 'Tuple[%s]' % ', '.join(elts)
        else:
            s = '(%s)' % ', '.join(elts)
            return self.match_all(node, s)
        # return 'Tuple[%s]' % ', '.join(elts)

    # StubFormatter visitors for operators...

    def do_BinOp(self, node):
        '''StubFormatter.BinOp visitor.'''
        trace = False
        numbers = ['number', 'complex', 'float', 'long', 'int',]
        op = self.op_name(node.op)
        lhs = self.visit(node.left)
        rhs = self.visit(node.right)
        if op.strip() in ('is', 'is not', 'in', 'not in'):
            return 'bool'
        elif lhs == rhs:
            return lhs ### Perhaps not always right.
        elif lhs in numbers and rhs in numbers:
            return reduce_types([lhs, rhs], trace=self.trace_reduce)
                # At present, visitors must return strings.
                # even if Union[x,y] causes trouble later.
                # reduce_numbers would be wrong: it returns a list.
        elif lhs == 'str' and op in '%*':
            return 'str'
        else:
            if trace and lhs == 'str':
                g.trace('***** unknown string op', lhs, op, rhs)
            # Fall back to the base-class behavior.
            return '%s%s%s' % (
                self.visit(node.left),
                self.op_name(node.op),
                self.visit(node.right))

    def do_BoolOp(self, node): # Python 2.x only.
        '''
        StubFormatter ast.BoolOp visitor for 'and' and 'or'.
        Neither necessarily returns a Boolean.
        '''
        # op_name = self.op_name(node.op)
        values = [self.visit(z) for z in node.values]
        return reduce_types(values, trace=self.trace_reduce)
            # At present, visitors must return strings.
            # even if Union[x,y] causes trouble later.

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
        # Explicit pattern:
        if func in ('dict', 'list', 'set', 'tuple',):
            s = '%s[%s]' % (func.capitalize(), ', '.join(args))
        else:
            s = '%s(%s)' % (func, ', '.join(args))
        return self.match_all(node, s)

    # keyword = (identifier arg, expr value)

    def do_keyword(self, node):
        # node.arg is a string.
        value = self.visit(node.value)
        # This is a keyword *arg*, not a Python keyword!
        return '%s=%s' % (node.arg, value)

    def do_Compare(self, node):
        '''
        StubFormatter ast.Compare visitor for these ops:
        '==', '!=', '<', '<=', '>', '>=', 'is', 'is not', 'in', 'not in',
        '''
        return 'bool' # This *is* correct.

    def do_IfExp(self, node):
        '''StubFormatter ast.IfExp (ternary operator) visitor.'''
        if 0:
            return '%s if %s else %s ' % (
                self.visit(node.body),
                self.visit(node.test),
                self.visit(node.orelse))
        else:
            # At present, visitors must return strings.
            # even if Union[x,y] causes trouble later.
            return reduce_types(
                [self.visit(node.body), self.visit(node.orelse)],
                trace=self.trace_reduce)

    # Subscript(expr value, slice slice, expr_context ctx)

    def do_Subscript(self, node):
        '''StubFormatter.Subscript.'''
        value = self.visit(node.value)
        the_slice = self.visit(node.slice)
        s = '%s[%s]' % (value, the_slice)
        return self.match_all(node, s)

    def do_UnaryOp(self, node):
        '''StubFormatter ast.UnaryOp visitor.'''
        op = self.op_name(node.op)
        if op.strip() in ('not',):
            return 'bool'
        else:
            s ='%s%s' % (
                self.op_name(node.op),
                self.visit(node.operand))
            return self.match_all(node, s)

    def do_Return(self, node):
        '''
        StubFormatter ast.Return vsitor.
        Return only the return expression itself.
        '''
        s = AstFormatter.do_Return(self, node)
        assert s.startswith('return'), repr(s)
        return s[len('return'):].strip()


class StubTraverser (ast.NodeVisitor):
    '''An ast.Node traverser class that outputs a stub for each class or def.'''

    def __init__(self, controller):
        '''Ctor for StubTraverser class.'''
        self.controller = x = controller
            # A StandAloneMakeStubFile instance.
        # Internal state ivars...
        self.class_name_stack = []
        sf = StubFormatter(controller)
        self.format = sf.format
        self.arg_format = AstArgFormatter().format
        self.in_function = False
        self.level = 0
        self.output_file = None
        self.parent_stub = None
        self.raw_format = AstFormatter().format
        self.returns = []
        self.warn_list = []
        # Copies of controller ivars...
        self.output_fn = x.output_fn
        self.overwrite = x.overwrite
        self.prefix_lines = x.prefix_lines
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
        

    def indent(self, s):
        '''Return s, properly indented.'''
        # This version of indent *is* used.
        return '%s%s' % (' ' * 4 * self.level, s)

    def out(self, s):
        '''Output the string to the console or the file.'''
        s = self.indent(s)
        if self.parent_stub:
            self.parent_stub.out_list.append(s)
        elif self.output_file:
            self.output_file.write(s+'\n')
        else:
            print(s)

    def output_stubs(self, stub, sort_flag):
        '''Output this stub and all its descendants.'''
        for s in stub.out_list or []:
            # Indentation must be present when an item is added to stub.out_list.
            if self.output_file:
                self.output_file.write(s+'\n')
            else:
                print(s)
        children = sorted(stub.children) if sort_flag else stub.children
        for child in children:
            self.output_stubs(child, sort_flag)

    def run(self, node):
        '''StubTraverser.run: write the stubs in node's tree to self.output_fn.'''
        fn = self.output_fn
        dir_ = os.path.dirname(fn)
        if os.path.exists(fn) and not self.overwrite:
            print('file exists: %s' % fn)
        elif not dir_ or os.path.exists(dir_):
            t1 = time.clock()
            # Delayed output allows sorting.
            self.parent_stub = Stub('root','Root',parent=None)
            for z in self.prefix_lines or []:
                self.parent_stub.out_list.append(z)
            self.visit(node)
            if self.update_flag:
                self.update(fn)
            self.output_file = open(fn, 'w')
            self.output_stubs(self.parent_stub, sort_flag=True)
            self.output_file.close()
            self.output_file = None
            self.parent_stub = None
            t2 = time.clock()
            print('wrote: %s in %4.2f sec' % (fn, t2-t1))
        else:
            print('output directory not not found: %s' % dir_)


    def update(self, fn):
        '''Alter self.parent_stub so it contains only updated stubs.'''
        g.trace('--update not ready yet')
        s = self.get_stub_file(fn)
        if not s.strip():
            return
        stub = self.parse_stub_file(s)
        if not stub:
            return
        
        # Compare the stub file with the stubs about to be written.
        
        # Merge the old, unchanged, stubs with the new stubs.

    def get_stub_file(self, fn):
        '''Read the stub file into s.'''
        g.trace(fn)
        if os.path.exists(fn):
            try:
                s = open(fn, 'r').read()
            except Exception:
                print('--update: error reading %s' % fn)
                s = ''
            return s
        else:
            print('--update: not found: %s' % fn)
            return ''
        

    def parse_stub_file(self, s):
        '''
        Parse the stub file whose contents is s into a tree of Stubs.
        
        Parse the file by hand, so that --update can be run with Python 2.
        '''
        return None

    # ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

    def visit_ClassDef(self, node):

        old_stub = self.parent_stub
        self.parent_stub = Stub('class', node.name, old_stub)
        # Format...
        if not node.name.startswith('_'):
            if node.bases:
                s = '(%s)' % ', '.join([self.format(z) for z in node.bases])
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
        self.parent_stub = old_stub

    # FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

    def visit_FunctionDef(self, node):
        
        # Do nothing if we are already in a function.
        # We do not generate stubs for inner defs.
        if self.in_function: # or node.name.startswith('_'):
            return
        old_stub = self.parent_stub
        self.parent_stub = Stub('def', node.name, old_stub)
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
        self.parent_stub = old_stub

    # arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

    def format_arguments(self, node):
        '''
        Format the arguments node.
        Similar to AstFormat.do_arguments, but it is not a visitor!
        '''
        assert isinstance(node,ast.arguments), node
        args = [self.raw_format(z) for z in node.args]
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
        for pattern in self.general_patterns:
            if pattern.match_entire_string(s):
                return '%s: %s' % (s, pattern.repl_s)
        if self.warn and s not in self.warn_list:
            self.warn_list.append(s)
            print('no annotation for %s' % s)
        return s + ': Any'

    def format_returns(self, node):
        '''
        Calculate the return type:
        - Return None if there are no return statements.
        - Patterns in [Def Name Patterns] override all other patterns.
        - Otherwise, return a list of return values.
        '''
        trace = False
        name = self.get_def_name(node)
        raw = [self.raw_format(z) for z in self.returns]
        r = [self.format(z) for z in self.returns]
            # Allow StubFormatter.do_Return to do the hack.
        # Step 1: Return None if there are no return statements.
        if trace and self.returns:
            g.trace('name: %s r:\n%s' % (name, r))
        if not [z for z in self.returns if z.value != None]:
            return 'None: ...'
        # Step 2: [Def Name Patterns] override all other patterns.
        for pattern in self.def_patterns:
            found, s = pattern.match(name)
            if found:
                if trace:
                    g.trace('*name pattern %s: %s -> %s' % (
                        pattern.find_s, name, s))
                return s + ': ...'
        # Step 3: Calculate return types.
        return self.format_return_expressions(raw, r)

    def format_return_expressions(self, raw_returns, reduced_returns):
        '''
        aList is a list of maximally reduced return expressions.
        For each expression e in Alist:
        - If e is a single known type, add e to the result.
        - Otherwise, add Any # e to the result.
        Return the properly indented result.
        '''
        assert len(raw_returns) == len(reduced_returns)
        lws =  '\n' + ' '*4
        n = len(raw_returns)
        known = all([is_known_type(e) for e in reduced_returns])
        if not known or self.verbose:
            # First, generate the return lines.
            aList = []
            for i in range(n):
                e, raw = reduced_returns[i], raw_returns[i]
                known = ' ' if is_known_type(e) else '?'
                aList.append('# %s %s: %s' % (' ', i, raw))
                aList.append('# %s %s: return %s' % (known, i, e))
            results = ''.join([lws + self.indent(z) for z in aList])
            # Put the return lines in their proper places.
            if known:
                s = reduce_types(reduced_returns,
                                 newlines=True,
                                 trace=self.trace_reduce)
                return s + ': ...' + results
            else:
                return 'Any: ...' + results
        else:
            s = reduce_types(reduced_returns,
                             newlines=True,
                             trace=self.trace_reduce)
            return s + ': ...'

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

    def visit_Return(self, node):

        self.returns.append(node)
            # New: return the entire node, not node.value.


class TestClass:
    '''
    A class containing constructs that have caused difficulties.
    This is in the make_stub_files directory, not the test directory.
    '''
    # pylint: disable=no-member
    # pylint: disable=undefined-variable
    # pylint: disable=no-self-argument
    # pylint: disable=no-method-argument

    def parse_group(group):
        if len(group) >= 3 and group[-2] == 'as':
            del group[-2:]
        ndots = 0
        i = 0
        while len(group) > i and group[i].startswith('.'):
            ndots += len(group[i])
            i += 1
        assert ''.join(group[:i]) == '.'*ndots, group
        del group[:i]
        assert all(g == '.' for g in group[1::2]), group
        return ndots, os.sep.join(group[::2])

    def return_all(self):
        return all([is_known_type(z) for z in s3.split(',')])
        # return all(['abc'])

    def return_array():
        return f(s[1:-1])

    def return_list(self, a):
        return [a]

    def return_two_lists(s):
        if 1:
            return aList
        else:
            return list(self.regex.finditer(s))
g = LeoGlobals() # For ekr.
if __name__ == "__main__":
    main()
