#import <Foundation/Foundation.h>

@interface Node: NSObject

//@property(class, nonatomic) Node *rightBefore;
@property(nonatomic, assign) int data;
@property(nonatomic, strong) Node *left;
@property(nonatomic, strong) Node *right;

- (instancetype)initWithData:(int)data;

+ (Node *)createBinaryTreeFromArray:(NSArray *)array;
+ (void)traverseInOrderWithNode:(Node *)node;
+ (BOOL)checkBSTWith:(Node *)node;

@end

