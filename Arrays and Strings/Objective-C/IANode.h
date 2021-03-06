#import <Foundation/Foundation.h>

@interface IANode: NSObject

@property (nonatomic, assign) NSInteger data;
@property (nonatomic, strong) IANode *next;
@property (readonly) NSUInteger hash;

- (id)initWithData:(NSInteger)data;
- (BOOL)isEqual:(id)object;

+ (void)printLinkedListWithHead:(IANode *)head;
+ (void)removeDupsWithHead:(IANode *)head;
+ (id)initWithDataArray:(NSArray *)dataArray;

@end

