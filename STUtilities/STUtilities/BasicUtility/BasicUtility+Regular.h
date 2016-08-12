//
//  BasicUtility+Regular.h
//  minjian
//
//  Created by Sola on 16/5/19.
//  Copyright © 2016年 forfunnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicUtility.h"

@interface BasicUtility (Regular)

- (BOOL)checkString:(NSString *)string whetherMathchRegularExpression:(NSString *)regularExpression;

- (BOOL)isStringIsInteger:(NSString *)string;
- (BOOL)isStringIsValidAmount:(NSString *)string;

- (BOOL)isStringMathchPhoneFormat:(NSString *)strNumber;

- (BOOL)isPasswordValid:(NSString *)strPassword;
- (BOOL)isPaymentPasswordValid:(NSString *)strPassword;

- (BOOL)isInputStringValidCardId:(NSString *)strNumber;
- (BOOL)isInputStringValidPhone:(NSString *)strPhone;
- (BOOL)isInputStringValidPersonalId:(NSString *)strId;
- (BOOL)isInputStringValidCheckPin:(NSString *)strCheck;

- (NSRegularExpression *)regularExpressionWithString:(NSString *)string;
- (BOOL)verifyString:(NSString *)string UsingRegularExpression:(NSRegularExpression *)regularExpression;
- (BOOL)isChineseNameValid:(NSString*)strName;
- (BOOL)isPersonalIdValid:(NSString*)strPersonalId;
- (BOOL)isBankCardIdValid:(NSString*)strId;


@end
