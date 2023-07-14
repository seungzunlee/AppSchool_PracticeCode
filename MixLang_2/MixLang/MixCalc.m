//
//  MixCalc.m
//  MixLang
//
//  Created by yunjikim on 2023/07/13.
//

#import <Foundation/Foundation.h>

#import "MixCalc.h"

// m 파일은 구체적인 내용을 작성한다.

@implementation MixCalc

- (NSString *)greetingMessage {
    return @"Hello World";
}


- (int)addOne:(int)number {
    int result = number + 1;
    return result;
}

// 덧셈
- (int)plus:(int)number1 with:(int)number2 {
    int result = number1 + number2;
    return result;
}

// 뺄셈
- (int)minus:(int)number1 with:(int)number2 {
    int result = number1 - number2;
    return result;
}

// 곱셈
- (int)multiply:(int)number1 with:(int)number2 {
    int result = number1 * number2;
    return result;
}

// 나눗셈
- (int)divide:(int)number1 with:(int)number2 {
    int result = number1 / number2;
    return result;
}

@end
