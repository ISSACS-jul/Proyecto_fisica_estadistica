#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double p;
double q;
double fy = 0;
double fY = 0;
double area = 0;
int i = 0;
int n;

unsigned long long rdtsc();
double numero_aleatoriop(double ax, double bx);
double numero_aleatorioq(double ay, double by);

int main() {
    srand(rdtsc());

    scanf("%d",&n);

    while (i < n) {
        p = numero_aleatoriop(ax, bx);
        q = numero_aleatorioq(ay, by);
        fY = fY + fy;
        i = i + 1;
    }
    
    double esp = fY / n;
    area = (bx - ax) * (by - ay) * esp;
    printf("%.20f\n", fY);

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

