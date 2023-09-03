int 




struct node {
struct node *next;
int value;
};
struct queue {
struct node *head;
struct node *tail;
};
void initialize(struct queue *Q) {
struct node *dummy = malloc(sizeof(struct node));
dummy->next = 0;
dummy->value = 0;
Q->head = Q->tail = dummy;
}
void enqueue(struct queue *Q, int data){
struct node *new = malloc(sizeof(struct node));
new->next = 0;
new->value = data;
Q->tail->next=new;
Q->tail=new;
}
void dequeue(struct queue *Q){
struct node *temp;
temp = Q->head;
Q->head = temp->next;
free(temp);
}
void e(struct queue_t *Q) {
int val = 1;
while(1) enqueue(Q, val++);
}
void d(struct queue_t *Q) {
while(1) dequeue(Q);
}

int main(){
struct queue *qu = malloc(sizeof(struct queue));
initialize(qu);
e(qu);
d(qu);
}