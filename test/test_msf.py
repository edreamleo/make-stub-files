import unittest

# Globals
g = None
msf = None

class TestMakeStubFiles(unittest.TestCase):
    """Unit tests for the make_stub_files program."""
    @classmethod
    def setUpClass(cls):
        
        global g, msf
        import make_stub_files as msf
        from make_stub_files import LeoGlobals as g

    def test_pattern_class(self):
        table = (
            # regex tests. The pattern must end with $
            ('[str]', r'\[str\]$', 'xxx', 'xxx'), # Guido bug.
            ('s3', r's[1-3]?$', 'str', 'str'), # lengthening bug.
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
            # pdb.set_trace()
            pattern = msf.Pattern(find, repl)
            result = pattern.match_entire_string(s)
            assert result, (result, s, find, repl, expected)
            aList = pattern.all_matches(s)
            assert len(aList) == 1, aList
            found, s2 = pattern.match(s)
            assert found, 'after pattern.match(s)'
            assert s2 == expected, ('expected', expected, 'got', s2)
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
        """Test that is_known_type handles brackets reasonably."""
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
        ### c = msf.StandAloneMakeStubFile()
        for s in good:
            assert msf.is_known_type(s), s
        for s in bad:
            assert not msf.is_known_type(s), s

    def test_merge_types(self):
        a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
        none = 'None'
        La, Lc = ['Any'], ['complex']
        Lac, Lai, Lan = ['Any', 'complex'], ['Any', 'int'], ['Any', 'None']
        Laci = ['Any', 'complex', 'int']
        Lnone = ['None']
        table = (
            (none, Lnone,   Lnone),
            (none, none,    Lnone),
            (a, none,       Lan),
            (a, a,          La),
            (La, a,         La),
            (Lac, a,        Lac),
            (Lac, i,        Laci),
            (Lac, Lai,      Laci),
        )
        for a1, a2, expected in table:
            got = msf.merge_types(a1, a2)
            self.assertEqual(got, expected)

    def test_Pattern_class(self):
        
        ### Remove @others.
        ### @others
        
        ### g = LeoGlobals() # Use the g available to the script.
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
            pattern = msf.Pattern(find, repl)
            result = pattern.match_entire_string(s)
            assert result, (result, s, find, repl, expected)
            aList = pattern.all_matches(s)
            assert len(aList) == 1, aList
            found, got = pattern.match(s)
            assert found, 'after pattern.match(s)'
            self.assertEqual(got, expected)
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
        assert p1.match_entire_string('abc')
        assert not p1.match_entire_string('abcx')

    def test_reduce_numbers(self):
        
        ### Remove the @others. 

        a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
        table = (
            ([i,i],     [i]),
            ([i],       [i]),
            ([f, i],    [f]),
            ([c, i],    [c]),
            ([l, a],    [a, l]),
        )
        for aList, expected in table:
            got = msf.ReduceTypes().reduce_numbers(aList)
            self.assertEqual(got, expected)

    def test_reduce_types(self):
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
            got = msf.ReduceTypes(aList).reduce_types()
            if expected != got:
                print('aList', aList)
            self.assertEqual(got, expected)

    def test_split_types(self):
        table = (
            ('list',                    ['list']),
            ('List[a,b]',               ['List[a,b]']),
            ('List[a,b], List[c,d]',    ['List[a,b]', 'List[c,d]']),
        )
        for s, expected in table:
            got = msf.ReduceTypes().split_types(s)
            self.assertEqual(got, expected)

    def test_find_stub(self):

        s = """\
    def is_known_type(s: str) -> Union[Any,bool]: ...
    def main() -> None: ...
    def merge_types(a1: Any, a2: Any) -> str: ...

    class AstFormatter:
        def format(self, node: Node) -> Union[Any,str]: ...
            def helper(self): -> None
        def visit(self, node: Node) -> str: ...
        def do_ClassDef(self, node: Node) -> str: ...
        def do_FunctionDef(self, node: Node) -> str: ...
    """
        st = msf.StubTraverser(controller=g.NullObject())
        d, root = st.parse_stub_file(s, root_name='<root>')
        # print(st.trace_stubs(root, header='root'))
        stub1 = msf.Stub(kind='class', name='AstFormatter')
        stub2 = msf.Stub(kind='def', name='format', parent=stub1, stack=['AstFormatter'])
        stub3 = msf.Stub(kind='def', name='helper', parent = stub2, stack=['AstFormatter', 'format'])
        # stub4 = Stub(kind='def', name='main')
        for stub in (stub1, stub2, stub3,): # (stub1, stub2, stub3):
            found = st.find_stub(stub, root)
            id_found = found and id(found) or None
            if 0:
                print('found  %s => %9s %35s ==> %s' % (id(stub), id_found, stub, found))
            found = st.find_parent_stub(stub, root)
            id_found = found and id(found) or None
            if 0:
                print('parent %s => %9s %35s ==> %s' % (id(stub), id_found, stub, found))
    def test_flatten_stubs(self):

        s = """\
    def is_known_type(s: str) -> Union[Any,bool]: ...
    def main() -> None: ...
    def merge_types(a1: Any, a2: Any) -> str: ...

    class AstFormatter:
        def format(self, node: Node) -> Union[Any,str]: ...
            def helper(self): -> None
        def visit(self, node: Node) -> str: ...
        def do_ClassDef(self, node: Node) -> str: ...
        def do_FunctionDef(self, node: Node) -> str: ...
    """
        st = msf.StubTraverser(controller=g.NullObject())
        d, root = st.parse_stub_file(s, root_name='<root>')
        if 0:
            print(st.trace_stubs(root, header='root'))
        aList = st.flatten_stubs(root)
        assert aList
        if 0:
            for i, stub in enumerate(aList):
                print('%2s %s' % (i, stub))
        for stub in aList:
            found = st.find_stub(stub, root)
            assert found, stub

    def test_merge_stubs(self):
        # To do:
        # - Test between-stub lines and leading lines.
        # - Round-trip tests!
        # To be INSERTED (They exist in new stubs, but not here.)
        # def is_known_type(s: str) -> Union[Any,bool]: ...
        # def reduce_numbers(aList: List[Any]) -> List[Any]: ...
        # class AstFormatter:
            # def format(self, node: Node) -> Union[Any,str]: ...
            # def visit(self, node: Node) -> str: ...
            # def do_ClassDef(self, node: Node) -> str: ...
            # def do_FunctionDef(self, node: Node) -> str: ...
        old_s = """\
        def main() -> None: ...
        def merge_types(a1: Any, a2: Any) -> str: ...
        def pdb(self) -> None: ...
        def reduce_types(aList: List[Any], name: str=None, trace: bool=False) -> Any: ...
        class Pattern(object):
            def __init__(self, find_s: str, repl_s: str='') -> None: ...
            def __eq__(self, obj: Any) -> bool: ...
            def __ne__(self, obj: Any) -> bool: ...
            def __hash__(self) -> int: ...
            def __repr__(self) -> str: ...
            def is_balanced(self) -> bool: ...
            def is_regex(self) -> Any: ...
                #   0: return self.find_s.endswith('$')
                # ? 0: return self.find_s.endswith(str)
        """
        # To be DELETED (They exist in old_stubs, but not here)
        # class Pattern(object):
            # def __init__(self, find_s: str, repl_s: str='') -> None: ...
            # def __eq__(self, obj: Any) -> bool: ...
            # def __ne__(self, obj: Any) -> bool: ...
            # def __hash__(self) -> int: ...
            # def __repr__(self) -> str: ...
            # def is_balanced(self) -> bool: ...
            # def is_regex(self) -> Any: ...
                # #   0: return self.find_s.endswith('$')
                # # ? 0: return self.find_s.endswith(str)
        new_s = """\
        def is_known_type(s: str) -> Union[Any,bool]: ...
        def main() -> None: ...
        def merge_types(a1: Any, a2: Any) -> str: ...
        def pdb(self) -> None: ...
        def reduce_numbers(aList: List[Any]) -> List[Any]: ...
        def reduce_types(aList: List[Any], name: str=None, trace: bool=False) -> Any: ...

        class AstFormatter:
            def format(self, node: Node) -> Union[Any,str]: ...
            def visit(self, node: Node) -> str: ...
            def do_ClassDef(self, node: Node) -> str: ...
            def do_FunctionDef(self, node: Node) -> str: ...
        """
        st = msf.StubTraverser(controller=g.NullObject())
        # dump('old_s', old_s)
        # dump('new_s', new_s)
        old_d, old_root = st.parse_stub_file(old_s, root_name='<old-root>')
        new_d, new_root = st.parse_stub_file(new_s, root_name='<new-root>')
        if 0:
            msf.dump_dict('old_d', old_d)
            msf.dump_dict('new_d', new_d)
            print(st.trace_stubs(old_root, header='trace_stubs(old_root)'))
            print(st.trace_stubs(new_root, header='trace_stubs(new_root)'))
        if 0: # separate unit test. Passed.
            aList = st.sort_stubs_by_hierarchy(new_root)
            msf.dump_list(aList, 'after sort_stubs_by_hierarcy')
        new_stubs = new_d.values()
        st.merge_stubs(new_stubs, old_root, new_root, trace=False)
        if 0:
            print(st.trace_stubs(old_root, header='trace_stubs(old_root)'))

    def test_Stub_class(self):
        # Test equality...
        stub1 = msf.Stub(kind='def', name='foo')
        stub2 = msf.Stub(kind='class', name='foo')
        stub3 = msf.Stub(kind='def', name='bar')
        stub4 = msf.Stub(kind='def', name='foo')
        stub4.out_list = ['xyzzy']
            # Contents of out_list must not affect equality!
        aList = [stub1, stub3]
        assert stub1 != stub2
        assert stub1 != stub3
        assert stub1 == stub4
        assert stub1 in aList
        assert stub2 not in aList
        assert stub3 in aList
        # Test __hash__
        d = {stub1: 'stub1'}
        assert stub1 in d
        assert stub2 not in d
        # Test parents and level.
        stub_1 = msf.Stub(kind='def', name='stub_1')
        stub_2 = msf.Stub(kind='def', name='stub_2', parent=stub_1, stack=['stub_1'])
        stub_3 = msf.Stub(kind='def', name='stub_3', parent=stub_2, stack=['stub_1', 'stub_2'])
        assert stub_1.parents() == [], stub_1.parents()
        assert stub_2.parents() == ['stub_1'], stub_2.parents()
        assert stub_3.parents() == ['stub_1', 'stub_2'], stub_3.parents()
        assert stub_1.level() == 0
        assert stub_2.level() == 1
        assert stub_3.level() == 2
    def test_truncate(self):

        table = (
            ('abc',     'abc'),
            ('abcd',    'abcd'),
            ('abcde',   'abcde'),
            ('abcdef',  'ab...'),
            ('abcdefg', 'ab...'),
        )
        for s1, expected in table:
            got = msf.truncate(s1, 5)
            self.assertEqual(got, expected)
    if 0:
        def test_bug_2_empty(self):
        
            # https://github.com/edreamleo/make-stub-files/issues/2
            commands = [
                # 'cls',
                'python make_stub_files.py -o -s bug2.py',
            ]
            g.execute_shell_commands(commands, trace=False)
            with open('bug2.pyi') as f:
                s = f.read()
            lines = g.splitLines(s)
            expected = 'class InvalidTag(Exception): ...\n'
            got = lines[1]
            self.assertEqual(got, expected)
    if 0:
        def test_bug2_non_empty(self):
            # https://github.com/edreamleo/make-stub-files/issues/2
            commands = [
                # 'cls',
                'python make_stub_files.py -o -s bug2a.py',
            ]
            g.execute_shell_commands(commands, trace=False)
            with open('bug2a.pyi') as f:
                s = f.read()
            lines = g.splitLines(s)
            expected = 'class NonEmptyClass:\n'
            got = lines[1]
            self.assertEqual(got, expected)
    if 0:
        def xxxtest_bug_3 (self):
            # https://github.com/edreamleo/make-stub-files/issues/3
            # https://github.com/edreamleo/make-stub-files/issues/11
            commands = [
                # 'cls',
                'python make_stub_files.py -c make_stub_files.cfg -o -s bug3.py',
            ]
            g.execute_shell_commands(commands, trace=False)
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
            self.assertEqual(got, expected)
    
if __name__ == '__main__':
    unittest.main()
