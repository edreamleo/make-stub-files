import unittest
from make_stub_files import *

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

