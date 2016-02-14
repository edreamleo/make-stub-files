'''A test file containing code that caused mypy errors.'''

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
        'self', # Experimental.
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


def return_every_kind(a, b):
    # pylint: disable=unreachable
    return 1
    return 1.0
    return float(1.0)
    return complex(2.0,3.0)
    return long(1)
    return ('a','b')
    return [1, 2]
    return {}
    return {'x': 'y',}
    return dict(['p', 'q'])
    return list(1,2)
    return int(0.5)
    return tuple('a1', 'b1')
    return True and False
    return True or False
    return 1 and 0
    return 1 or -1
    return not True
    return not 1
    return 1 if False else 2
    
def match_entire_string(self, s):
    '''Return True if s matches self.find_s'''
    if self.is_balanced():
        j = self.full_balanced_match(s, 0)
        return j is not None
    else:
        m = self.regex.match(s)
        return m and m.group(0) == s

def splitLines(self, s):
    '''Split s into lines, preserving trailing newlines.'''
    return s.splitlines(True) if s else []
    
def sum_test(n):
    '''An common recursive pattern.'''
    if n == 1:
        return 1
    else:
        return 1 + sum(n-1)
        
def not_test(a):
    return not a
