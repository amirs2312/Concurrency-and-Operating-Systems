#include<stdio.h>
#include<pthread.h>
#include<stdlib.h>
#include<time.h>

double array[60000];
double avg;

pthread_mutex_t m;

void* function(void* arg){
    int* q = (int*)arg;
    int x = *q;

    for(int i = 0; i < 10000; i++){
        pthread_mutex_lock(&m);
        avg = avg + array[(10000*x)+ i];
        pthread_mutex_unlock(&m);
    }

    free(arg);
    pthread_exit(NULL);
}



int main(){

    pthread_t threads[6];
    pthread_mutex_init(&m,NULL);
    srand(time(NULL));

    for(int i = 0; i< 60000; i++){
        array[i] = rand()%100;     
    }

    for(int t = 0;t < 6; t++){

        int* p = malloc(sizeof(int));
        *p = t;
        int check = pthread_create(&threads[t],NULL,function,(void*)p);
        if(check){
            printf("Error");
            return 1;
        }
    }

    for(int t = 0;t < 6; t++){
        int check = pthread_join(threads[t],NULL);
        if(check){
            printf("error");
            return 1;
        }
    }

    avg = avg/60000;
    pthread_mutex_destroy(&m);

    printf("\nAverage is %lf\n",avg);


    return 0;



}