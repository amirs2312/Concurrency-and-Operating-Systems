#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>

#define n 1000

int perfect_count;

pthread_mutex_t m;

int is_perfect_number(int num) {
    if (num <= 0) {
        return 0;
    }

    int sum_of_divisors = 0;

    for (int i = 1; i <= num / 2; i++) {
        if (num % i == 0) {
            sum_of_divisors += i;
        }
    }

    return (sum_of_divisors == num);
}

void* routine(void* arg){

    int* q = (int*)arg;
    int x = *q;

    if(is_perfect_number(x)){
        pthread_mutex_lock(&m);
        perfect_count++;
        pthread_mutex_unlock(&m);
    }

    free(arg);

    pthread_exit(NULL);

}

int main(){

    pthread_t threads[n];
    pthread_mutex_init(&m,NULL);

    for(int t = 0; t<n;t++){
        int* p = malloc(sizeof(int));
        *p = t;

        int rc = pthread_create(&threads[t],NULL,routine,(void*)p);

        if(rc){
            return 1;
        }
    }

    for(int t = 0; t<n;t++){
        pthread_join(threads[t],NULL);
    }

    pthread_mutex_destroy(&m);

    printf("\n Count = %i \n",perfect_count);

    return 0;
}
