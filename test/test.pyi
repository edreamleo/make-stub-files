
def return_every_kind(a: Any) -> Any: ...
    #   0: return 1
    #   0: return number
    #   1: return 1.0
    #   1: return number
    #   2: return float(1.0)
    # ? 2: return float(number)
    #   3: return complex(2.0,3.0)
    # ? 3: return complex(number,number)
    #   4: return long(1)
    # ? 4: return long(number)
    #   5: return ('a', 'b')
    #   5: return Tuple[str, str]
    #   6: return [1,2]
    # ? 6: return [number,number]
    #   7: return {}
    # ? 7: return {}
    #   8: return {'x':'y'}
    # ? 8: return {str:str}
    #   9: return dict(['p','q'])
    # ? 9: return dict([str,str])
    #   10: return list(1,2)
    # ? 10: return list(number,number)
    #   11: return int(0.5)
    # ? 11: return int(number)
    #   12: return tuple('a1','b1')
    # ? 12: return tuple(str,str)
