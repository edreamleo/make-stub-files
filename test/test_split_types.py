import unittest
from make_stub_files import *

class test_split_types (unittest.TestCase):
    def runTest(self):
        table = (
            ('list',                    ['list']),
            ('List[a,b]',               ['List[a,b]']),
            ('List[a,b], List[c,d]',    ['List[a,b]', 'List[c,d]']),
        )
        for s, expected in table:
            got = ReduceTypes().split_types(s)
            assert expected == got, (s, 'expected', expected, 'got', got)

