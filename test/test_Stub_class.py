import unittest

class test_Stub_class (unittest.TestCase):
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
        g = LeoGlobals() # Use the g available to the script.
        # g.cls()
        # Test equality...
        stub1 = Stub(kind='def', name='foo')
        stub2 = Stub(kind='class', name='foo')
        stub3 = Stub(kind='def', name='bar')
        stub4 = Stub(kind='def', name='foo')
        stub4.out_list = ['xyzzy']
            # Contents of out_list must not affect equality!
        aList = [stub1, stub3]
        assert stub1 != stub2
        assert stub1 != stub3
        assert stub1 == stub4
        assert stub1 in aList
        assert stub2 not in aList
        assert stub3 in aList
        # Test __hash__
        d = {stub1: 'stub1'}
        assert stub1 in d
        assert stub2 not in d
        # Test parents and level.
        stub_1 = Stub(kind='def', name='stub_1')
        stub_2 = Stub(kind='def', name='stub_2', parent=stub_1, stack=['stub_1'])
        stub_3 = Stub(kind='def', name='stub_3', parent=stub_2, stack=['stub_1', 'stub_2'])
        assert stub_1.parents() == [], stub_1.parents()
        assert stub_2.parents() == ['stub_1'], stub_2.parents()
        assert stub_3.parents() == ['stub_1', 'stub_2'], stub_3.parents()
        assert stub_1.level() == 0
        assert stub_2.level() == 1
        assert stub_3.level() == 2
