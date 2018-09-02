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
        # Test only the last two linse of the generated .pyi file.
        got = ''.join(lines[-2:])
        # The input file 
        expected = (
            'class UnsupportedAlgorithm(Exception):\n' 
            '    def __init__(self, message: Any, reason: Optional[str]=None) -> None: ...\n'
        )
        assert got == expected, '\nexpected:\n%s\ngot:\n%s' % (expected, got)

