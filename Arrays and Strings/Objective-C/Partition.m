#import <Foundation/Foundation.h>

#import "IANode.h"

IANode* partition(IANode *head, int value) {
  if (head == nil) return nil;
  
  IANode *head1 = nil;
  IANode *tail1 = nil;
  IANode *head2 = nil;
  IANode *tail2 = nil;

  IANode *current = head;
  while (current != nil) {
    if (current.data < value) {
      if (head1 == nil) {
        head1 = current;
        tail1 = current;
      } else {
        tail1.next = current;
        tail1 = current;
      }
    } else {
      if (head2 == nil) {
        head2 = current;
        tail2 = current;
      } else {
        tail2.next = current;
        tail2 = current;
      }
    }
    current = current.next;
  }
  
  tail1.next = head2;
  tail2.next = nil;

  return head1;
}

int main(int argc, char *argv[]) {
  IANode *head = [[IANode alloc] initWithData:3];
  IANode *node2 = [[IANode alloc] initWithData:5];
  head.next = node2;
  IANode *node3 = [[IANode alloc] initWithData:8];
  node2.next = node3;
  IANode *node4 = [[IANode alloc] initWithData:5];
  node3.next = node4;
  IANode *node5 = [[IANode alloc] initWithData:10];
  node4.next = node5;
  IANode *node6 = [[IANode alloc] initWithData:2];
  node5.next = node6;
  IANode *node7 = [[IANode alloc] initWithData:1];
  node6.next = node7;

  [IANode printLinkedListWithHead:head];
  IANode *newHead = partition(head, 5);
  [IANode printLinkedListWithHead:newHead];
}

