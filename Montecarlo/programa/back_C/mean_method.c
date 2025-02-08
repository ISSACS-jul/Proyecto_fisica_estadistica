#include <stdio.h>
#include <stdlib.h>

double z;
double y;
double x;
double fy = 0;
double fY = 0;
double area = 0;
int i = 0;
int n;

unsigned long long rdtsc();
double numero_aleatoriox(double ax, double bx);
double numero_aleatorioy(double ay, double by);
double numero_aleatorioz(double az, double bz);

int main() {
    srand(rdtsc());

    scanf("%d",&n);

    while (i < n) {
        x = numero_aleatoriox(ax, bx);
        y = numero_aleatorioy(ay, by);
        z = numero_aleatorioz(az, bz);
        fY = fY + fy;
        i = i + 1;
    }
    
    double esp = fY / n;
    area = (bx - ax) * (by - ay) * (bz - az) * esp;
    printf("%.20f\n", fY);

    return 0;
}

double numero_aleatoriox(double ax, double bx) {
    double escala = rand() / (double)RAND_MAX;
    return ax + escala * (bx - ax);
}

double numero_aleatorioy(double ay, double by) {
    double escala = rand() / (double)RAND_MAX;
    return ay + escala * (by - ay);
}

double numero_aleatorioz(double az, double bz) {
    double escala = rand() / (double)RAND_MAX;
    return az + escala * (bz - az);
}

unsigned long long rdtsc() {
    unsigned int lo, hi;
    __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
    return ((unsigned long long)hi << 32) | lo;
}

