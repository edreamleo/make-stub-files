def return_every_kind(a):
    if a == 1:   return 1
    elif a == 2: return 1.0
    elif a == 3: return float(1.0)
    elif a == 4: return complex(2.0,3.0)
    elif a == 5: return long(1)
    elif a == 5: return ('a','b')
    elif a == 6: return [1, 2]
    elif a == x: return {}
    elif a == x: return {'x': 'y',}
    elif a == x: return dict(['p', 'q'])
    elif a == x: return list(1,2)
    elif a == x: return int(0.5)
    elif a == x: return tuple('a1', 'b1')
