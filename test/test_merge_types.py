import unittest

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
        def merge_types(a1, a2):
            '''
            a1 and a2 may be strings or lists.
            return a list containing both of them, flattened, without duplicates.
            '''
            # Not used at present, and perhaps never.
            # Only useful if visitors could return either lists or strings.
            assert a1 is not None
            assert a2 is not None
            r1 = a1 if isinstance(a1, (list, tuple)) else [a1]
            r2 = a2 if isinstance(a2, (list, tuple)) else [a2]
            return sorted(set(r1 + r2))
        for a1, a2, expected in table:
            got = merge_types(a1, a2)
            assert expected == got, (a1, a2, 'expected:', expected, 'got', got)
