import math

hamilton = input("Ingrese el hamiltoniano en funcion de p y q\n")
pa = float(input("Ingrese el limite inferior de p\n"))
pb = float(input("ingrese el limite superior de p\n"))
qa = float(input("Ingrese el limite inferior de q\n"))
qb = float(input("Ingrese el limite superior de q\n"))
t = float(input("Ingrese el valor de temperatura\n"))
n = int(input("Ingrese el valor de n para el metodo\n"))

e = math.e
bolt = 1.380649*10
betha = 1/(bolt * t)

archivo = open("particion.txt", "w")
archivo.write(f"-{betha}*({hamilton})")
archivo.close()

archivo = open("limite_inferior_p.txt", "w")
archivo.write(f"{pa}")
archivo.close()

archivo = open("limite_superior_p.txt", "w")
archivo.write(f"{pb}")
archivo.close()

archivo = open("limite_inferior_q.txt", "w")
archivo.write(f"{qa}")
archivo.close()

archivo = open("limite_superior_q.txt", "w")
archivo.write(f"{qb}")
archivo.close()

archivo = open("n.txt", "w")
archivo.write(f"{n}")
archivo.close()
