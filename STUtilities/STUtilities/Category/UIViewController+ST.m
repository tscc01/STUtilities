//
//  UIViewController+HaoYa.m
//  HaoYa
//
//  Created by Sola on 15/3/26.
//  Copyright (c) 2015年 Hao Ya. All rights reserved.
//

#import "UIViewController+ST.h"
#import <objc/runtime.h>
#import "NSObject+ST.h"

const void* kTNNavigationBarProgressView = &kTNNavigationBarProgressView;

@implementation UIViewController (ST)
//Create
+ (instancetype)viewController {
    return [self viewControllerFromStoryboardName:@"Controllers"];
}

+ (instancetype)viewControllerFromStoryboardName:(NSString *)storyboardName {
    UIStoryboard* board = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    NSString* key = NSStringFromClass(self);
    return [board instantiateViewControllerWithIdentifier:key];
}

+ (instancetype)viewControllerFromNib {
    UINib* nib = [UINib nibWithNibName:NSStringFromClass(self) bundle:nil];
    return [nib instantiateWithOwner:nil options:nil].firstObject;
}

+ (instancetype)viewControllerFromNibWithClass:(Class)aClass {
    UINib* nib = [UINib nibWithNibName:NSStringFromClass(aClass) bundle:nil];
    return [nib instantiateWithOwner:nil options:nil].firstObject;
}

- (void)sf_viewDidLoad
{
    [self sf_viewDidLoad];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]init];
    backItem.title=@" ";
    self.navigationItem.backBarButtonItem = backItem;
}

+ (void)replaceBackButton
{
    [UIViewController swizzleMethod:@selector(viewDidLoad) newMethod:@selector(sf_viewDidLoad)];
}

- (void)sf_viewWillDisappear:(BOOL)animated
{
    [self.view endEditing:YES];
    
    [self sf_viewWillDisappear:animated];
}

+ (void)replaceKeybordOnDisappear
{
    [UIViewController swizzleMethod:@selector(viewWillDisappear:) newMethod:@selector(sf_viewWillDisappear:)];
}

//Progress view
- (UIProgressView *)progressView {
    if (self.navigationController) {
        UIProgressView* progress = objc_getAssociatedObject(self, kTNNavigationBarProgressView);
        if (!progress) {
            progress = [UIProgressView new];
            UINavigationBar* bar = self.navigationController.navigationBar;
            CGFloat barHeight = CGRectGetHeight(bar.frame);
            CGRect frame = CGRectMake(0, barHeight - 2, CGRectGetWidth(bar.frame), 2);
            progress.frame = frame;
            progress.trackTintColor = [UIColor whiteColor];
            [bar addSubview:progress];
            objc_setAssociatedObject(self, kTNNavigationBarProgressView, progress, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return progress;
    }
    return nil;
}

- (void)setProgress:(float)progress {
    [self.progressView setProgress:progress animated:YES];
}

- (void)setProgress:(float)progress durateion:(NSTimeInterval)duration {
    UIProgressView* p = self.progressView;
    [UIView animateWithDuration:duration animations:^{
        p.progress = progress;
    }];
}

- (void)finishProgressView {
    UIProgressView* progress = self.progressView;
    [progress setProgress:1.0 animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeProgressView];
    });
}

- (void)removeProgressView {
    [self.progressView removeFromSuperview];
}

- (void)st_setNavigationBarColor:(UIColor *)color {
    if (!self.navigationController) {
        return;
    }
    UINavigationBar* bar = self.navigationController.navigationBar;
    
    if ([color isEqual:[UIColor clearColor]]) {
        [bar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        bar.shadowImage = [UIImage new];
        bar.barStyle = UIBarStyleBlack;
        bar.translucent = YES;
    } else {
        [bar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        bar.shadowImage = nil;
        bar.barTintColor = color;
        if (color) {
            bar.barStyle = UIBarStyleBlack;
            bar.translucent = NO;
        } else {
            bar.barStyle = UIBarStyleDefault;
            bar.translucent = YES;
        }
    }
}

- (void)st_setNavigationBarColor:(UIColor *)color tintColor:(UIColor *)tintColor {
    if (!self.navigationController) {
        return;
    }
    UINavigationBar* bar = self.navigationController.navigationBar;
    bar.tintColor = tintColor;
    [self st_setNavigationBarColor:color];
}

- (UIBarButtonItem *)st_createBackBarButtonWithImageName:(NSString *)imageNameOrNil {
    if (self.navigationItem.leftBarButtonItem) {
        return self.navigationItem.leftBarButtonItem;
    }
    if (!imageNameOrNil) {
        imageNameOrNil = @"return_white";
    }
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageNameOrNil] style:UIBarButtonItemStyleBordered target:self action:@selector(backBarButtonAction:)];
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    return item;
}

- (void)backBarButtonAction:(id)sender {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
