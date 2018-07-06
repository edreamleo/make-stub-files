class aClass:
    aList = []
    def foo(self):
        print(self.aList)

class aClass2:
    def __init__(self):
        self.aList = []
    def foo(self):
        print(self.aList)
        
i1, i2 = aClass(), aClass2()
i1.foo()
i2.foo()
