#import "IANode.h"

@implementation IANode
@synthesize data = _data;
@synthesize next = _next;
@synthesize hash = _hash;

- (id)initWithData:(NSInteger)data {
  self = [super init];
  if (self) {
    _data = data;
    _hash = data;
    _next = nil;
  }
  
  return self;
}

+ (id)initWithDataArray:(NSArray *)dataArray {
  if (dataArray.count == 0) return nil;

  IANode *head = [[IANode alloc] initWithData:[[dataArray objectAtIndex:0] integerValue]];
  IANode *tail = head;
  for (int i = 1; i < dataArray.count; i++) {
    IANode *temp = [[IANode alloc] initWithData:[[dataArray objectAtIndex:i] integerValue]];
    tail.next = temp;
    tail = temp;
  }

  return head;
}

+ (void)printLinkedListWithHead:(IANode *)head {
  if (head == nil) return;  
  
  printf("\n");  

  IANode *current = head;
  while(current != nil) {
    printf("%ld ", current.data);
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

