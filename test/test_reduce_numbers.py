import unittest

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
        def reduce_numbers(aList):
            '''
            Return aList with all number types in aList replaced by the most
            general numeric type in aList.
            '''
            found = None
            numbers = ('number', 'complex', 'float', 'long', 'int')
            for kind in numbers:
                for z in aList:
                    if z == kind:
                        found = kind
                        break
                if found:
                    break
            if found:
                assert found in numbers, found
                aList = [z for z in aList if z not in numbers]
                aList.append(found)
            return aList
        for aList, expected in table:
            got = reduce_numbers(aList)
            assert expected == got,  (aList, 'expected:', expected, 'got', got)
