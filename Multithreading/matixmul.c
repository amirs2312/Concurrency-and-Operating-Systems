#include<stdio.h>
#include<pthread.h>
#include<stdlib.h>

const int n = 3;

int inputMatrixA[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
int inputMatrixB[3][3] = {{9, 8, 7}, {6, 5, 4}, {3, 2, 1}};
int outputMatrix[3][3];


void* entry(void* arg);


int main(){

    pthread_t threads[n];

    for(int t = 0; t < n; t++){
        int* a = malloc(sizeof(int));
        *a = t;

        int rc = pthread_create(&threads[t],NULL,entry,(void*)a);
        if(rc){
            printf("\nfuck\n");
            return 1;
        }
    }

    for(int t = 0; t < n; t++){
        pthread_join(threads[t],NULL);
    }

    printf("\n[%i  %i  %i\n %i  %i  %i\n %i  %i  %i ]\n\n",outputMatrix[0][0],outputMatrix[0][1],outputMatrix[0][2],outputMatrix[1][0],outputMatrix[1][1],outputMatrix[1][2],outputMatrix[2][0],outputMatrix[2][1],outputMatrix[2][2]);


    return 1;

}

void* entry(void* arg){

    int* p = (int*)arg;
    int index = *p;
    int sum = 0;

    for(int i = 0;i < 3;  i++){
        sum = sum + inputMatrixA[index][i]*inputMatrixB[i][0]; 
    }

    outputMatrix[index][0] = sum;

    sum = 0;

     for(int i = 0;i < 3;  i++){
        sum = sum + inputMatrixA[index][i]*inputMatrixB[i][1]; 
    }

     outputMatrix[index][1] = sum;

    sum = 0;

     for(int i = 0;i < 3;  i++){
        sum = sum + inputMatrixA[index][i]*inputMatrixB[i][2]; 
    }

     outputMatrix[index][2] = sum;


     free(arg);

    pthread_exit(NULL);



}