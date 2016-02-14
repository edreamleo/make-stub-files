import unittest
from make_stub_files import *

class test_reduce_numbers (unittest.TestCase):
    def runTest(self):
        a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
        table = (
            ([i,i],     [i]),
            ([i],       [i]),
            ([f, i],    [f]),
            ([c, i],    [c]),
            ([l, a],    [a, l]),
        )
        for aList, expected in table:
            got = ReduceTypes().reduce_numbers(aList)
            assert expected == got,  (aList, 'expected:', expected, 'got', got)

