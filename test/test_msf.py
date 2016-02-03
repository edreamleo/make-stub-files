import pdb
import unittest
import make_stub_files as msf

class TestMakeStubFiles(unittest.TestCase):
    '''Main test class.'''
    # def setUp(self):
        # '''Called before each test.'''
    def test_pattern_class(self):
        
        trace = False
        table = (
            # Unused regex tests.
            # ('[str]', r'\[str\]', 'xxx', 'xxx'), # Guido bug.
            # ('s3', r's[1-3]?\b', 'str', 'str'), # lengthening bug.
            ('s', 's', 'str', 'str'),
            ('abc', 'abc', 'ABC', 'ABC'),
            ('str(str)', 'str(*)', 'str', 'str'),
            ('[whatever]', '[*]', 'List[*]', 'List[whatever]'), # * on the RHS.
            ('(int,str)', '(*)', 'Tuple[*]', 'Tuple[int,str]'), # Guido bug 2.
            ('abcxyz', 'abc*', 'xxx', 'xxx'), # New test for trailing *.
        )
        for s, find, repl, expected in table:
            # pdb.set_trace()
            pattern = msf.Pattern(find, repl)
            result = pattern.match_entire_string(s, trace=trace)
            assert result, (result, s, find, repl, expected)
            aList = pattern.all_matches(s, trace=trace)
            assert len(aList) == 1, aList
        p1 = msf.Pattern('abc','xyz')
        p2 = msf.Pattern('abc','xyz')
        p3 = msf.Pattern('abc','pdq')
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


    def test_is_known_type(self):
        '''Test that is_known_type handles brackets reasonably.'''
        good = (
            'Any', 'Sequence',
            'Sequence[]',
            'Sequence[List]',
            'Sequence[List[Any]]',
            'Tuple[int,str]',
        )
        bad = (
            'Huh', 'Sequence(List)',
            'List+a',
            'List+List',
        )
        c = msf.StandAloneMakeStubFile()
        for s in good:
            assert msf.StubTraverser(c).is_known_type(s), s
        for s in bad:
            assert not msf.StubTraverser(c).is_known_type(s), s
    
if __name__ == '__main__':
    unittest.main()
