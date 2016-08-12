//
//  BasicUtility.h
//  STUtilities
//
//  Created by Sola on 16/8/11.
//  Copyright © 2016年 tscc-sola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BasicUtility : NSObject

+ (instancetype)sharedInstance;

- (void)setButton:(UIButton*)btn titleForAllState:(NSString*)strTitle;
- (void)setButton:(UIButton*)btn titleColorForAllState:(UIColor *)titleColor;
- (void)setButton:(UIButton*)btn titleColors:(NSArray *)arrayColors;
- (void)setButton:(UIButton*)button images:(NSArray*)arrayImages;

- (UIViewController *)getCurrentViewController;

- (NSMutableDictionary*)changeDictionaryFormat:(NSDictionary*)dicInfo;
- (NSMutableArray*)changeArrayFormat:(NSArray*)arrayInfo;
- (id)changeObjectFormat:(id)object;

- (NSDateFormatter*)formatterForString:(NSString*)strFormatter;

- (NSDate*)getLastCheckPinDate;
- (void)setLastCheckPinDate:(NSDate*)date;

@end
