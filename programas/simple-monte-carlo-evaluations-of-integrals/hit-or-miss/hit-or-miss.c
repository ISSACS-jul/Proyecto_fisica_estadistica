#include <stdio.h>
#include <stdlib.h>

//definir variables
double a = 0;
double b = 1.5;
double h = 5;
double x;
double y;
int vf;
int i = 0;
int n = 1000000;
int aciertos = 0;
double integral = 0;

//definir las funciones a utilizar
double arrojar_piedrax(double a,double b);
double arrojar_piedray(double h);
unsigned long long rdtsc();
int cae_debajo(double x, double y);

//funcion principal
int main() {

    srand(rdtsc());

    while (i<n) {
        x = arrojar_piedrax(a,b);
        y = arrojar_piedray(h);
        vf = cae_debajo(x,y);
        i = i+1; 
        if (vf == 1) {
            aciertos = aciertos + 1;
        }
    }

    integral = (b-a)*h*aciertos/n;
    printf(" La integral es: %.5f\n Se realizaron %i intentos \n Se obtuvieron %i aciertos\n",integral,n,aciertos);

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

//Comprobar donde cae la piedra 
int cae_debajo(double x, double y) {
    double fx = (-5*x*x) + 8*x;
    int logica;
    if (y<fx) {
      logica = 1;    
    } else {
      logica = 0;
    }
  return logica;
}

//Contar los ciclos del procesador en 64bits para generar numeros aleatorios de coma flotante con alta entropia
unsigned long long rdtsc() {
    unsigned int lo, hi;
    __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
    return ((unsigned long long)hi << 32) | lo;
}
