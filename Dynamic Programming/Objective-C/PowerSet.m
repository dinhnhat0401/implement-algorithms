#import <Foundation/Foundation.h>

@interface PowerSet: NSObject
+ (NSArray<NSArray<NSString *> *> *)getAllSubsetsOfSet:(NSArray<NSString *> *)originalSet;
@end

@implementation PowerSet

+ (void)addNewElement:(NSMutableArray<NSArray<NSString *> *> *)subsets element:(NSString *)element {
  NSMutableArray<NSArray<NSString *> *> *newSubsets = [[NSMutableArray alloc] init];
  for (NSArray<NSString *> *set in subsets) {
    NSMutableArray<NSString *> *newSet = [NSMutableArray arrayWithArray:set];
    [newSet addObject:element];
    [newSubsets addObject:newSet];
  }
  [subsets addObjectsFromArray:newSubsets];
}

+ (NSArray<NSArray<NSString *> *> *)getAllSubsetsOfSet:(NSArray<NSString *> *)originalSet {
  NSMutableArray<NSArray<NSString *> *> *subsets = [[NSMutableArray alloc] init];
  [subsets addObject:[[NSArray alloc] init]];
  for (NSString *str in originalSet) {
    [self addNewElement:subsets element:str];
  }

  return subsets;
}

@end

int main(int argc, char *argv[]) {
  NSArray<NSString *> *set = @[@"a1", @"a2", @"a3", @"a4"];
  NSLog(@"%@", [PowerSet getAllSubsetsOfSet:set]);
}

