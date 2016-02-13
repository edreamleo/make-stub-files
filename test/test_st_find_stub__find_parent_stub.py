import unittest
from make_stub_files import *

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

