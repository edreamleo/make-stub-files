import unittest

class test_st_find_stub__find_parent_stub (unittest.TestCase):
    def runTest(self):
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
        import time
        try:
            import StringIO as io # Python 2
        except ImportError:
            import io # Python 3
        s = '''\
        def is_known_type(s: str) -> Union[Any,bool]: ...
        def main() -> None: ...
        def merge_types(a1: Any, a2: Any) -> str: ...
        class AstFormatter:
            def format(self, node: Node) -> Union[Any,str]: ...
                def helper(self): -> None
            def visit(self, node: Node) -> str: ...
            def do_ClassDef(self, node: Node) -> str: ...
            def do_FunctionDef(self, node: Node) -> str: ...
        '''
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
                    assert type(s) == type('abc'), (node, type(s))
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
                return node.arg
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
            def do_NameConstant(self, node): # Python 3 only.
                s = repr(node.value)
                return 'bool' if s in ('True', 'False') else s
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
            class NullObject:
                """
                An object that does nothing, and does it very well.
                From the Python cookbook, recipe 5.23
                """
                def __init__(self, *args, **keys): pass
                def __call__(self, *args, **keys): return self
                def __repr__(self): return "NullObject"
                def __str__(self): return "NullObject"
                def __bool__(self): return False
                def __nonzero__(self): return 0
                def __delattr__(self, attr): return self
                def __getattr__(self, attr): return self
                def __setattr__(self, attr, val): return self
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
        class StubFormatter (AstFormatter):
            '''
            Formats an ast.Node and its descendants,
            making pattern substitutions in Name and operator nodes.
            '''
            def __init__(self, controller, traverser):
                '''Ctor for StubFormatter class.'''
                self.controller = x = controller
                self.traverser = traverser
                    # 2016/02/07: to give the formatter access to the class_stack.
                self.def_patterns = x.def_patterns
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
                s1 = truncate(s, 40)
                caller = g.callers(2).split(',')[1].strip()
                    # The direct caller of match_all.
                for pattern in self.patterns_dict.get(name, []):
                    found, s = pattern.match(s,trace=False)
                    if found:
                        if trace:
                            aList = d.get(name, [])
                            if pattern not in aList:
                                aList.append(pattern)
                                d [name] = aList
                                print('match_all:    %-12s %26s %40s ==> %s' % (caller, pattern, s1, s))
                        break
                return s
            def visit(self, node):
                '''StubFormatter.visit: supports --verbose tracing.'''
                s = AstFormatter.visit(self, node)
                # if self.verbose:
                    # g.trace('%12s %s' % (node.__class__.__name__,s))
                return s
            def trace_visitor(self, node, op, s):
                '''Trace node's visitor.'''
                if self.trace_visitors:
                    caller = g.callers(2).split(',')[1]
                    s1 = AstFormatter().format(node).strip()
                    print('%12s %6s: %s ==> %s' % (caller, op.strip(), s1, s))
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
            # BinOp(expr left, operator op, expr right)
            def do_BinOp(self, node):
                '''StubFormatter.BinOp visitor.'''
                trace = False or self.trace_reduce ; verbose = False
                numbers = ['number', 'complex', 'float', 'long', 'int',]
                op = self.op_name(node.op)
                lhs = self.visit(node.left)
                rhs = self.visit(node.right)
                if op.strip() in ('is', 'is not', 'in', 'not in'):
                    s = 'bool'
                elif lhs == rhs:
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
                    if trace and verbose and lhs == 'str':
                        g.trace('***** unknown string op', lhs, op, rhs)
                    # Fall back to the base-class behavior.
                    s = '%s%s%s' % (
                        self.visit(node.left),
                        op,
                        self.visit(node.right))
                s = self.match_all(node, s)
                self.trace_visitor(node, op, s)
                return s
            # BoolOp(boolop op, expr* values)
            def do_BoolOp(self, node): # Python 2.x only.
                '''StubFormatter.BoolOp visitor for 'and' and 'or'.'''
                trace = False or self.trace_reduce
                op = self.op_name(node.op)
                values = [self.visit(z).strip() for z in node.values]
                s = reduce_types(values, trace=trace)
                s = self.match_all(node, s)
                self.trace_visitor(node, op, s)
                return s
            # Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)
            def do_Call(self, node):
                '''StubFormatter.Call visitor.'''
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
                s = self.match_all(node, s)
                self.trace_visitor(node, 'call', s)
                return s
            # keyword = (identifier arg, expr value)
            def do_keyword(self, node):
                # node.arg is a string.
                value = self.visit(node.value)
                # This is a keyword *arg*, not a Python keyword!
                return '%s=%s' % (node.arg, value)
            # Compare(expr left, cmpop* ops, expr* comparators)
            def do_Compare(self, node):
                '''
                StubFormatter ast.Compare visitor for these ops:
                '==', '!=', '<', '<=', '>', '>=', 'is', 'is not', 'in', 'not in',
                '''
                s = 'bool' # Correct regardless of arguments.
                ops = ','.join([self.op_name(z) for z in node.ops])
                self.trace_visitor(node, ops, s)
                return s
            # If(expr test, stmt* body, stmt* orelse)
            def do_IfExp(self, node):
                '''StubFormatterIfExp (ternary operator).'''
                trace = False or self.trace_reduce
                aList = [
                    self.match_all(node, self.visit(node.body)),
                    self.match_all(node, self.visit(node.orelse)),
                ]
                s = reduce_types(aList, trace=trace)
                s = self.match_all(node, s)
                self.trace_visitor(node, 'if', s)
                return s
            # Subscript(expr value, slice slice, expr_context ctx)
            def do_Subscript(self, node):
                '''StubFormatter.Subscript.'''
                s = '%s[%s]' % (
                    self.visit(node.value),
                    self.visit(node.slice))
                s = self.match_all(node, s)
                self.trace_visitor(node, '[]', s)
                return s
            # UnaryOp(unaryop op, expr operand)
            def do_UnaryOp(self, node):
                '''StubFormatter.UnaryOp for unary +, -, ~ and 'not' operators.'''
                op = self.op_name(node.op)
                s = 'bool' if op.strip() is 'not' else self.visit(node.operand)
                s = self.match_all(node, s)
                self.trace_visitor(node, op, s)
                return s
            def do_Return(self, node):
                '''
                StubFormatter ast.Return vsitor.
                Return only the return expression itself.
                '''
                s = AstFormatter.do_Return(self, node)
                assert s.startswith('return'), repr(s)
                return s[len('return'):].strip()
        class Stub(object):
            '''
            A class representing all the generated stub for a class or def.
            stub.full_name should represent the complete context of a def.
            '''
            def __init__(self, kind, name, parent=None, stack=None):
                '''Stub ctor. Equality depends only on full_name and kind.'''
                self.children = []
                self.full_name = '%s.%s' % ('.'.join(stack), name) if stack else name
                self.kind = kind
                self.name = name
                self.out_list = []
                self.parent = parent
                self.stack = stack # StubTraverser.context_stack.
                if stack:
                    assert stack[-1] == parent.name, (stack[-1], parent.name)
                if parent:
                    assert isinstance(parent, Stub)
                    parent.children.append(self)
            def __eq__(self, obj):
                '''
                Stub.__eq__. Return whether two stubs refer to the same method.
                Do *not* test parent links. That would interfere with --update logic.
                '''
                if isinstance(obj, Stub):
                    return self.full_name == obj.full_name and self.kind == obj.kind
                else:
                    return NotImplemented
            def __ne__(self, obj):
                """Stub.__ne__"""
                return not self.__eq__(obj)
            def __hash__(self):
                '''Stub.__hash__. Equality depends *only* on full_name and kind.'''
                return len(self.kind) + sum([ord(z) for z in self.full_name])
            def __repr__(self):
                '''Stub.__repr__.'''
                return 'Stub: %s %s' % (id(self), self.full_name)
            def __str__(self):
                '''Stub.__repr__.'''
                return 'Stub: %s' % self.full_name
            def level(self):
                '''Return the number of parents.'''
                return len(self.parents())
            def parents(self):
                '''Return a list of this stub's parents.'''
                return self.full_name.split('.')[:-1]
        class StubTraverser (ast.NodeVisitor):
            '''
            An ast.Node traverser class that outputs a stub for each class or def.
            Names of visitors must start with visit_. The order of traversal does
            not matter, because so few visitors do anything.
            '''
            def __init__(self, controller):
                '''Ctor for StubTraverser class.'''
                self.controller = x = controller
                    # A StandAloneMakeStubFile instance.
                # Internal state ivars...
                self.class_name_stack = []
                self.context_stack = []
                sf = StubFormatter(controller=controller,traverser=self)
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
            def add_stub(self, d, stub):
                '''Add the stub to d, checking that it does not exist.'''
                trace = False ; verbose = False
                key = stub.full_name
                assert key
                if key in d:
                    caller = g.callers(2).split(',')[1]
                    g.trace('Ignoring duplicate entry for %s in %s' % (stub, caller))
                else:
                    d [key] = stub
                    if trace and verbose:
                        caller = g.callers(2).split(',')[1]
                        g.trace('%17s %s' % (caller, stub.full_name))
                    elif trace:
                        g.trace(stub.full_name)
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
            def run(self, node):
                '''StubTraverser.run: write the stubs in node's tree to self.output_fn.'''
                fn = self.output_fn
                dir_ = os.path.dirname(fn)
                if os.path.exists(fn) and not self.overwrite:
                    print('file exists: %s' % fn)
                elif not dir_ or os.path.exists(dir_):
                    t1 = time.clock()
                    # Delayed output allows sorting.
                    self.parent_stub = Stub(kind='root', name='<new-stubs>')
                    for z in self.prefix_lines or []:
                        self.parent_stub.out_list.append(z)
                    self.visit(node)
                        # Creates parent_stub.out_list.
                    if self.update_flag:
                        self.parent_stub = self.update(fn, new_root=self.parent_stub)
                    if 1:
                        self.output_file = open(fn, 'w')
                        self.output_time_stamp()
                        self.output_stubs(self.parent_stub)
                        self.output_file.close()
                        self.output_file = None
                        self.parent_stub = None
                    t2 = time.clock()
                    print('wrote: %s in %4.2f sec' % (fn, t2 - t1))
                else:
                    print('output directory not not found: %s' % dir_)
            def output_stubs(self, stub):
                '''Output this stub and all its descendants.'''
                for s in stub.out_list or []:
                    # Indentation must be present when an item is added to stub.out_list.
                    if self.output_file:
                        self.output_file.write(s.rstrip()+'\n')
                    else:
                        print(s)
                # Recursively print all children.
                for child in stub.children:
                    self.output_stubs(child)
            def output_time_stamp(self):
                '''Put a time-stamp in the output file.'''
                if self.output_file:
                    self.output_file.write('# make_stub_files: %s\n' %
                        time.strftime("%a %d %b %Y at %H:%M:%S"))
            def update(self, fn, new_root):
                '''
                Merge the new_root tree with the old_root tree in fn (a .pyi file).
                new_root is the root of the stub tree from the .py file.
                old_root (read below) is the root of stub tree from the .pyi file.
                Return old_root, or new_root if there are any errors.
                '''
                trace = False ; verbose = False
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
                    if trace and verbose:
                        print(self.trace_stubs(old_root, header='old_root'))
                        print(self.trace_stubs(new_root, header='new_root'))
                    print('***** updating stubs from %s *****' % fn)
                    self.merge_stubs(self.stubs_dict.values(), old_root, new_root)
                    if trace:
                        print(self.trace_stubs(old_root, header='updated_root'))
                    return old_root
                else:
                    return new_root
            def get_stub_file(self, fn):
                '''Read the stub file into s.'''
                if os.path.exists(fn):
                    try:
                        s = open(fn, 'r').read()
                    except Exception:
                        print('--update: error reading %s' % fn)
                        s = None
                    return s
                else:
                    print('--update: not found: %s' % fn)
                    return None
            def parse_stub_file(self, s, root_name):
                '''
                Parse s, the contents of a stub file, into a tree of Stubs.
                Parse by hand, so that --update can be run with Python 2.
                '''
                trace = False
                assert '\t' not in s
                d = {}
                root = Stub(kind='root', name=root_name)
                indent_stack = [-1] # To prevent the root from being popped.
                stub_stack = [root]
                lines = []
                pat = re.compile(r'^([ ]*)(def|class)\s+([a-zA-Z_]+)(.*)')
                for line in g.splitLines(s):
                    m = pat.match(line)
                    if m:
                        indent, kind, name, rest = (
                            len(m.group(1)), m.group(2), m.group(3), m.group(4))
                        old_indent = indent_stack[-1]
                        # Terminate any previous lines.
                        old_stub = stub_stack[-1]
                        old_stub.out_list.extend(lines)
                        if trace:
                            for s in lines:
                                g.trace('  '+s.rstrip())
                        lines = [line]
                        # Adjust the stacks.
                        if indent == old_indent:
                            stub_stack.pop()
                        elif indent > old_indent:
                            indent_stack.append(indent)
                        else: # indent < old_indent
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
                        if trace:
                            g.trace('%s%5s %s %s' % (' '*indent, kind, name, rest))
                    else:
                        parent = stub_stack[-1]
                        lines.append(line)
                # Terminate the last stub.
                old_stub = stub_stack[-1]
                old_stub.out_list.extend(lines)
                if trace:
                    for s in lines:
                        g.trace('  '+s.rstrip())
                return d, root
            def merge_stubs(self, new_stubs, old_root, new_root, trace=False):
                '''
                Merge the new_stubs *list* into the old_root *tree*.
                - new_stubs is a list of Stubs from the .py file.
                - old_root is the root of the stubs from the .pyi file.
                - new_root is the root of the stubs from the .py file.
                '''
                trace = False or trace ; verbose = False
                # Part 1: Delete old stubs do *not* exist in the *new* tree.
                aList = self.check_delete(new_stubs,
                                          old_root,
                                          new_root,
                                          trace and verbose)
                    # Checks that all ancestors of deleted nodes will be deleted.
                aList = list(reversed(self.sort_stubs_by_hierarchy(aList)))
                    # Sort old stubs so that children are deleted before parents.
                if trace and verbose:
                    dump_list('ordered delete list', aList)
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
            def check_delete(self, new_stubs, old_root, new_root, trace):
                '''Return a list of nodes that can be deleted.'''
                old_stubs = self.flatten_stubs(old_root)
                old_stubs.remove(old_root)
                aList = [z for z in old_stubs if z not in new_stubs]
                if trace:
                    dump_list('old_stubs', old_stubs)
                    dump_list('new_stubs', new_stubs)
                    dump_list('to-be-deleted stubs', aList)
                delete_list = []
                # Check that all parents of to-be-delete nodes will be deleted.
                for z in aList:
                    z1 = z
                    for i in range(20):
                        z = z.parent
                        if not z:
                            g.trace('can not append: new root not found', z)
                            break
                        elif z == old_root:
                            # if trace: g.trace('can delete', z1)
                            delete_list.append(z1)
                            break
                        elif z not in aList:
                            g.trace("can not delete %s because of %s" % (z1, z))
                            break
                    else:
                        g.trace('can not happen: parent loop')
                if trace:
                    dump_list('delete_list', delete_list)
                return delete_list
            def flatten_stubs(self, root):
                '''Return a flattened list of all stubs in root's tree.'''
                aList = [root]
                for child in root.children:
                    self.flatten_stubs_helper(child, aList)
                return aList
            def flatten_stubs_helper(self, root, aList):
                '''Append all stubs in root's tree to aList.'''
                aList.append(root)
                for child in root.children:
                    self.flatten_stubs_helper(child, aList)
            def find_parent_stub(self, stub, root):
                '''Return stub's parent **in root's tree**.'''
                return self.find_stub(stub.parent, root) if stub.parent else None
            def find_stub(self, stub, root):
                '''Return the stub **in root's tree** that matches stub.'''
                if stub == root: # Must use Stub.__eq__!
                    return root # not stub!
                for child in root.children:
                    stub2 = self.find_stub(stub, child)
                    if stub2: return stub2
                return None
            def sort_stubs_by_hierarchy(self, stubs1):
                '''
                Sort the list of Stubs so that parents appear before all their
                descendants.
                '''
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
                g.trace('can not happen: unbounded stub levels.')
                return [] # Abort the merge.
            def trace_stubs(self, stub, aList=None, header=None, level=-1):
                '''Return a trace of the given stub and all its descendants.'''
                indent = ' '*4*max(0,level)
                if level == -1:
                    aList = ['===== %s...\n' % (header) if header else '']
                for s in stub.out_list:
                    aList.append('%s%s' % (indent, s.rstrip()))
                for child in stub.children:
                    self.trace_stubs(child, level=level+1, aList=aList)
                if level == -1:
                    return '\n'.join(aList) + '\n'
            # ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)
            def visit_ClassDef(self, node):
                # Create the stub in the old context.
                old_stub = self.parent_stub
                self.parent_stub = Stub('class', node.name,old_stub, self.context_stack)
                self.add_stub(self.stubs_dict, self.parent_stub)
                # Enter the new context.
                self.class_name_stack.append(node.name)
                self.context_stack.append(node.name)
                if self.trace_matches or self.trace_reduce:
                    print('\nclass %s\n' % node.name)
                # Format...
                if not node.name.startswith('_'):
                    if node.bases:
                        s = '(%s)' % ', '.join([self.format(z) for z in node.bases])
                    else:
                        s = ''
                    self.out('class %s%s:' % (node.name, s))
                # Visit...
                self.level += 1
                for z in node.body:
                    self.visit(z)
                self.context_stack.pop()
                self.class_name_stack.pop()
                self.level -= 1
                self.parent_stub = old_stub
            # FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)
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
                # if self.trace_matches or self.trace_reduce:
                    # if not self.class_name_stack:
                        # print('def %s\n' % node.name)
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
                if name:
                    if hasattr(ast, 'arg'): # python 3:
                        name = self.raw_format(name)
                    result.append('*' + name)
                name = getattr(node, 'kwarg', None)
                if name:
                    if hasattr(ast, 'arg'): # python 3:
                        name = self.raw_format(name)
                    result.append('**' + name)
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
                # Step 3: remove recursive calls.
                raw, r = self.remove_recursive_calls(name, raw, r)
                # Step 4: Calculate return types.
                return self.format_return_expressions(name, raw, r)
            def format_return_expressions(self, name, raw_returns, reduced_returns):
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
                                         name=name,
                                         trace=self.trace_reduce)
                        return s + ': ...' + results
                    else:
                        return 'Any: ...' + results
                else:
                    s = reduce_types(reduced_returns,
                                     name=name,
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
            def remove_recursive_calls(self, name, raw, reduced):
                '''Remove any recursive calls to name from both lists.'''
                # At present, this works *only* if the return is nothing but the recursive call.
                assert len(raw) == len(reduced)
                pattern = Pattern('%s(*)' % name)
                n = len(reduced)
                raw_result, reduced_result = [], []
                for i in range(n):
                    if pattern.match_entire_string(reduced[i]):
                        g.trace('****', name, pattern, reduced[i])
                    else:
                        raw_result.append(raw[i])
                        reduced_result.append(reduced[i])
                return raw_result, reduced_result
            def visit_Return(self, node):
                self.returns.append(node)
                    # New: return the entire node, not node.value.
        g = LeoGlobals() # Use the g available to the script.
        st = StubTraverser(controller=g.NullObject())
        d, root = st.parse_stub_file(s, root_name='<root>')
            # Root *is* used below.
        if 0:
            print(st.trace_stubs(root, header='root'))
        stub1 = Stub(kind='class', name='AstFormatter')
        stub2 = Stub(kind='def', name='format', parent=stub1, stack=['AstFormatter'])
        stub3 = Stub(kind='def', name='helper', parent = stub2, stack=['AstFormatter', 'format'])
        # stub4 = Stub(kind='def', name='main')
        for stub in (stub1, stub2, stub3,): # (stub1, stub2, stub3):
            found = st.find_stub(stub, root)
            id_found = found and id(found) or None
            if 0:
                print('found  %s => %9s %35s ==> %s' % (id(stub), id_found, stub, found))
            found = st.find_parent_stub(stub, root)
            id_found = found and id(found) or None
            if 0:
                print('parent %s => %9s %35s ==> %s' % (id(stub), id_found, stub, found))
