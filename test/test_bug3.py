import unittest
from make_stub_files import *

class test_bug3 (unittest.TestCase):
    def runTest(self):
        # https://github.com/edreamleo/make-stub-files/issues/3
        commands = [
            # 'cls',
            'python make_stub_files.py -c make_stub_files.cfg -o -s bug3.py',
        ]
        g.execute_shell_commands(commands, trace=True)
        with open('bug3.pyi') as f:
            s = f.read()
        lines = g.splitLines(s)
        # Ignore the first 4 lines of the generated .pyi file.
        got = ''.join(lines[4:])
        # The input file 
        expected = '''\
        class UnsupportedAlgorithm(Exception):
            def __init__(self, message: Any, reason: Optional[str]=None) -> None: ...
        '''
        assert got == expected, 'expected:\n%s\ngot:\n%s' % (expected, got)

