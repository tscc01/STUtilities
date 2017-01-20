//
//  BasicUtility+Regular.m
//  minjian
//
//  Created by Sola on 16/5/19.
//  Copyright © 2016年 forfunnet. All rights reserved.
//

#import "BasicUtility+Regular.h"

NSInteger TNAmountMaxLenght = 10;
NSInteger TNAmountMaxLengthWithDecimalPoint = 13;

@implementation BasicUtility (Regular)


- (BOOL)checkString:(NSString *)string whetherMathchRegularExpression:(NSString *)regularExpression {
    NSRegularExpression* regex = [self regularExpressionWithString:regularExpression];
    if (!regex) {
        return NO;
    }
    return [self verifyString:string UsingRegularExpression:regex];
}

- (BOOL)isStringIsInteger:(NSString *)string {
    if (!string) {
        return NO;
    }
    static NSRegularExpression* regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [self regularExpressionWithString:@"[\\d]+"];
    });
    return [self verifyString:string UsingRegularExpression:regex];
}

- (BOOL)isStringIsValidAmount:(NSString *)string
{
    NSRange range = [string rangeOfString:@"."];
    if (range.location == NSNotFound && string.length > TNAmountMaxLenght) { //不包含小数点
        return NO;
    }
    if (range.location != NSNotFound && string.length > TNAmountMaxLengthWithDecimalPoint) { //包含小数点
        return NO;
    }
    static NSRegularExpression* regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [self regularExpressionWithString:@"([1-9]([0-9]+)?([.]{1})?([0-9]{1,2})?)|([0]([.]{1}([0-9]{1,2})?)?)"];
    });
    return [self verifyString:string UsingRegularExpression:regex];
}

- (BOOL)isStringMathchPhoneFormat:(NSString *)strNumber {
    static NSRegularExpression* regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [self regularExpressionWithString:@"1\\d{10}"];
    });
    return [self verifyString:strNumber UsingRegularExpression:regex];
}

- (BOOL)isPasswordValid:(NSString *)strPassword {
    //    static NSRegularExpression* regex;
    //    static dispatch_once_t onceToken;
    //    dispatch_once(&onceToken, ^{
    //        regex = [TNRegularExpressionUtility regularExpressionWithString:@"{8,}"];
    //    });
    return strPassword.length >= 8;
}

- (BOOL)isPaymentPasswordValid:(NSString *)strPassword
{
    static NSRegularExpression* regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [self regularExpressionWithString:@"[0-9]{6}"];
    });
    return [self verifyString:strPassword UsingRegularExpression:regex];
}

- (BOOL)isInputStringValidCardId:(NSString *)strNumber
{
    static NSRegularExpression* regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [self regularExpressionWithString:@"[0-9]{1,}"];
    });
    return strNumber.length < 28 && [self verifyString:strNumber UsingRegularExpression:regex];
}


- (BOOL)isInputStringValidPhone:(NSString *)strPhone
{
    static NSRegularExpression* regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [self regularExpressionWithString:@"[0-9]{1,}"];
    });
    return strPhone.length < 12 && [self verifyString:strPhone UsingRegularExpression:regex];
}

- (BOOL)isInputStringValidPersonalId:(NSString *)strId
{
    static NSRegularExpression* regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [self regularExpressionWithString:@"[0-9xX]{1,}"];
    });
    return strId.length < 19 && [self verifyString:strId UsingRegularExpression:regex];
}

- (BOOL)isInputStringValidCheckPin:(NSString *)strCheck
{
    static NSRegularExpression* regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [self regularExpressionWithString:@"[0-9]{1,6}"];
    });
    return [self verifyString:strCheck UsingRegularExpression:regex];
}

- (NSRegularExpression *)regularExpressionWithString:(NSString *)string {
    NSError* error = nil;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:string options:0 error:&error];
    if (error) {
        NSLog(@"%@", error);
        return nil;
    }
    return regex;
}

- (BOOL)verifyString:(NSString *)string UsingRegularExpression:(NSRegularExpression *)regularExpression {
    if (!string) {
        return NO;
    }
    
    NSTextCheckingResult* result = [regularExpression firstMatchInString:string options:0 range:NSMakeRange(0, string.length)];
    if (!result) {
        return NO;
    }
    NSRange range = [result range];
    if (range.length == string.length) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isChineseNameValid:(NSString*)strName
{
    static NSRegularExpression* regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [self regularExpressionWithString:@"[\\u4E00-\\u9FA5\\uF900-\\uFA2D]{2,}"];
    });
    
    return [self verifyString:strName UsingRegularExpression:regex];
}

- (BOOL)isPersonalIdValid:(NSString*)strPersonalId
{
    static NSRegularExpression* regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [self regularExpressionWithString:@"([1-9]\\d{7}((0[1-9])|(1[0-2]))((0[1-9])|([1-2]\\d)|3[0-1])\\d{3})|([1-9]\\d{5}[1-9]\\d{3}((0[1-9])|(1[0-2]))((0[1-9])|([1-2]\\d)|3[0-1])\\d{3}([0-9]|X))"];
    });
    
    return [self verifyString:strPersonalId UsingRegularExpression:regex];
}

- (BOOL)isBankCardIdValid:(NSString*)strId
{
    static NSRegularExpression* regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [self regularExpressionWithString:@"[0-9]\\d{14,}"];
    });
    
    return [self verifyString:strId UsingRegularExpression:regex];
}


@end
