//
//  UIViewController+SplashView.h
//  TengNiu
//
//  Created by Sola on 15/4/16.
//  Copyright (c) 2015年 Teng Niu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashFailedView.h"

@interface UIViewController (SplashView) <SplashFailedViewDelegate>

- (void)st_setViewControlerInLoading;
- (void)st_setViewControlerInLoadingWithViewEdgeInstets:(UIEdgeInsets)viewEdgeInstets;

- (void)st_setViewControlerLoadingSuccess;

- (void)st_setViewControlerLoadingFailed:(NSError*)error;
- (void)st_setViewControlerLoadingFailed:(NSError*)error withViewEdgeInstets:(UIEdgeInsets)viewEdgeInstets;

- (void)st_setViewControlerLoadingFinishedWithNoneDataWithViewEdgeInstets:(UIEdgeInsets)viewEdgeInstets;
- (void)st_setViewControlerLoadingFinishedWithNoneDataWithViewEdgeInstets:(UIEdgeInsets)viewEdgeInstets message:(NSString*)strMessage;
- (void)st_setViewControlerLoadingFinishedWithNoneDataWithViewEdgeInstets:(UIEdgeInsets)viewEdgeInstets message:(NSString*)strMessage font:(UIFont*)font;
- (void)st_setViewControlerLoadingFinishedWithNoneData;
- (void)st_setViewControlerLoadingFinishedWithNoneData:(NSString*)strTitle;

- (void)showProgress;
- (void)hideProgress;

@end