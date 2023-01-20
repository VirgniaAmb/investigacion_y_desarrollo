'''ENCAPSULATION
Process of restricting access to methods and variables to prevent direct dara modification
Public methods and variables are accessible from anywhere in program
Private methods and variables are accessible from their own class (double undierscore prefix before object
name makes ir private)'''

class Cars:
    def __init__(self, speed, color):
        self.speed = speed
        self.color = color

    def set_speed(self, value):
        self.speed = value

    def get_speed(self):
        return self.speed

# instanciamos la clase
ford = Cars(250, "green")
nissan = Cars(300, "red")
toyota = Cars(350, "blue")

# al no tener hecha la encapsulacion puedo cambiar el valor de la variable speed.
ford.set_speed(450) # I'm able to change the value of the speed variable
ford.speed = 500 # cambio el valor de la variable accediendo directamente a ella.

print(ford.get_speed())
print(ford.color)

class Trucks:
    def __init__(self, speed, color):
        self.__speed = speed # agrego __ hace que la variable sea privada
        self.__color = color

    def set_speed(self, value):
        self.__speed = value

    def get_speed(self):
        return self.__speed

# instanciamos la clase
renault = Trucks(250, "green")
fiat = Trucks(300, "red")

renault.set_speed(450) # esta si va a funcionar
renault.speed = 500 # no va a funcionar, ignora esta linea directamente.
renault.__speed = 800 # no va a funcionar, ignora esta linea directamente.

print(renault.get_speed())
#print(renault.color) I cannot access it outside of the method
print(renault.__color) # no va a funcionar tampoco

'''La única forma de cambiar el valor de una variable privada (ejemplo "color") es generando el metodo,
es decir que deberiamos replicar los metodos set_speed and get_speed para color.
De esa forma al llamarlas y pasarles un nuevo valor va a tomar este último que le pasemos como parámetro:
renault.set_speed(450)'''