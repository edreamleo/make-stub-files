import unittest
from make_stub_files import *

class test_reduce_types (unittest.TestCase):
    def runTest(self):
        a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
        none = 'None'
        table = (
            ([i,i],     i),
            ([i],       i),
            ([f, i],    f),
            ([c, i],    c),
            ([l, a],    'Union[Any, long]'),
            # Handle None
            ([None],        none),
            ([None, None],  none),
            ([None, a, c],  'Union[Any, complex]'),
        )
        for aList, expected in table:
            got = ReduceTypes(aList).reduce_types()
            assert expected == got, (aList, 'expected:', expected, 'got', got)

