#include<pthread.h>
#include<stdio.h>
#include<stdlib.h>

const int size = 10;

int array[size] = {1,2,3,4,5,6,7,8,9,0};
int sum = 0;

void* SumArray(void* arg){

    int p = *((int*)arg);

    sum = sum + array[p];
    //printf("%i\n",array[p]);

    pthread_exit(NULL);

    free(arg);

}

int main(){

    pthread_t threads[size];

    for(int t = 0;t<size;t++){

        int* a = malloc(sizeof(int));
        *a = t;
        // New threads can start before the previous thread gets to use the value of t, since they're all pointing
        // to the same address, this can be avoided by mallocing and freeing and individual space for
        // each value of t


        int check = pthread_create(&threads[t],NULL,SumArray,(void*)a);
    }

    for(int i = 0;i< size;i++){
        pthread_join(threads[i],NULL);
    }

    printf("sum is %i \n\n",sum);

    return 0;
}