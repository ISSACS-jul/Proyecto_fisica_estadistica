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
p = 10
n = 1
a, b = 0, 1

ecuacion = input("ingrese la ecuacion a integrar/evaluar\n")
p = float(input("ingrese el numero de pareja de datos que desea para hacer la regresion\n"))

#defino la funcion a integrar
def f(x):
    return eval(ecuacion)

#hago la integral con quad
integral, error = quad(f, a, b)
print(f"la integral exacta es: {integral}\n")
print(f"{ecuacion}\n")
#----------------------------[Modificar linea con ecuacion]--------------------------------

archivo_c = "prueba.c"
nueva_linea = f"        y = {ecuacion};\n"
patron = "        x = numero_aleatorio(a, b);\n"

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

# Compilar el archivo con gcc
try:
    subprocess.run(
        ["gcc", archivo_c, "-o", "prueba"],
        check=True
    )
    print(f"El archivo {archivo_c} se compiló correctamente.")
except subprocess.CalledProcessError as e:
    print(f"Error al compilar el archivo {archivo_c}: {e}")

#------------------------------------------------------------------------------------------
#ejecuto el programa en C
try:
    
    while l<p+1: #hago un bucle para obtener varios datos
        
        valor_n = n 
        resultado = subprocess.run(
            ["./prueba"],
            text=True,
            input=f"{valor_n}\n", #es el valor de n que le paso a el programa en C para hacer el metodo monte-carlo
            capture_output=True,
            check=True
            )
        print(f"{resultado.stdout.strip()} para l:{l}")
    
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

#-----------------------------------------------------------

print(f"el programa a acabado")
