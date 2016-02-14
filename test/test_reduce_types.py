import unittest
from make_stub_files import *

class test_reduce_types (unittest.TestCase):
    def runTest(self):
        a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
        none = 'None'
        x = 'xyzzy'
        y = 'pdq'
        table = (
            ([i,i],         i),
            ([i],           i),
            ([f, i],        f),
            ([c, i],        c),
            ([l, a],        'Union[Any, long]'),
            # Handle None
            ([None],        none),
            ([None, None],  none),
            ([None, a, c],  'Optional[Union[Any, complex]]'),
            # Handle unknown types, and special cases
            ([i, x],        'Union[Any, int]'),
            ([None, x],     'Optional[Any]'),
            ([none, x],     'Optional[Any]'),
            (['', x],       'Optional[Any]'),
            ([none, x, c],  'Optional[Union[Any, complex]]'),
            ([x, y],        'Any'),
            # Collection merging.  More could be done...
            (['Dict[int, str]', 'Dict[Any, str]'],          'Union[Dict[Any, str], Dict[int, str]]'),
            (['List[int, str]', 'List[Any, str]'],          'Union[List[Any, str], List[int, str]]'),
            (['Union[int, str]', 'Union[Any, str]'],        'Union[Union[Any, str], Union[int, str]]'),
            (['Union[int, str]', 'int', 'Union[Any, str]'], 'Union[Union[Any, str], Union[int, str], int]'),
            (['Tuple[xyz, pdq]'],                           'Tuple[Any, Any]'),
        )
        for aList, expected in table:
            got = ReduceTypes(aList).reduce_types()
            assert expected == got, '\naList:    %s\nexpected: %s\ngot:      %s' % (aList, expected, got)

