#import "IANode.h"

@implementation IANode
@synthesize data = _data;
@synthesize next = _next;
@synthesize hash = _hash;

- (id)initWithData:(int)data {
  self = [super init];
  if (self) {
    _data = data;
    _hash = data;
    _next = nil;
  }
  
  return self;
}

+ (void)printLinkedListWithHead:(IANode *)head {
  if (head == nil) return;  
  
  printf("\n");  

  IANode *current = head;
  while(current != nil) {
    printf("%d ", current.data);
    current = current.next;
  }

  printf("\n");
}

+ (void)removeDupsWithHead:(IANode *)head {
  if (head == nil) return;

  NSMutableSet *dataSet = [[NSMutableSet alloc] init];
  IANode *current = head;
  
  [dataSet addObject:current];
  
  while(current != nil) {
    if ([dataSet containsObject:current.next]) {
      current.next = current.next.next;
    } else {
      printf("Doesn't contain: %d\n", current.data);
      [dataSet addObject:current.next];
    }
    current = current.next;
  }
}

- (BOOL)isEqual:(id)object {
  if (![object isKindOfClass:[IANode class]]) return NO;

  IANode *node = (IANode *)object;
  printf("Self hash = %ld, current hash = %ld\n", self.hash, node.hash);
  return self.data == node.data;
}

@end

