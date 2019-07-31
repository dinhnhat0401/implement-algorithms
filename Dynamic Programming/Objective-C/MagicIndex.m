#import <Foundation/Foundation.h>

@interface MagicIndex: NSObject

+ (int)findMagicIndex:(NSArray<NSNumber *> *)array start:(int)start end:(int)end;

@end

@implementation MagicIndex

+ (int)findMagicIndex:(NSArray<NSNumber *> *)array start:(int)start end:(int)end {
  if (start < 0 || start > end) return -1;

  int mid = (start + end)/2;
  int midValue = array[mid].intValue;
  if (mid == midValue) return mid;

  int left = (mid - 1) < midValue ? (mid - 1) : midValue;
  int result = [MagicIndex findMagicIndex:array start:start end:left];
  if (result >= 0) return result;

  int right = (mid + 1) > midValue ? (mid + 1) : midValue;
  return [MagicIndex findMagicIndex:array start:right end:end];
}

@end

int main(int argc, char *argv[]) {
  NSArray<NSNumber *> *array = @[@0, @1, @1, @2, @2, @49, @49, @50, @50, @53, @59, @59];
  NSLog(@"Magic index in the array is: %d", [MagicIndex findMagicIndex:array start:0 end:array.count]); 
}

