#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define KB 1.380649e-23  // Constante de Boltzmann en J/K
#define T 300.0          // Temperatura en Kelvin
#define M 1.0            // Masa en kg
#define W 1.0            // Frecuencia angular en rad/s

double p, q, fy = 0, fY = 0, area = 0;
double ax = -100, bx = 100;  // Límites de p
double ay = -100, by = 100;  // Límites de q
int i = 0, n;

unsigned long long rdtsc();
double numero_aleatoriop(double ax, double bx);
double numero_aleatorioq(double ay, double by);

int main() {
    srand(rdtsc());

    printf("Ingrese el número de muestras (n): ");
    scanf("%d", &n);

    double beta = 1.0 / (KB * T);  // Cálculo correcto de beta

    for (i = 0; i < n; i++) {
        p = numero_aleatoriop(ax, bx);
        q = numero_aleatorioq(ay, by);

        // Cálculo del Hamiltoniano con valores correctos
        double H = (p * p) / (2.0 * M) + (0.5 * M * W * W * q * q);

        fy = exp(-beta * H);  // Evita desbordamiento en exp
        fY += fy;
    }

    double esp = fY / n;
    area = (bx - ax) * (by - ay) * esp;

    printf("Suma fY: %.20f\n", fY);
    printf("Aproximación de Z: %.20e\n", area);

    return 0;
}

double numero_aleatoriop(double ax, double bx) {
    double escala = rand() / (double)RAND_MAX;
    return ax + escala * (bx - ax);
}

double numero_aleatorioq(double ay, double by) {
    double escala = rand() / (double)RAND_MAX;
    return ay + escala * (by - ay);
}

unsigned long long rdtsc() {
    unsigned int lo, hi;
    __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
    return ((unsigned long long)hi << 32) | lo;
}

