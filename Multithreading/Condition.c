#include<pthread.h>
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

int fuel = 0;

pthread_mutex_t futex;

pthread_cond_t condfuel;


void* fuel_filling(void* arg){

    printf("Filling\n\n");

    for(int i = 0; i < 10; i++){
        pthread_mutex_lock(&futex);

        fuel += 80;
        printf("Fuel is %i\n", fuel);

        pthread_mutex_unlock(&futex);

        // Signals not that the condition is true, but might have changed
        // Only signals one thread to check the condtion
        pthread_cond_broadcast(&condfuel);
        // Broadcast hits every waiting thread.

        sleep(1);
        
    }

}

void* car(void* car){

    printf("Here to get fuel\n");

    pthread_mutex_lock(&futex);

    // While loop is necessary to actually set condition
    // Acquires lock before while loop, hence is the only car looking for a fuel
    while(fuel < 50){

        printf("Not enough \n");

        // Unlocks mutex and waits for cond fuel signal
        // After cond is met lock again and carry out job
        pthread_cond_wait(&condfuel,&futex);
    }


    fuel -= 50;
    printf("Got it: Fuel is %i\n", fuel);


    pthread_mutex_unlock(&futex);
    

}


int main(){

    pthread_t threads[5];

    // You always initialise conds and locks
    pthread_mutex_init(&futex,NULL);
    pthread_cond_init(&condfuel,NULL);

    for(int i = 0; i<5; i++){

        if(i == 4){
            int rc = pthread_create(&threads[i],NULL,&fuel_filling,NULL);
            if(rc){ printf("shit");}
        }
        else{
            int rc2 = pthread_create(&threads[i],NULL,&car,NULL);
            if(rc2){printf("damn");}

        }
    }

    for(int i = 0;i < 5; i++){
        int rc3 = pthread_join(threads[i],NULL);
        if(rc3){ printf("damns");}
        
    }


    // And you always destroy locks and conds
    pthread_mutex_destroy(&futex);
    pthread_cond_destroy(&condfuel);

    return 0;



}