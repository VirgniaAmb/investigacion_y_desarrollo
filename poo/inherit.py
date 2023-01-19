'''INHERITANCE
is basically the process that allows us to create a new class and reusing the
code from an existing parent class'''

class Person:
    def __init__(self, fname, lname):
        self.firstname = fname
        self.lastname = lname

    def printname(self):
        print(self.firstname, self.lastname)

# instantiating a class
florist = Person("Jane", "Flowers")
florist.printname()

# create a child class without an __init__() method. It inherits all methods and attributes of the parent class.
class Lawyers(Person):
    pass

happy_lawyers = Lawyers("Jack", "Smiley")
happy_lawyers.printname()

# create a child class with an __init__() method, it will override the init method of the parent class.
class Accountants(Person):
    def __init__(self, fname, lname):
        Person.__init__(self, fname, lname)
        #self.firstname = fname
        #self.lastname = lname

    def printinfo(self):
        print(self.firstname, self.lastname)

happy_accountant = Accountants("Jessie", "Owens")
happy_accountant.printname()
happy_accountant.printinfo()

# Adding attributes to child class
class Teachers(Person):
    def __init__(self, fname, lname, casetype):
        Person.__init__(self, fname, lname)
        self.casetype = casetype
        #self.firstname = fname
        #self.lastname = lname

    def printinfo(self):
        print("Hello my name is", self.firstname, self.lastname)

happy_teachers = Teachers("Julia", "Child", "students")
happy_teachers.printname()
happy_teachers.printinfo()

print(happy_teachers.casetype)