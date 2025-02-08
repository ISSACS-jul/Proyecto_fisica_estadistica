#importo las bibliotecas necesarias 
import subprocess #la uso para ejectar el programa en C que me da los valores de monte-carlo

#defino algunas variables

ecuacion = input("ingrese la ecuacion: ejemplo (-5*x*x+8*x)\n")
ax = float(input("ingrese el limite inferior en x\n"))
bx = float(input("ingrese el limite superior en x\n"))
ay = float(input("ingrese el limite inferior en y\n"))
by = float(input("ingrese el limite superior en y\n"))
az = float(input("ingrese el limite inferior en z\n"))
bz = float(input("ingrese el limite superior en z\n"))
n = int(input("ingrese el valor de n\n"))

#----------almacenar la pendiente en texto plano-------------

archivo_ecuacion = open("ecuacion.txt", "w")
archivo_ecuacion.write(f"{ecuacion}")
archivo_ecuacion.close()

archivo_a = open("limite_inferiorx.txt", "w")
archivo_a.write(f"{ax}")
archivo_a.close()

archivo_a = open("limite_inferiory.txt", "w")
archivo_a.write(f"{ay}")
archivo_a.close()

archivo_a = open("limite_inferiorz.txt", "w")
archivo_a.write(f"{az}")
archivo_a.close()

archivo_b = open("limite_superiorx.txt", "w")
archivo_b.write(f"{bx}")
archivo_b.close()

archivo_b = open("limite_superiory.txt", "w")
archivo_b.write(f"{by}")
archivo_b.close()

archivo_b = open("limite_superiorz.txt", "w")
archivo_b.write(f"{bz}")
archivo_b.close()

archivo_n = open("./n_necesaria.txt", "w")
archivo_n.write(f"{n}")
archivo_n.close()
#------------------------------------------------------------

#----------------------------[Modificar linea con ecuacion]--------------------------------

archivo_c = "mean_method.c"
nueva_linea = f"        fy = {ecuacion};\n"
patron = "        z = numero_aleatorioz(az, bz);\n"

nueva_linea_limites = f"double ax = {ax};\ndouble bx = {bx};\ndouble ay = {ay};\ndouble by = {by};\ndouble az = {az};\ndouble bz = {bz};\n"
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
linea_a_borrar = f"        fy = {ecuacion};\n"

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

# Sobrescribir el archivo con las líneas actualizadas 4
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas_actualizadas)

# Pedir al usuario la línea que desea eliminar 4
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

# Pedir al usuario la línea que desea eliminar 6
linea_a_borrar = f"double az = {az};\n"

# Leer el contenido del archivo 6
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Filtrar las líneas, excluyendo la línea a borrar 6
lineas_actualizadas = [linea for linea in lineas if linea.strip() != linea_a_borrar.strip()]

# Sobrescribir el archivo con las líneas actualizadas 6
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas_actualizadas)
# Pedir al usuario la línea que desea eliminar 6
linea_a_borrar = f"double bz = {bz};\n"

# Leer el contenido del archivo 6
with open(archivo_c, 'r') as archivo:
    lineas = archivo.readlines()

# Filtrar las líneas, excluyendo la línea a borrar 6
lineas_actualizadas = [linea for linea in lineas if linea.strip() != linea_a_borrar.strip()]

# Sobrescribir el archivo con las líneas actualizadas 6
with open(archivo_c, 'w') as archivo:
    archivo.writelines(lineas_actualizadas)

#-----------------------------------------------------------

