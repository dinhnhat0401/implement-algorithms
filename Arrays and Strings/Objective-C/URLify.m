//
//  main.m
//  test
//
//  Created by Đinh Văn Nhật on 2019/07/09.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

#import <Foundation/Foundation.h>

void URLify(char characters[], int length) {
  int spaceCount = 0;
  for (int i = 0; i < length; i++) {
    if (characters[i] == ' ') spaceCount++;
  }

  characters[length + spaceCount * 2] = '\0';

  for (int i = length - 1; i >= 0; i--) {
    if (characters[i] == ' ') {
      spaceCount--;
      characters[i + spaceCount * 2] = '%';
      characters[i + spaceCount * 2 + 1] = '2';
      characters[i + spaceCount * 2 + 2] = '0';
    } else {
      characters[i + spaceCount * 2] = characters[i];
    }
  }

  //return characters;
}

int main(int argc, char * argv[]) {
  @autoreleasepool {
    char input[] = {'M', 'r', ' ', 'J', ' ', ' '};
    URLify(input, 4);
    NSLog(@"%s\n", input);
  }
}

