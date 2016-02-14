import unittest
from make_stub_files import *

class test_Pattern_class (unittest.TestCase):
    def runTest(self):
        import re
        g = LeoGlobals() # Use the g available to the script.
        table = (
            # s,  Pattern.find_s, Pattern.repl_s, expected
            # Passed...
            ('aabbcc', '(a+)(b+)(c+)$', r'\3\2\1', 'ccbbaa'),
            ('[str]', r'\[str\]$', 'xxx', 'xxx'), # Guido bug.
            ('s3', r's[1-3]?\b$', 'str', 'str'), # lengthening bug.
            ('s', 's', 'str', 'str'),
            ('abc', 'abc', 'ABC', 'ABC'),
            ('str(str)', 'str(*)', 'str', 'str'),
            ('[whatever]', '[*]', 'List[*]', 'List[whatever]'), # * on the RHS.
            ('(int,str)', '(*)', 'Tuple[*]', 'Tuple[int,str]'), # Guido bug 2.
            ('abcxyz', 'abc*', 'xxx', 'xxx'), # New test for trailing *.
            ('list(self.regex.finditer(str))','list(*)','List[*]',
             'List[self.regex.finditer(str)]'),
        )
        for s, find, repl, expected in table:
            pattern = Pattern(find, repl)
            result = pattern.match_entire_string(s)
            assert result, (result, s, find, repl, expected)
            aList = pattern.all_matches(s)
            assert len(aList) == 1, aList
            found, s2 = pattern.match(s)
            assert found, 'after pattern.match(s)'
            assert s2 == expected, (s, pattern, 'expected', expected, 'got', s2)
        p1 = Pattern('abc','xyz')
        p2 = Pattern('abc','xyz')
        p3 = Pattern('abc','pdq')
        assert p1 == p2
        assert p1 != p3
        assert p2 != p3
        aSet = set()
        aSet.add(p1)
        assert p1 in aSet
        assert p2 in aSet
        assert p3 not in aSet
        assert list(aSet) == [p1] == [p2]
        aSet.add(p3)
        assert p1.match_entire_string('abc')
        assert not p1.match_entire_string('abcx')

