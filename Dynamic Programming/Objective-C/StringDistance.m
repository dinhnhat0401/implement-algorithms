#import <Foundation/Foundation.h>

@interface StringDistance: NSObject

+ (int)distanceStr1:(NSString *)str1 withStr2:(NSString *)str2;

@end

@implementation StringDistance

+ (BOOL)isEmpty:(NSString *)str {
  return (str == nil || [str isEqualToString:@""]);
}

+ (int)distanceStr1:(NSString *)str1 withStr2:(NSString *)str2 {
   if ([StringDistance isEmpty:str1] && [StringDistance isEmpty:str2]) {
    return 0;
  } else if ([StringDistance isEmpty:str1]) {
    return str2.length;
  } else if ([StringDistance isEmpty:str2]) {
     return str1.length;
  }

  if (str1.length < str2.length) {
     NSString *tmp = str2;
     str2 = str1;
     str1 = tmp;
  }

  NSMutableArray<NSMutableArray<NSNumber *> *> *memo = [[NSMutableArray alloc] initWithCapacity:str2.length];
  for (int i = 0; i < str2.length; i++) {
    memo[i] = [[NSMutableArray alloc] initWithCapacity:str2.length];
    for (int j = 0; j < str2.length; j++) {
      memo[i][j] = [NSNumber numberWithInt:-1];
    }
  }
  return [StringDistance distanceStr1:str1 withStr2:str2 X:0 Y:0 memo:memo];
}

+ (int)distanceStr1:(NSString *)str1 withStr2:(NSString *)str2 X:(int)x Y:(int)y memo:(NSMutableArray<NSMutableArray<NSNumber *> *> *)memo {
  if (x == str1.length - 1) return str2.length - 1 - y;
  if (y == str2.length - 1) return str1.length - 1 - x;

  int value = [memo[x][y] intValue];
  if (value != -1) {
    return value;
  }

  char char1 = [str1 characterAtIndex:x];
  char char2 = [str2 characterAtIndex:y];

  if (char1 == char2) {
    memo[x][y] = [NSNumber numberWithInt:[StringDistance distanceStr1:str1 withStr2:str2 X:x + 1 Y:y + 1 memo:memo]];
  } else {
    // add char2 to the beginning of str1
    int add = 1 + [StringDistance distanceStr1:str1 withStr2:str2 X:x Y:y + 1 memo:memo];

    // sub the char1 to make char1, char2 equal
    int sub = 1 + [StringDistance distanceStr1:str1 withStr2:str2 X:x + 1 Y:y + 1 memo:memo];

    // remove the char1 from bigger string str1
    int remove = 1 + [StringDistance distanceStr1:str1 withStr2:str2 X:x + 1 Y:y memo:memo];

    memo[x][y] = MIN(MIN([NSNumber numberWithInt:add], [NSNumber numberWithInt:sub]), [NSNumber numberWithInt:remove]);
  }

  return [memo[x][y] intValue];
}

@end

int main(int argc, char *argv[]) {
  NSLog(@"distance between bitting and sitting is:%d", [StringDistance distanceStr1:@"bitting" withStr2:@"sitting"]);

  NSCAssert([StringDistance distanceStr1:@"cheating" withStr2:@"che"] == 5, @"test 1 is failed");
  NSCAssert([StringDistance distanceStr1:@"cheating" withStr2:@"heatin"] == 2, @"test 2 is failed");
  NSCAssert([StringDistance distanceStr1:@"biting" withStr2:@"sitting"] == 2, @"test 3 is failed");
  NSCAssert([StringDistance distanceStr1:@"cheating" withStr2:@"wheatwwg"] == 3, @"test 4 is failed");

  NSLog(@"All tests passed");
}

