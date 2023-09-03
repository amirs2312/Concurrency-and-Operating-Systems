#include<stdlib.h>
#include<stdio.h>
#include<pthread.h>

double result;
double h = 0.1;
int slices = 100;
pthread_mutex_t m;

double f(double x) {
  return (16.0 - x*x) ;
}

double trapezoid(double a, double b) {
  return h*(f(a)+f(b))/2.0;
}

void* integrate(void* arg){
    int* q = (int*)arg;
    int x = *q;
    double a = x*h;
    double b = a + h;
    pthread_mutex_lock(&m);
    result = result + trapezoid(a,b);
    pthread_mutex_unlock(&m);
    pthread_exit(NULL);
}

int main(){

    pthread_t threads[slices];
    pthread_mutex_init(&m,NULL);

    for(int t = 0; t < slices; t++){
        int* p = malloc(sizeof(int));
        *p = t;
        int rc = pthread_create(&threads[t],NULL,integrate,(void*)p);
        if(rc){
            printf("shit");
            return 1;
        }
    }

    for(int t = 0; t < slices; t++){
        int rc = pthread_join(threads[t],NULL);
        if(rc){
            printf("damn");
            return 1;

        }
    }

    printf("\n The result is %lf\n", result);

    return 0;

}
