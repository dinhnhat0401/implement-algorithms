#import <Foundation/Foundation.h>

#import "IANode.h"

int main(int argc, char *argv[]) {
  @autoreleasepool {
    IANode *head = [[IANode alloc] initWithData:0];
    
    IANode *node1 = [[IANode alloc] initWithData:1];
    head.next = node1;

    IANode *node2 = [[IANode alloc] initWithData:2];
    node1.next = node2;

    IANode *node3 = [[IANode alloc] initWithData:2];
    node2.next = node3;

    [IANode printLinkedListWithHead:head];
    [IANode removeDupsWithHead:head];
    [IANode printLinkedListWithHead:head];
  }
}
 
