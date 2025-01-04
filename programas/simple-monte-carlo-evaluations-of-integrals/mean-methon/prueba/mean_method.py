#importo las bibliotecas necesarias 
import subprocess #la uso para ejectar el programa en C que me da los valores de monte-carlo

#defino algunas variables
a, b = 0, 1

ecuacion = input("ingrese la ecuacion: ejemplo (-5*x*x+8*x)\n")
n = int(input("ingrese el valor de n\n"))

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
except subprocess.CalledProcessError as e:
    print(f"Error al compilar el archivo {archivo_c}: {e}")

#------------------------------------------------------------------------------------------
#ejecuto el programa en C
try:    
    valor_n = n 
    resultado = subprocess.run(
        ["./prueba"],
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

