//
//  MixCalc.h
//  MixLang
//
//  Created by yunjikim on 2023/07/13.
//

#import <Foundation/Foundation.h>

// h(헤더) 파일은 선언부만 있게 된다.

@interface MixCalc : NSObject

// class
- (NSString *) greetingMessage;

// 값 타입
// (int)는 리턴 타입
- (int)addOne:(int)number;

// plus:with:
- (int)plus:(int)number1 with:(int)number2;

// minus:with:
- (int)minus:(int)number1 with:(int)number2;

// multiply:with:
- (int)multiply:(int)number1 with:(int)number2;

// divide:with:
- (int)divide:(int)number1 with:(int)number2;

@end
