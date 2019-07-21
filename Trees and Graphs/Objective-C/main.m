#import "Node.h"

int main(int argc, char* argv[]) {
  @autoreleasepool {
    NSArray* array1 = @[@3, @5, @7, @10, @15, @17, @20, @30];
    Node *root1 = [Node createBinaryTreeFromArray: array1];
    [Node traverseInOrderWithNode:root1];
    assert([Node checkBSTWith:root1] == YES);

    NSArray* array2 = @[@3, @4, @5, @7, @99, @12, @24];
    Node *root2 = [Node createBinaryTreeFromArray: array2];
    assert([Node checkBSTWith:root2] == NO);
  }

  return 1;
}

