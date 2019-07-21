#import "Node.h"

@implementation Node
@synthesize data = _data;
@synthesize left = _left;
@synthesize right = _right;
static Node *_rightBefore;

- (instancetype)initWithData:(int)data {
  self = [super init];
  if (self) {
    _data = data;
    _left = nil;
    _right = nil;
  }

  return self;
}

+ (BOOL)checkBSTWith:(Node *)node {
  if (node == nil) return true;

  if (![Node checkBSTWith:node.left]) return false;
  if (_rightBefore != nil && _rightBefore.data > node.data) return false;
  _rightBefore = node;
  if (![Node checkBSTWith:node.right]) return false;

  return true;
}

+ (Node *)createBinaryTreeFromArray:(NSArray *)array start:(int)start andEnd:(int)end {
  if (start > end) {
    return nil;
  }

  int mid = (start + end)/2;
  Node *n = [[Node alloc] initWithData:[(NSNumber *)[array objectAtIndex:mid] intValue]];
  n.left = [Node createBinaryTreeFromArray:array start:start andEnd:mid - 1];
  n.right = [Node createBinaryTreeFromArray:array start:mid + 1 andEnd:end];

  return n;
}

+ (Node *)createBinaryTreeFromArray:(NSArray *)array {
  return [Node createBinaryTreeFromArray:array start:0 andEnd:array.count - 1];
}

+ (void)traverseInOrderWithNode:(Node *)node {
  if (node == nil) return;

  [Node traverseInOrderWithNode:node.left];
  NSLog(@"%d", node.data);
  [Node traverseInOrderWithNode:node.right];
}

@end
