def is_known_type(s: str) -> Any: ...
    #   0: return True
    #   0: return bool
    #   1: return True
    #   1: return bool
    #   2: return is_known_type(inner) if inner else True
    #   2: return Any
    #   3: return is_known_type(inner) if inner else True
    #   3: return Any
    #   4: return True
    #   4: return bool
    #   5: return True
    #   5: return bool
    #   6: return all(is_known_type(z.strip()) for z in split_types(s3))
    # ? 6: return all(is_known_type(z.strip()) for z in split_types(s3))
    #   7: return True
    #   7: return bool
    #   8: return False
    #   8: return bool
def match_entire_string(self, s: str) -> Union[Any,bool]: ...
    #   0: return j is not None
    #   0: return bool
    #   1: return m and m.group(0)==s
    #   1: return Any
def return_every_kind(a: Any, b: Any) -> Union[
    Dict[List[str, str]],
    Dict[{str:str}],
    Dict[{}],
    List[number, number],
    Tuple[str, str],
    bool,
    complex(number, number),
    float(number),
    int(number),
    long(number),
    number,
]: ...
    #   0: return 1
    #   0: return number
    #   1: return 1.0
    #   1: return number
    #   2: return float(1.0)
    #   2: return float(number)
    #   3: return complex(2.0,3.0)
    #   3: return complex(number, number)
    #   4: return long(1)
    #   4: return long(number)
    #   5: return ('a', 'b')
    #   5: return Tuple[str, str]
    #   6: return [1,2]
    #   6: return List[number, number]
    #   7: return {}
    #   7: return Dict[{}]
    #   8: return {'x':'y'}
    #   8: return Dict[{str:str}]
    #   9: return dict(['p','q'])
    #   9: return Dict[List[str, str]]
    #   10: return list(1,2)
    #   10: return List[number, number]
    #   11: return int(0.5)
    #   11: return int(number)
    #   12: return tuple('a1','b1')
    #   12: return Tuple[str, str]
    #   13: return True and False
    #   13: return bool
    #   14: return True or False
    #   14: return bool
    #   15: return 1 and 0
    #   15: return number
    #   16: return 1 or -1
    #   16: return number
    #   17: return  not True
    #   17: return bool
    #   18: return  not 1
    #   18: return number
    #   19: return 1 if False else 2
    #   19: return number
def splitLines(self, s: str) -> Any: ...
    #   0: return s.splitlines(True) if s else []
    #   0: return Any
def sum(n: Any) -> Any: ...
    #   0: return 1
    #   0: return number
    #   1: return 1+sum(n-1)
    # ? 1: return number+sum(n-number)
