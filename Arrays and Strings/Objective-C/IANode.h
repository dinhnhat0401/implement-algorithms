#import <Foundation/Foundation.h>

@interface IANode: NSObject

@property (nonatomic, assign) int data;
@property (nonatomic, strong) IANode *next;
@property (readonly) NSUInteger hash;

- (id)initWithData:(int)data;
- (BOOL)isEqual:(id)object;

+ (void)printLinkedListWithHead:(IANode *)head;
+ (void)removeDupsWithHead:(IANode *)head;

@end

