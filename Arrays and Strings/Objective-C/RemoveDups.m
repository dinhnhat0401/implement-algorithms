#import <Foundation/Foundation.h>

typedef struct Node {
  int data;
  struct Node *next;
} Node;

void printLinkedList(Node *head) {
  Node *cur = head;
  while(cur != nil) {
    printf("%d ", cur->data);
    cur = cur->next;
  }
  printf("\n");
}

int main(int argc, char *argv[]) {
  @autoreleasepool {
    Node *head = (Node*)malloc(sizeof(Node));
    head->data = 1;
    head->next = nil;
    
    Node *node1 = (Node*)malloc(sizeof(Node));
    node1->data = 2;
    node1->next = nil;
    head->next = node1;

    printLinkedList(head);
  }
}
 
