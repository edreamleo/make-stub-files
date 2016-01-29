import unittest
import make_stub_files as msf

class TestMakeStubFiles(unittest.TestCase):
    '''Main test class.'''
    def setUp(self):
        '''Called before each test.'''
    def test_pattern_class(self):
        
        table = (
            ('s', 's', 'str', 'str'),
            ('abc', 'abc', 'ABC', 'ABC'),
            ('str(str)', 'str(*)', 'str', 'str'),
        )
        
        for s, find, repl, result in table:
            pattern = msf.Pattern(find, repl)
            assert pattern.match_entire_string(s), (s, find, repl)
    def test2(self):
        pass
    
if __name__ == '__main__':
    unittest.main()
