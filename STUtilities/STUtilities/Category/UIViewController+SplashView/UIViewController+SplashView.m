//
//  UIViewController+SplashView.m
//  TengNiu
//
//  Created by Sola on 15/4/16.
//  Copyright (c) 2015年 Teng Niu. All rights reserved.
//

#import "UIViewController+SplashView.h"
#import <objc/runtime.h>
#import "LoadingSplashView.h"
#import "SplashFailedView.h"
#import "NoneDataView.h"
#import <PureLayout/PureLayout.h>
#import "HUDProgressView.h"
#import "UIView+ST.h"

enum {
    PROGRESS_STATUS_SHOW = 0,
    PROGRESS_STATUS_HIDE = 1,
};

enum {
    SPLASH_STATUS_LOADING = 0,
    SPLASH_STATUS_SUCCESS = 1,
    SPLASH_STATUS_FAILED = 2,
    SPLASH_STATUS_NONE = 3,
};

@interface UIViewController (SplashViewHolder)

@property (nonatomic, strong) HUDProgressView *st_viewHud;
@property (nonatomic, strong) LoadingSplashView *st_viewSplash;
@property (nonatomic, strong) SplashFailedView *st_viewSplashFailed;
@property (nonatomic, strong) NoneDataView *st_noDataView;
@property (nonatomic, strong) dispatch_source_t st_timerProgress;
@property (nonatomic, strong) NSNumber *st_numberProgressStatus;

@property (nonatomic, strong) dispatch_source_t st_timerSplash;
@property (nonatomic, strong) NSNumber *st_numberSplashStatus;

@end

static const void *HUDProgressViewKey= &HUDProgressViewKey;
static const void *LoadingSplashViewKey = &LoadingSplashViewKey;
static const void *SplashFailedViewKey = &SplashFailedViewKey;
static const void *TNNoDataViewKey = &TNNoDataViewKey;
static const void *TimerProgressKey= &TimerProgressKey;
static const void *TimerProgressStatusKey= &TimerProgressStatusKey;
static const void *TimerSplashKey= &TimerSplashKey;
static const void *TimerSplashStatusKey= &TimerSplashStatusKey;

@implementation UIViewController (SplashViewHolder)

- (HUDProgressView*)st_viewHud
{
    return objc_getAssociatedObject(self, HUDProgressViewKey);
}

- (void)setSt_viewHud:(HUDProgressView *)st_viewHud
{
    objc_setAssociatedObject(self, HUDProgressViewKey, st_viewHud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (LoadingSplashView*)st_viewSplash
{
    return objc_getAssociatedObject(self, LoadingSplashViewKey);
}

- (void)setSt_viewSplash:(LoadingSplashView *)st_viewSplash
{
    objc_setAssociatedObject(self, LoadingSplashViewKey, st_viewSplash, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (SplashFailedView*)st_viewSplashFailed
{
    return objc_getAssociatedObject(self, SplashFailedViewKey);
}

- (void)setSt_viewSplashFailed:(SplashFailedView *)st_viewSplashFailed
{
    objc_setAssociatedObject(self, SplashFailedViewKey, st_viewSplashFailed, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NoneDataView *)st_noDataView {
    return objc_getAssociatedObject(self, TNNoDataViewKey);
}

- (void)setSt_noDataView:(NoneDataView *)st_noDataView {
    objc_setAssociatedObject(self, TNNoDataViewKey, st_noDataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (dispatch_source_t)st_timerProgress {
    return objc_getAssociatedObject(self, TimerProgressKey);
}

- (void)setSt_timerProgress:(dispatch_source_t)st_timerProgress
{
    objc_setAssociatedObject(self, TimerProgressKey, st_timerProgress, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber*)st_numberProgressStatus
{
    return objc_getAssociatedObject(self, TimerProgressStatusKey);
}

- (void)setSt_numberProgressStatus:(NSNumber*)st_numberProgressStatus
{
    objc_setAssociatedObject(self, TimerProgressStatusKey, st_numberProgressStatus, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (dispatch_source_t)st_timerSplash {
    return objc_getAssociatedObject(self, TimerSplashKey);
}

- (void)setSt_timerSplash:(dispatch_source_t)st_timerSplash
{
    objc_setAssociatedObject(self, TimerSplashKey, st_timerSplash, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber*)st_numberSplashStatus
{
    return objc_getAssociatedObject(self, TimerSplashStatusKey);
}

- (void)setSt_numberSplashStatus:(NSNumber*)st_numberSplashStatus
{
    objc_setAssociatedObject(self, TimerSplashStatusKey, st_numberSplashStatus, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end



@implementation UIViewController (SplashView)


- (void)st_setViewControlerInLoading
{
    [self st_setViewControlerInLoadingWithViewEdgeInstets:UIEdgeInsetsZero];
}

- (void)st_setViewControlerInLoadingWithViewEdgeInstets:(UIEdgeInsets)viewEdgeInstets
{
    [self startSplashTimer:SPLASH_STATUS_LOADING withViewEdgeInstets:viewEdgeInstets otherInfo:nil];
    
    if (!self.st_viewSplash) {
        self.st_viewSplash = [LoadingSplashView viewFromNib];
    }
    
    [self.st_viewSplash setLoading:YES];
    [self.view addSubview:self.st_viewSplash];
    [self.st_viewSplash autoPinEdgesToSuperviewEdgesWithInsets:viewEdgeInstets];
}

- (void)st_setViewControlerLoadingSuccess
{
    [self startSplashTimer:SPLASH_STATUS_SUCCESS withViewEdgeInstets:UIEdgeInsetsZero otherInfo:nil];
}

- (void)st_setViewControlerLoadingFailed:(NSError*)error
{
    [self st_setViewControlerLoadingFailed:error withViewEdgeInstets:UIEdgeInsetsZero];
}

- (void)st_setViewControlerLoadingFailed:(NSError*)error withViewEdgeInstets:(UIEdgeInsets)viewEdgeInstets
{
    NSMutableDictionary *dicInfo = [NSMutableDictionary dictionary];
    dicInfo[@"Error"] = error;
    [self startSplashTimer:SPLASH_STATUS_FAILED withViewEdgeInstets:viewEdgeInstets otherInfo:dicInfo];
}


- (void)st_setViewControlerLoadingFinishedWithNoneData
{
    [self st_setViewControlerLoadingFinishedWithNoneDataWithViewEdgeInstets:UIEdgeInsetsZero message:@"暂无记录" font:nil];
}

- (void)st_setViewControlerLoadingFinishedWithNoneDataWithViewEdgeInstets:(UIEdgeInsets)viewEdgeInstets
{
    [self st_setViewControlerLoadingFinishedWithNoneDataWithViewEdgeInstets:viewEdgeInstets message:@"暂无记录" font:nil];
}

- (void)st_setViewControlerLoadingFinishedWithNoneData:(NSString*)strMessage
{
    [self st_setViewControlerLoadingFinishedWithNoneDataWithViewEdgeInstets:UIEdgeInsetsZero message:strMessage font:nil];
}

- (void)st_setViewControlerLoadingFinishedWithNoneDataWithViewEdgeInstets:(UIEdgeInsets)viewEdgeInstets message:(NSString*)strMessage
{
    [self st_setViewControlerLoadingFinishedWithNoneDataWithViewEdgeInstets:viewEdgeInstets message:strMessage font:nil];
}


- (void)st_setViewControlerLoadingFinishedWithNoneDataWithViewEdgeInstets:(UIEdgeInsets)viewEdgeInstets message:(NSString*)strMessage font:(UIFont*)font
{
    NSMutableDictionary *dicInfo = [NSMutableDictionary dictionary];
    dicInfo[@"Message"] = strMessage;
    dicInfo[@"Fond"] = font;
    [self startSplashTimer:SPLASH_STATUS_NONE withViewEdgeInstets:viewEdgeInstets otherInfo:dicInfo];
}

- (void)showProgress
{
    [self startTimer:PROGRESS_STATUS_SHOW];
    
    if (self.st_viewHud) {
        return;
    }
    
    self.st_viewHud = [HUDProgressView viewFromNib];
    self.st_viewHud.frame = self.view.frame;
    
    if (self.tabBarController) {
        [self.tabBarController.view addSubview:self.st_viewHud];
    }
    else if (self.navigationController) {
        [self.navigationController.view addSubview:self.st_viewHud];
    }
    else {
        [self.view addSubview:self.st_viewHud];
    }
}

- (void)hideProgress
{
    [self startTimer:PROGRESS_STATUS_HIDE];
}

- (void)startTimer:(int)nStatus
{
    if (self.st_timerProgress) {
        dispatch_source_cancel(self.st_timerProgress);
        self.st_timerProgress = nil;
        self.st_numberProgressStatus = nil;
    }
    
    self.st_numberProgressStatus = [NSNumber numberWithInt:nStatus];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_time(0, 0.34 * NSEC_PER_SEC), DISPATCH_TIME_NOW, 0);
    self.st_timerProgress = timer;
    
    dispatch_source_set_event_handler(timer, ^{
        int nStatus = [self.st_numberProgressStatus intValue];
        
        dispatch_source_cancel(self.st_timerProgress);
        self.st_timerProgress = nil;
        self.st_numberProgressStatus = nil;
        
        switch (nStatus) {
                case PROGRESS_STATUS_SHOW:
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                });
            }
                break;
                case PROGRESS_STATUS_HIDE:
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.st_viewHud removeFromSuperview];
                    self.st_viewHud = nil;
                });
            }
                break;
            default:
                break;
        }
    });
    
    dispatch_resume(timer);
}

- (void)startSplashTimer:(int)nStatus withViewEdgeInstets:(UIEdgeInsets)viewEdgeInstets otherInfo:(NSDictionary*)dicInfo
{
    if (self.st_timerSplash) {
        dispatch_source_cancel(self.st_timerSplash);
        self.st_timerSplash = nil;
        self.st_numberSplashStatus = nil;
    }
    
    self.st_numberSplashStatus = [NSNumber numberWithInt:nStatus];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_time(0, 0.34 * NSEC_PER_SEC), DISPATCH_TIME_NOW, 0);
    self.st_timerSplash = timer;
    
    dispatch_source_set_event_handler(timer, ^{
        int nStatus = [self.st_numberSplashStatus intValue];
        
        dispatch_source_cancel(self.st_timerSplash);
        self.st_timerSplash = nil;
        self.st_numberSplashStatus = nil;
        
        switch (nStatus) {
                case SPLASH_STATUS_LOADING:
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                });
            }
                break;
                case SPLASH_STATUS_SUCCESS:
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (self.st_viewSplash) {
                        [self.st_viewSplash setLoading:NO];
                        [self.st_viewSplash removeFromSuperview];
                        self.st_viewSplash = nil;
                    }
                    
                    if (self.st_viewSplashFailed) {
                        [self.st_viewSplashFailed removeFromSuperview];
                        self.st_viewSplashFailed = nil;
                    }
                    
                    if (self.st_noDataView) {
                        [self.st_noDataView removeFromSuperview];
                        self.st_noDataView = nil;
                    }
                });
            }
                break;
                case SPLASH_STATUS_FAILED:
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if (self.st_viewSplash) {
                        [self.st_viewSplash setLoading:NO];
                        [self.st_viewSplash removeFromSuperview];
                        self.st_viewSplash = nil;
                    }
                    
                    if (!self.st_viewSplashFailed) {
                        self.st_viewSplashFailed = [SplashFailedView viewFromNib];
                        
                        self.st_viewSplashFailed.delegate = self;
                        [self.view addSubview:self.st_viewSplashFailed];
                        [self.st_viewSplashFailed autoPinEdgesToSuperviewEdgesWithInsets:viewEdgeInstets];
                    }
                    
                    [self.st_viewSplashFailed setFailedState:dicInfo[@"Error"]];
                });
            }
                break;
                case SPLASH_STATUS_NONE:
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if (self.st_viewSplash) {
                        [self.st_viewSplash removeFromSuperview];
                    }
                    
                    if (self.st_viewSplashFailed) {
                        [self.st_viewSplashFailed removeFromSuperview];
                    }
                    
                    if (self.st_noDataView) {
                        return;
                    }
                    
                    self.st_noDataView = [NoneDataView viewFromNib];
                    self.st_noDataView.labelMessage.text = dicInfo[@"Message"];
                    if (dicInfo[@"Font"]) {
                        self.st_noDataView.labelMessage.font = dicInfo[@"Font"];
                    }
                    [self.view addSubview:self.st_noDataView];
                    [self.st_noDataView autoPinEdgesToSuperviewEdgesWithInsets:viewEdgeInstets];
                });
            }
                break;
            default:
                break;
        }
    });
    
    dispatch_resume(timer);
}


@end