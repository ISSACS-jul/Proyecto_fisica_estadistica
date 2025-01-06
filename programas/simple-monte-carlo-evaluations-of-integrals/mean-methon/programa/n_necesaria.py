import math

with open("pendiente.txt", "r") as archivo:
    pendiente = float(archivo.read().strip())

print(f"{pendiente}\n")

#calcular la n necesaria
e = math.exp(1)
dx = float(input("intruzca el error que desea\n"))
dx = math.log(dx)

expo = ( dx / pendiente )

n = pow(e ,expo)
n = int(n)

print(f"el valor de n necesarias es de {n}\n")

#----------------crear archivo con las n necesarias-----------------------

archivo_n = open("n_necesaria.txt","w")
archivo_n.write(f"{n}")
archivo_n.close()

#-------------------------------------------------------------------------

