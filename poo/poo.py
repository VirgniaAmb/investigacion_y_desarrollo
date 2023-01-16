import numpy as np
import pandas as pd

'''__init__() is a built-in function in Python. Also known as the initializer. Used to initialize objects with initial values.
All classes should have them. It is called automatically when a new object is created from a class.'''

'''Self parameter is a reference to the current instance of the class. It is the first parameter of any method (function) in
a class. It is used to access variables and methods belonging to the class. Also used to add attributes to a method.'''

class Instructors:
    companyName = 'Bluelime'

    def __init__(self, course):
        self.course = course

    def printinfo(self):
        print("My Company name is:", Instructors.companyName)

# instantiating a class: process of creating an object from a class
# creamos una variable y la igualamos a la clase.

elearning = Instructors("Python for beginners") # dentro del parentesis pasamos un valor o argumento para el parametro.
# ese valor va a reemplazar el valor inicial 'course'

bls = Instructors("Django for beginners")

# in order to call the method on an instance of the class:
bls.printinfo()

# access attributes from an instance that has been created from a class
print(bls.course)