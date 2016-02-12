import unittest

class test_Pattern_class (unittest.TestCase):
    def runTest(self):
        # Top-level functions
        def dump(title, s=None):
            if s:
                print('===== %s...\n%s\n' % (title, s.rstrip()))
            else:
                print('===== %s...\n' % title)
        def dump_dict(title, d):
            '''Dump a dictionary with a header.'''
            dump(title)
            for z in sorted(d):
                print('%30s %s' % (z, d.get(z)))
            print('')
        def dump_list(title, aList):
            '''Dump a list with a header.'''
            dump(title)
            for z in aList:
                print(z)
            print('')
        def is_known_type(s):
            '''
            Return True if s is nothing but a single known type.
            Recursively test inner types in square brackets.
            '''
            trace = False
            s1 = s
            s = s.strip()
            table = (
                # None,
                'None', 
                'complex', 'float', 'int', 'long', 'number',
                'dict', 'list', 'tuple',
                'bool', 'bytes', 'str', 'unicode',
            )
            for s2 in table:
                if s2 == s:
                    return True
                elif Pattern(s2+'(*)', s).match_entire_string(s):
                    return True
            if s.startswith('[') and s.endswith(']'):
                inner = s[1:-1]
                return is_known_type(inner) if inner else True
            elif s.startswith('(') and s.endswith(')'):
                inner = s[1:-1]
                return is_known_type(inner) if inner else True
            elif s.startswith('{') and s.endswith('}'):
                return True ### Not yet.
                # inner = s[1:-1]
                # return is_known_type(inner) if inner else True
            table = (
                # Pep 484: https://www.python.org/dev/peps/pep-0484/
                # typing module: https://docs.python.org/3/library/typing.html
                'AbstractSet', 'Any', 'AnyMeta', 'AnyStr',
                'BinaryIO', 'ByteString',
                'Callable', 'CallableMeta', 'Container',
                'Dict', 'Final', 'Generic', 'GenericMeta', 'Hashable',
                'IO', 'ItemsView', 'Iterable', 'Iterator',
                'KT', 'KeysView', 'List',
                'Mapping', 'MappingView', 'Match',
                'MutableMapping', 'MutableSequence', 'MutableSet',
                'NamedTuple', 'Optional', 'OptionalMeta',
                # 'POSIX', 'PY2', 'PY3',
                'Pattern', 'Reversible',
                'Sequence', 'Set', 'Sized',
                'SupportsAbs', 'SupportsFloat', 'SupportsInt', 'SupportsRound',
                'T', 'TextIO', 'Tuple', 'TupleMeta',
                'TypeVar', 'TypingMeta',
                'Undefined', 'Union', 'UnionMeta',
                'VT', 'ValuesView', 'VarBinding',
            )
            for s2 in table:
                if s2 == s:
                    return True
                pattern = Pattern(s2+'[*]', s)
                if pattern.match_entire_string(s):
                    # Look inside the square brackets.
                    # if s.startswith('Dict[List'): g.pdb()
                    brackets = s[len(s2):]
                    assert brackets and brackets[0] == '[' and brackets[-1] == ']'
                    s3 = brackets[1:-1]
                    if s3:
                        return all([is_known_type(z.strip())
                            for z in split_types(s3)])
                    else:
                        return True
            if trace: g.trace('Fail:', s1)
            return False
        def main():
            '''
            The driver for the stand-alone version of make-stub-files.
            All options come from ~/stubs/make_stub_files.cfg.
            '''
            # g.cls()
            controller = StandAloneMakeStubFile()
            controller.scan_command_line()
            controller.scan_options()
            controller.run()
            print('done')
        def merge_types(a1, a2):
            '''
            a1 and a2 may be strings or lists.
            return a list containing both of them, flattened, without duplicates.
            '''
            # Not used at present, and perhaps never.
            # Only useful if visitors could return either lists or strings.
            assert a1 is not None
            assert a2 is not None
            r1 = a1 if isinstance(a1, (list, tuple)) else [a1]
            r2 = a2 if isinstance(a2, (list, tuple)) else [a2]
            return sorted(set(r1 + r2))
        def pdb(self):
            '''Invoke a debugger during unit testing.'''
            try:
                import leo.core.leoGlobals as leo_g
                leo_g.pdb()
            except ImportError:
                import pdb
                pdb.set_trace()
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
        def reduce_types(aList, name=None, trace=False):
            '''
            Return a string containing the reduction of all types in aList.
            The --trace-reduce command-line option sets trace=True.
            If present, name is the function name or class_name.method_name.
            '''
            trace = False or trace
            def show(s, known=True):
                '''Bind the arguments to show_helper.'''
                return show_helper(aList[:], known, name, s, trace)
            while None in aList:
                aList.remove(None)
            if not aList:
                return show('None')
            r = sorted(set(aList))
            if not all([is_known_type(z) for z in r]):
                return show('Any', known=False)
            elif len(r) == 1:
                return show(r[0])
            if 'None' in r:
                kind = 'Optional'
                while 'None' in r:
                    r.remove('None')
                return show('Optional[%s]' % r[0])
            r = reduce_numbers(r)
            if len(r) == 1:
                return show(r[0])
            else:
                return show('Union[%s]' % (', '.join(sorted(r))))
        def show_helper(aList, known, name, s, trace):
            '''Show the result of the reduction.'''
            s = s.strip()
            if trace and (not known or len(aList) > 1):
                if name:
                    if name.find('.') > -1:
                        context = ''.join(name.split('.')[1:])
                    else:
                        context = name
                else:
                    context = g.callers(3).split(',')[0].strip()
                context = truncate(context, 26)
                known = '' if known else '? '
                pattern = sorted(set([z.replace('\n',' ') for z in aList]))
                pattern = '[%s]' % truncate(', '.join(pattern), 53-2)
                print('reduce_types: %-26s %53s ==> %s%s' % (context, pattern, known, s))
                    # widths above match the corresponding indents in match_all and match.
            return s
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
        def truncate(s, n):
            '''Return s truncated to n characers.'''
            return s if len(s) <= n else s[:n-3] + '...'
        class LeoGlobals:
            '''A class supporting g.pdb and g.trace for compatibility with Leo.'''
            class NullObject:
                """
                An object that does nothing, and does it very well.
                From the Python cookbook, recipe 5.23
                """
                def __init__(self, *args, **keys): pass
                def __call__(self, *args, **keys): return self
                def __repr__(self): return "NullObject"
                def __str__(self): return "NullObject"
                def __bool__(self): return False
                def __nonzero__(self): return 0
                def __delattr__(self, attr): return self
                def __getattr__(self, attr): return self
                def __setattr__(self, attr, val): return self
            def _callerName(self, n=1, files=False):
                # print('_callerName: %s %s' % (n,files))
                try: # get the function name from the call stack.
                    f1 = sys._getframe(n) # The stack frame, n levels up.
                    code1 = f1.f_code # The code object
                    name = code1.co_name
                    if name == '__init__':
                        name = '__init__(%s,line %s)' % (
                            self.shortFileName(code1.co_filename), code1.co_firstlineno)
                    if files:
                        return '%s:%s' % (self.shortFileName(code1.co_filename), name)
                    else:
                        return name # The code name
                except ValueError:
                    # print('g._callerName: ValueError',n)
                    return '' # The stack is not deep enough.
                except Exception:
                    # es_exception()
                    return '' # "<no caller name>"
            def callers(self, n=4, count=0, excludeCaller=True, files=False):
                '''Return a list containing the callers of the function that called g.callerList.
                If the excludeCaller keyword is True (the default), g.callers is not on the list.
                If the files keyword argument is True, filenames are included in the list.
                '''
                # sys._getframe throws ValueError in both cpython and jython if there are less than i entries.
                # The jython stack often has less than 8 entries,
                # so we must be careful to call g._callerName with smaller values of i first.
                result = []
                i = 3 if excludeCaller else 2
                while 1:
                    s = self._callerName(i, files=files)
                    # print(i,s)
                    if s:
                        result.append(s)
                    if not s or len(result) >= n: break
                    i += 1
                result.reverse()
                if count > 0: result = result[: count]
                sep = '\n' if files else ','
                return sep.join(result)
            def cls(self):
                '''Clear the screen.'''
                if sys.platform.lower().startswith('win'):
                    os.system('cls')
            def pdb(self):
                try:
                    import leo.core.leoGlobals as leo_g
                    leo_g.pdb()
                except ImportError:
                    import pdb
                    pdb.set_trace()
            def shortFileName(self,fileName, n=None):
                if n is None or n < 1:
                    return os.path.basename(fileName)
                else:
                    return '/'.join(fileName.replace('\\', '/').split('/')[-n:])
            def splitLines(self, s):
                '''Split s into lines, preserving trailing newlines.'''
                return s.splitlines(True) if s else []
            def trace(self, *args, **keys):
                try:
                    import leo.core.leoGlobals as leo_g
                    leo_g.trace(caller_level=2, *args, **keys)
                except ImportError:
                    print(args, keys)
        class Pattern(object):
            '''
            A class representing regex or balanced patterns.
            Sample matching code, for either kind of pattern:
                for m in reversed(pattern.all_matches(s)):
                    s = pattern.replace(m, s)
            '''
            def __init__ (self, find_s, repl_s=''):
                '''Ctor for the Pattern class.'''
                self.find_s = find_s
                self.repl_s = repl_s
                if self.is_regex():
                    self.regex = re.compile(find_s)
                elif self.is_balanced():
                    self.regex = None
                else:
                    # Escape all dangerous characters.
                    result = []
                    for ch in find_s:
                        if ch == '_' or ch.isalnum():
                            result.append(ch)
                        else:
                            result.append('\\'+ch)
                    self.regex = re.compile(''.join(result))
            def __eq__(self, obj):
                """Return True if two Patterns are equivalent."""
                if isinstance(obj, Pattern):
                    return self.find_s == obj.find_s and self.repl_s == obj.repl_s
                else:
                    return NotImplemented
            def __ne__(self, obj):
                """Return True if two Patterns are not equivalent."""
                return not self.__eq__(obj)
            def __hash__(self):
                '''Pattern.__hash__'''
                return len(self.find_s) + len(self.repl_s)
            def __repr__(self):
                '''Pattern.__repr__'''
                return '%s: %s' % (self.find_s, self.repl_s)
            __str__ = __repr__
            def is_balanced(self):
                '''Return True if self.find_s is a balanced pattern.'''
                s = self.find_s
                if s.endswith('*'):
                    return True
                for pattern in ('(*)', '[*]', '{*}'):
                    if s.find(pattern) > -1:
                        return True
                return False
            def is_regex(self):
                '''
                Return True if self.find_s is a regular pattern.
                For now a kludgy convention suffices.
                '''
                return self.find_s.endswith('$')
                    # A dollar sign is not valid in any Python expression.
            def all_matches(self, s):
                '''
                Return a list of match objects for all matches in s.
                These are regex match objects or (start, end) for balanced searches.
                '''
                trace = False
                if self.is_balanced():
                    aList, i = [], 0
                    while i < len(s):
                        progress = i
                        j = self.full_balanced_match(s, i)
                        if j is None:
                            i += 1
                        else:
                            aList.append((i,j),)
                            i = j
                        assert progress < i
                    return aList
                else:
                    return list(self.regex.finditer(s))
            def full_balanced_match(self, s, i):
                '''Return the index of the end of the match found at s[i:] or None.'''
                i1 = i
                trace = False
                if trace: g.trace(self.find_s, s[i:].rstrip())
                pattern = self.find_s
                j = 0 # index into pattern
                while i < len(s) and j < len(pattern) and pattern[j] in ('*', s[i]):
                    progress = i
                    if pattern[j:j+3] in ('(*)', '[*]', '{*}'):
                        delim = pattern[j]
                        i = self.match_balanced(delim, s, i)
                        j += 3
                    elif j == len(pattern)-1 and pattern[j] == '*':
                        # A trailing * matches the rest of the string.
                        j += 1
                        i = len(s)
                        break
                    else:
                        i += 1
                        j += 1
                    assert progress < i
                found = i <= len(s) and j == len(pattern)
                if trace and found:
                    g.trace('%s -> %s' % (pattern, s[i1:i]))
                return i if found else None
            def match_balanced(self, delim, s, i):
                '''
                delim == s[i] and delim is in '([{'
                Return the index of the end of the balanced parenthesized string, or len(s)+1.
                '''
                trace = False
                assert s[i] == delim, s[i]
                assert delim in '([{'
                delim2 = ')]}'['([{'.index(delim)]
                assert delim2 in ')]}'
                i1, level = i, 0
                while i < len(s):
                    progress = i
                    ch = s[i]
                    i += 1
                    if ch == delim:
                        level += 1
                    elif ch == delim2:
                        level -= 1
                        if level == 0:
                            if trace: g.trace('found: %s' % s[i1:i])
                            return i
                    assert progress < i
                # Unmatched: a syntax error.
                print('***** unmatched %s in %s' % (delim, s))
                return len(s) + 1
            def match(self, s, trace=False):
                '''
                Perform the match on the entire string if possible.
                Return (found, new s)
                '''
                trace = False or trace
                caller = g.callers(2).split(',')[0].strip()
                    # The caller of match_all.
                s1 = truncate(s,40)
                if self.is_balanced():
                    j = self.full_balanced_match(s, 0)
                    if j is None:
                        return False, s
                    else:
                        start, end = 0, len(s)
                        s = self.replace_balanced(s, start, end)
                        if trace:
                            g.trace('%-16s %30s %40s ==> %s' % (caller, self, s1, s))
                        return True, s
                else:
                    m = self.regex.match(s)
                    if m and m.group(0) == s:
                        s = self.replace_regex(m, s)
                        if trace:
                            g.trace('%-16s %30s %30s ==> %s' % (caller, self, s1, s))
                        return True, s
                    else:
                        return False, s
            def match_entire_string(self, s):
                '''Return True if s matches self.find_s'''
                if self.is_balanced():
                    j = self.full_balanced_match(s, 0)
                    return j is not None
                else:
                    m = self.regex.match(s)
                    return m and m.group(0) == s
            def replace(self, m, s):
                '''Perform any kind of replacement.'''
                if self.is_balanced():
                    start, end = m
                    return self.replace_balanced(s, start, end)
                else:
                    return self.replace_regex(m, s)
            def replace_balanced(self, s1, start, end):
                '''
                Use m (returned by all_matches) to replace s by the string implied by repr_s.
                Within repr_s, * star matches corresponding * in find_s
                '''
                trace = False
                s = s1[start:end]
                f, r = self.find_s, self.repl_s
                i1 = f.find('(*)')
                i2 = f.find('[*]')
                i3 = f.find('{*}')
                if -1 == i1 == i2 == i3:
                    return s1[:start] + r + s1[end:]
                j = r.find('*')
                if j == -1:
                    return s1[:start] + r + s1[end:]
                i = min([z for z in [i1, i2, i3] if z > -1])
                assert i > -1 # i is an index into f AND s
                delim = f[i]
                if trace: g.trace('head', s[:i], f[:i])
                assert s[:i] == f[:i], (s[:i], f[:i])
                if trace: g.trace('delim',delim)
                k = self.match_balanced(delim, s, i)
                s_star = s[i+1:k-1]
                if trace: g.trace('s_star',s_star)
                repl = r[:j] + s_star + r[j+1:]
                if trace: g.trace('repl',self.repl_s,'==>',repl)
                return s1[:start] + repl + s1[end:]
            def replace_regex(self, m, s):
                '''Do the replacement in s specified by m.'''
                s = self.repl_s
                for i in range(9):
                    group = '\\%s' % i
                    if s.find(group) > -1:
                        # g.trace(i, m.group(i))
                        s = s.replace(group, m.group(i))
                return s
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
