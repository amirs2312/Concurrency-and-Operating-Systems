#include<stdio.h>
#include<pthread.h>
#include<stdlib.h>


double slices = 2;   
double ans = 0;

double Trapezoid(double a,double b);
double f(double x);
//double integrate(double a,double b);

void* integratepart(void* value);

int main(){

    pthread_t threads[(int)slices];
    long i;

    for(i = 0; i<slices; i++){

        long* p = &i;

        void* j = (void*)p;

         long rc = pthread_create(&threads[i],NULL,integratepart,j);

         if(rc){
            printf("Error returned \n");
            exit(-1);
         }

         for(int k = 0; k < slices;k++){

            pthread_join(threads[i],NULL);
         }

         printf("%f is the answer",ans);

         return 0;

    }




}







double f(double x){

    return 16-x*x;

}

double Trapezoid(double a,double b){

    return 1/slices*(f(a)+f(b))/2;
    printf("called\n");
    

}

/*double integrate(double a,double b){

    double step = (b-a)/slices;
    double  answer = 0;

    for(int i = 0;a+(i+1)*step<=b;i++){
        answer = answer + Trapezoid(a + i*step,a + (i+1)*step,step); 
    }

    return answer;

}*/

void* integratepart(void* value){

    double a, b, area;

    a = (int)value * 1/slices;
    b = a + 1/slices;
    area = Trapezoid(a,b);

    ans = ans + area;

    pthread_exit(NULL);

}

