//
//  UIViewController+HaoYa.h
//  HaoYa
//
//  Created by Sola on 15/3/26.
//  Copyright (c) 2015年 Hao Ya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ST)

//Create
+ (instancetype)viewController;
+ (instancetype)viewControllerFromNib;
// 不要直接使用该方法
+ (instancetype)viewControllerFromNibWithClass:(Class)aClass;
+ (instancetype)viewControllerFromStoryboardName:(NSString *)storyboardName;

+ (void)replaceBackButton;
+ (void)replaceKeybordOnDisappear;

//Progress view
- (UIProgressView *)progressView;
- (void)setProgress:(float)progress;
- (void)setProgress:(float)progress durateion:(NSTimeInterval)duration;
- (void)finishProgressView;
- (void)removeProgressView;

//Navigation bar color
- (void)st_setNavigationBarColor:(UIColor *)color;
- (void)st_setNavigationBarColor:(UIColor *)color tintColor:(UIColor *)tintColor;

- (UIBarButtonItem *)st_createBackBarButtonWithImageName:(NSString *)imageNameOrNil;
- (void)backBarButtonAction:(id)sender;

@end
