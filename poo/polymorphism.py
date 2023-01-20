'''Polymorphirms
Menas the ability to take or have various forms
Allows us yo define methods in child class with same name as methods in parent class but
doing different things.'''

print(len("Hello")) # cuenta caracteres

print(len([20, 40, 80])) # cuenta elementos de una lista

# creo una funcion
def addNumbers(a, b, c=1):
    return a + b + c

print(addNumbers(8, 9)) # le paso argumentos a la funcion

print(addNumbers(8, 9, 4))


# both functions have the same type of methods but the methods are doing differents things
class UK():
    def capital_city(self):
        print("London is the capital of UK")

    def language(self):
        print("English is the primary language")

class Spain():
    def capital_city(self):
        print("Madrid is the capital of Spain")

    def language(self):
        print("Spanish is the primary language")

# instanciamos ambas clases
# both instances of the class are using the same method names but in a different way
queen = UK()
queen.capital_city()

zara = Spain()
zara.capital_city()

# use the for loop to iterate through the instance and then access the methods
for country in (queen, zara):
    country.capital_city()
    country.language()


# create polymorphism by using existing method on a new function.
def europe(eu):
    eu.capital_city()

europe(queen)
europe(zara)