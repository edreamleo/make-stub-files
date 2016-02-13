import unittest
from make_stub_files import *

class test_truncate (unittest.TestCase):
    def runTest(self):
        table = (
            ('abc',     'abc'),
            ('abcd',    'abcd'),
            ('abcde',   'abcde'),
            ('abcdef',  'ab...'),
            ('abcdefg', 'ab...'),
        )
        for s1, s2 in table:
            got = truncate(s1, 5)
            assert s2 == got, (s1, 'expected', s2, 'got', got)

