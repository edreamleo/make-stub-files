import unittest
from make_stub_files import *

class test_bug2_non_empty (unittest.TestCase):
    def runTest(self):
        # https://github.com/edreamleo/make-stub-files/issues/2
        commands = [
            # 'cls',
            'python make_stub_files.py -o -s bug2a.py',
        ]
        g.execute_shell_commands(commands, trace=True)
        with open('bug2a.pyi') as f:
            s = f.read()
        lines = g.splitLines(s)
        expected = 'class NonEmptyClass:\n'
        got = lines[1]
        assert got == expected, 'expected: %r\ngot:    %r' % (expected, got)

