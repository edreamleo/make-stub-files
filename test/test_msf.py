import unittest
import make_stub_files as msf

class TestMakeStubFiles(unittest.TestCase):
    '''Main test class.'''
    # def setUp(self):
        # '''Called before each test.'''
    def test_pattern_class(self):
        
        table = (
            ('s', 's', 'str', 'str'),
            ('abc', 'abc', 'ABC', 'ABC'),
            ('str(str)', 'str(*)', 'str', 'str'),
        )
        
        for s, find, repl, result in table:
            pattern = msf.Pattern(find, repl)
            assert pattern.match_entire_string(s), (s, find, repl)

    def test_is_known_type(self):
        '''Test that is_known_type handles brackets reasonably.'''
        good = (
            'Any', 'Sequence',
            'Sequence[]',
            'Sequence[List]',
            'Sequence[List[Any]]',
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
