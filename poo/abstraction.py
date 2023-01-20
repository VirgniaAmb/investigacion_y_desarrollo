'''ABSTRACTION
Abstraction hides the internal details and shows only functionalities.
Refers to providing only essential information about the data to the outside world.

ABSTRACT CLASSES
Are classes that contain one or more abstract methods.
Abstract classes can not be instantiated
Require subclasses to provide implementation for the abstract methods.
Subclasses of an abstracr class in Python are not requiered to implement abstract methods of the parent class.

ABSTRACT METHODS
Are methods that are declared but contains no implementation.
Requires subclasses to provide implementation for them.

A B C => Abstract Base Classes
'''

'''A decorator allows you to add new functionality to an existin object (classes, methods, functions)
without modifying its structure.'''

from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        pass

    @abstractmethod
    def perimeter(self):
        pass

class Square(Shape):
    def __init__(self, side):
        self.__side = side

    # impement the methods we have in the parent class inside the subclass
    def area(self):
        return self.__side * self.__side

    def perimeter(self):
        return 4 * self.__side

# instantiating the parent class (creamos un objeto de la clase shape)
# myshape = Shape() # al tener el abstractmethod no me permite instanciarlo, me da error
# Can't instantiate abstract class Shape with abstract methods area, perimeter

# with abstraction you have to implemente the method in the subclass
# mysquare = Square() # Can't instantiate abstract class Shape with abstract methods area, perimeter

# create an implementation of these two methods inside my parent class
# instantiating the subclass
mysquare = Square(5)

print(mysquare.area())
print(mysquare.perimeter())