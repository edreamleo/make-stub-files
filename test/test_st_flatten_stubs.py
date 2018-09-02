import unittest
from make_stub_files import *

class test_st_flatten_stubs (unittest.TestCase):
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
        if 0:
            print(st.trace_stubs(root, header='root'))
        aList = st.flatten_stubs(root)
        assert aList
        if 0:
            for i, stub in enumerate(aList):
                print('%2s %s' % (i, stub))
        for stub in aList:
            found = st.find_stub(stub, root)
            assert found, stub

