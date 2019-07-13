#import "IANode.h"

BOOL palindrome(IANode* node) {
  if (node == nil) return NO;

  IANode *slow = node;
  IANode *fast = node;
  NSMutableArray *stack = [[NSMutableArray alloc] init];

  while (fast != nil) {
    [stack addObject:slow];
    slow = slow.next;
    if (fast.next == nil) {
      [stack removeLastObject];
      break;
    }
    fast = fast.next.next;
  }

  while (slow != nil) {
    IANode *obj = [stack lastObject];
    [stack removeLastObject];
    if (slow.data != obj.data) return NO;
    slow = slow.next;
  }

  return YES;
}

int main(int argc, char *argv[]) {
  IANode *head = [IANode initWithDataArray:@[@7, @1, @6, @9, @6, @1, @7]];
  [IANode printLinkedListWithHead:head];
  palindrome(head) ? NSLog(@"IS A palindrome") : NSLog(@"IS NOT a palindrome");
}

