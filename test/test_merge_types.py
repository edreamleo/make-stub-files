import unittest
from make_stub_files import *

class test_merge_types (unittest.TestCase):
    def runTest(self):
        a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
        none = 'None'
        La, Lc = ['Any'], ['complex']
        Lac, Lai, Lan = ['Any', 'complex'], ['Any', 'int'], ['Any', 'None']
        Laci = ['Any', 'complex', 'int']
        Lnone = ['None']
        table = (
            (none, Lnone,   Lnone),
            (none, none,    Lnone),
            (a, none,       Lan),
            (a, a,          La),
            (La, a,         La),
            (Lac, a,        Lac),
            (Lac, i,        Laci),
            (Lac, Lai,      Laci),
        )
        for a1, a2, expected in table:
            got = merge_types(a1, a2)
            assert expected == got, (a1, a2, 'expected:', expected, 'got', got)

