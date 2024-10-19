#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//definir variables
double a;
double b;
double h;
double x;
double y;

//definir las funciones a utilizar
double arrojar_piedrax(double a,double b);
double arrojar_piedray(double h);
unsigned long long rdtsc();

//funcion principal
int main() {

    srand(rdtsc());
    a = 10;
    b = 50;
    h = 100;
    x = arrojar_piedrax(a,b);
    y = arrojar_piedray(h);
    printf("X: %.2f\n Y: %.2f\n",x,y);

    return 0;
}

//Escribir las funciones a utilizar

//Lanzar la piedra en x para los rangos establecidos
double arrojar_piedrax(double a,double b) {
    double escala = rand() / (double)RAND_MAX;
    return a + escala * (b - a);
}

//Lanzar la piedra en y para los rangos establecidos
double arrojar_piedray(double h) {
    double escala = rand() / (double)RAND_MAX;
    return 0 + escala * (h); 
}

//Contar los ciclos del procesador en 64bits para generar numeros aleatorios de coma flotante con alta entropia
unsigned long long rdtsc() {
    unsigned int lo, hi;
    __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
    return ((unsigned long long)hi << 32) | lo;
}
