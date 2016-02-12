import unittest

class test_split_types (unittest.TestCase):
    def runTest(self):
        table = (
            ('list',                    ['list']),
            ('List[a,b]',               ['List[a,b]']),
            ('List[a,b], List[c,d]',    ['List[a,b]', 'List[c,d]']),
        )
        def split_types(s):
            '''Split types on *outer level* commas.'''
            aList, i1, level = [], 0, 0
            for i, ch in enumerate(s):
                if ch == '[':
                    level += 1
                elif ch == ']':
                    level -= 1
                elif ch == ',' and level == 0:
                    aList.append(s[i1:i])
                    i1 = i+1
            aList.append(s[i1:].strip())
            return aList
        for s, expected in table:
            got = split_types(s)
            assert expected == got, (s, 'expected', expected, 'got', got)
