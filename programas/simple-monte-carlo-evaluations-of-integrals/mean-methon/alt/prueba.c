#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "muParser.h"

double x;
double y = 0;
double Y = 0;
double area = 0;
double a = 0;
double b = 1;
int i = 0;
int n;

unsigned long long rdtsc();
double numero_aleatorio(double a, double b);

int main() {
    mu::Parser p;
    srand(rdtsc());

    // Leer el número de intentos
//    printf("Ingresa el número de intentos (n): ");
    if (scanf("%d", &n) != 1) {
        printf("Error al leer el número de intentos.\n");
        return 1;
    }

    // Limpiar el buffer después de scanf
    while (getchar() != '\n');  // Limpiar el salto de línea

    // Pedir al usuario que ingrese la ecuación
    char ecuacion[100];
//    printf("Ingresa la ecuación para evaluar (por ejemplo, -5*x^2 + 8*x): ");
    if (fgets(ecuacion, sizeof(ecuacion), stdin) == NULL) {
        printf("Error al leer la ecuación.\n");
        return 1;
    }

    // Eliminar el salto de línea al final de la cadena
    size_t len = strlen(ecuacion);
    if (len > 0 && ecuacion[len - 1] == '\n') {
        ecuacion[len - 1] = '\0';
    }

    // Establecer la expresión para el parser
    p.SetExpr(ecuacion);

    while (i < n) {
        x = numero_aleatorio(a, b);  // Generar un nuevo valor para x
        p.DefineVar("x", &x);         // Actualizar la variable x en muParser

        try {
            y = p.Eval();  // Evaluar la expresión
        } catch (mu::ParserError &e) {
            printf("Error en la evaluación de la expresión: %s\n", e.GetMsg());
            return 1;  // Salir con error
        }

        Y = Y + y;
        i++;
    }

    double esp = Y / n;
    area = (b - a) * esp;
    printf("%.20f\n", area);
    return 0;
}

double numero_aleatorio(double a, double b) {
    double escala = rand() / (double)RAND_MAX;
    return a + escala * (b - a);
}

unsigned long long rdtsc() {
    unsigned int lo, hi;
    __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
    return ((unsigned long long)hi << 32) | lo;
}

