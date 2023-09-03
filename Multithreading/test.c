#include<stdio.h>
#include<pthread.h>
#include<unistd.h>




pthread_t threads[8];

void * sleepsort(void* i){
    int* ptr = i;
    usleep(*ptr);
    printf("%i \n",*ptr);
    
    return NULL;
}

int main(){

    int array[] = {32,34,756,1324,345,70,10000000,900};

    for(int t=0;t<8;t++){
        //first create an int pointer for the int then create a coid* and void cast the int* to pass it though
        //I have no idea why it has to be this way
        int n;
        int * g = &array[t];
        void * ptr = (void*)g;
        // 2nd argument refers to thread attributes where null is default
        // 4th argument is the coid pointer to be passed into the void function.
        n = pthread_create(&threads[t],NULL,sleepsort,ptr);
        if(n){
            printf("uh oh %i",t);
            return -1;
        }
    }

    for(int t=0;t<8;t++){
        pthread_join(threads[t],NULL);
        //printf("joined\n");
    }

   


    
    return 0;
}