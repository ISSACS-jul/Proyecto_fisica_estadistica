#importo las bibliotecas necesarias 
import subprocess #la uso para ejectar el programa en C que me da los valores de monte-carlo
import scipy #lo uso para tener una integral mas exacta y obtener un delta x
import math # lo uso para poder hacer el logaritmo natural de los valores y hacer una regresion lineal

from scipy.integrate import quad
from scipy.stats import linregress

#defino algunas variables
valores_x = []
valores_y = []
l = 1
n = 1

ecuacion = input("ingrese la ecuacion a integrar/evaluar\n")
a = float(input("ingrese el limite inferior\n"))
b = float(input("ingrese el limite superior\n"))
p = float(input("ingrese el numero de pareja de datos que desea para hacer la regresion\n"))

#defino la funcion a integrar
def f(x):
    return eval(ecuacion)

#hago la integral con quad
integral, error = quad(f, a, b)
print(f"{ecuacion}\n")
#----------------------------[Modificar linea con ecuacion]--------------------------------

archivo_c = "mean_method.c"
nueva_linea = f"        y = {ecuacion};\n"
patron = "        x = numero_aleatorio(a, b);\n"

nueva_linea_limites = f"double a = {a};\ndouble b = {b};\n"
patron_limites = "double area = 0;"

# Leer el contenido del archivo
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Insertar la nueva línea después del patrón
for i, linea in enumerate(lineas):
    if patron in linea:
        lineas.insert(i + 1, nueva_linea)
        break

# Sobrescribir el archivo con las modificaciones
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas)

# Leer el contenido del archivo 2
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Insertar la nueva línea después del patrón 2
for i, linea in enumerate(lineas):
    if patron_limites in linea:
        lineas.insert(i + 1, nueva_linea_limites)
        break

# Sobrescribir el archivo con las modificaciones 2
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas)

# Compilar el archivo con gcc
try:
    subprocess.run(
        ["gcc", archivo_c, "-o", "mean_method"],
        check=True
    )
#    print(f"El archivo {archivo_c} se compiló correctamente.")
except subprocess.CalledProcessError as e:
    print(f"Error al compilar el archivo {archivo_c}: {e}")

#------------------------------------------------------------------------------------------
#ejecuto el programa en C
try:
    
    while l<p+1: #hago un bucle para obtener varios datos
        
        valor_n = n 
        resultado = subprocess.run(
            ["./mean_method"],
            text=True,
            input=f"{valor_n}\n", #es el valor de n que le paso a el programa en C para hacer el metodo monte-carlo
            capture_output=True,
            check=True
            )
        print(f"{resultado.stdout.strip()} para L:{l}")
    
        numero = float(resultado.stdout.strip()) #convierto el valor de C en un numero con el cual trabajar

        if numero == 0: #si el programa en C es incapaz de devolver un valor valido esta parte del codigo finaliza el bucle
            break

        log_numero = abs(numero - integral)
        log_n = valor_n

        log_numero = math.log(log_numero) 
        log_n = math.log(log_n)

        valores_x.append(log_n)
        valores_y.append(log_numero)

        n = n*2
        l = l + 1


except subprocess.CalledProcessError as e:
    print("surgio un error")

#se hacen los calculos de la regresion lineal
pendiente, intercepto, r_valor, p_valor, error_std = linregress(valores_x, valores_y)
print(f"la pendiente es de: {pendiente}")

#----------almacenar la pendiente en texto plano-------------

archivo_pendiente = open("pendiente.txt", "w")
archivo_pendiente.write(f"{pendiente}")
archivo_pendiente.close()

archivo_ecuacion = open("ecuacion.txt", "w")
archivo_ecuacion.write(f"{ecuacion}")
archivo_ecuacion.close()

archivo_a = open("limite_inferior.txt", "w")
archivo_a.write(f"{a}")
archivo_a.close()

archivo_b = open("limite_superior.txt", "w")
archivo_b.write(f"{b}")
archivo_b.close()

#------------------------------------------------------------

#--------borrar la lines modificada-------------------------

# Pedir al usuario la línea que desea eliminar
linea_a_borrar = f"        y = {ecuacion};\n"

# Leer el contenido del archivo
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Filtrar las líneas, excluyendo la línea a borrar
lineas_actualizadas = [linea for linea in lineas if linea.strip() != linea_a_borrar.strip()]

# Sobrescribir el archivo con las líneas actualizadas
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas_actualizadas)

# Pedir al usuario la línea que desea eliminar 2
linea_a_borrar = f"double a = {a};\n"

# Leer el contenido del archivo 2
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Filtrar las líneas, excluyendo la línea a borrar 2
lineas_actualizadas = [linea for linea in lineas if linea.strip() != linea_a_borrar.strip()]

# Sobrescribir el archivo con las líneas actualizadas 2
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas_actualizadas)

# Pedir al usuario la línea que desea eliminar 3
linea_a_borrar = f"double b = {b};\n"

# Leer el contenido del archivo 3
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Filtrar las líneas, excluyendo la línea a borrar 3
lineas_actualizadas = [linea for linea in lineas if linea.strip() != linea_a_borrar.strip()]

# Sobrescribir el archivo con las líneas actualizadas 3
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas_actualizadas)

#-----------------------------------------------------------
