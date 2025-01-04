#include <stdio.h>
#include <stdlib.h>

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
    srand(rdtsc());

    scanf("%d",&n);

    while (i < n) {
        x = numero_aleatorio(a, b);
        Y = Y + y;
        i = i + 1;
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

