#importo las bibliotecas necesarias 
import subprocess #la uso para ejectar el programa en C que me da los valores de monte-carlo

#defino algunas variables

with open("./particion.txt", "r") as archivo:
    ecuacion = archivo.read()

with open("./limite_inferior_p.txt", "r") as archivo:
    ax = float(archivo.read())

with open("./limite_superior_p.txt", "r") as archivo:
    bx = float(archivo.read())

with open("./limite_inferior_q.txt", "r") as archivo:
    ay = float(archivo.read())

with open("./limite_superior_q.txt", "r") as archivo:
    by = float(archivo.read())

with open("./n.txt", "r") as archivo:
    n = int(archivo.read())

#ecuacion = input("ingrese la ecuacion: ejemplo (-5*x*x+8*x)\n")
#a = float(input("ingrese el limite inferior\n"))
#b = float(input("ingrese el limite superior\n"))
#n = int(input("ingrese el valor de n\n"))

#----------------------------[Modificar linea con ecuacion]--------------------------------

archivo_c = "mean_method_particion.c"
nueva_linea = f"        fy = exp({ecuacion});\n"
patron = "        q = numero_aleatorioq(ay, by);\n"

nueva_linea_limites = f"double ax = {ax};\ndouble bx = {bx};\ndouble ay = {ay};\ndouble by = {by};\n"
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
        ["gcc", archivo_c, "-o", "mean_method", "-lm"],
        check=True
    )
except subprocess.CalledProcessError as e:
    print(f"Error al compilar el archivo {archivo_c}: {e}")

#------------------------------------------------------------------------------------------
#ejecuto el programa en C
try:    
    valor_n = n 
    resultado = subprocess.run(
        ["./mean_method"],
        text=True,
        input=f"{valor_n}\n", #es el valor de n que le paso a el programa en C para hacer el metodo monte-carlo
        capture_output=True,
        check=True
        )
    numero = float(resultado.stdout.strip()) #convierto el valor de C en un numero con el cual trabajar
    print(f"{numero}")
    
except subprocess.CalledProcessError as e:
    print("surgio un error")

#--------borrar la lines modificada-------------------------

# Pedir al usuario la línea que desea eliminar
linea_a_borrar = f"        fy = exp({ecuacion});\n"

# Leer el contenido del archivo
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Filtrar las líneas, excluyendo la línea a borrar
lineas_actualizadas = [linea for linea in lineas if linea.strip() != linea_a_borrar.strip()]

# Sobrescribir el archivo con las líneas actualizadas
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas_actualizadas)

# Pedir al usuario la línea que desea eliminar 2
linea_a_borrar = f"double ax = {ax};\n"

# Leer el contenido del archivo 2
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Filtrar las líneas, excluyendo la línea a borrar 2
lineas_actualizadas = [linea for linea in lineas if linea.strip() != linea_a_borrar.strip()]

# Sobrescribir el archivo con las líneas actualizadas 2
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas_actualizadas)

# Pedir al usuario la línea que desea eliminar 3
linea_a_borrar = f"double bx = {bx};\n"

# Leer el contenido del archivo 3
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Filtrar las líneas, excluyendo la línea a borrar 3
lineas_actualizadas = [linea for linea in lineas if linea.strip() != linea_a_borrar.strip()]

# Sobrescribir el archivo con las líneas actualizadas 3
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas_actualizadas)

#Pedir al usuario la linea que desea eliminar 4
linea_a_borrar = f"double ay = {ay};\n"

# Leer el contenido del archivo 4
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Filtrar las líneas, excluyendo la línea a borrar 4
lineas_actualizadas = [linea for linea in lineas if linea.strip() != linea_a_borrar.strip()]

# Sobrescribir el archivo con las líneas actualizadas 4
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas_actualizadas)

# Pedir al usuario la línea que desea eliminar 5
linea_a_borrar = f"double by = {by};\n"

# Leer el contenido del archivo 5
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Filtrar las líneas, excluyendo la línea a borrar 5
lineas_actualizadas = [linea for linea in lineas if linea.strip() != linea_a_borrar.strip()]

# Sobrescribir el archivo con las líneas actualizadas 5
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas_actualizadas)

#-----------------------------------------------------------

