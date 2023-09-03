#include<pthread.h>
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<semaphore.h>
#include<time.h>
#include<string.h>

int buffer[10];
int count = 0;

#define n 2

pthread_mutex_t counttex;

void* producer(void* arg){


    while(1){
    // Produce step 
    int x = rand()%100;

    pthread_mutex_lock(&counttex);

    // Add to buffer
    buffer[count] = x;
    count++;
    pthread_mutex_unlock(&counttex);
    sleep(1);
    }

}

void* consumer(void* arg){

    while(1){
    // Get and remove value from buffer
    pthread_mutex_lock(&counttex);
    int y = buffer[count - 1];
    count--;

    printf("Consumed %i\n",y);
    pthread_mutex_unlock(&counttex);
    sleep(1);
    }

}


int main(){

    srand(time(NULL));
    pthread_t threads[n];

    pthread_mutex_init(&counttex,NULL);

    for(int i = 0; i < n; i++){
        if(i%2 == 0){
            if(pthread_create(&threads[i],NULL,&producer,NULL)){
                printf("Producer creation error \n");
            }
        }
        else{
            if(pthread_create(&threads[i],NULL,&consumer,NULL)){
                printf("Consumer creation error \n");
            }
        }
    }


    for(int i = 0; i < n; i++){
        if(pthread_join(threads[i],NULL)){
            printf("Join error\n");
        }
    }

    pthread_mutex_destroy(&counttex);

    return 0;

}