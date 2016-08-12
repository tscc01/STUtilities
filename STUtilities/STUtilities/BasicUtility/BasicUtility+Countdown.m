//
//  BasicUtility+Countdown.m
//  minjian
//
//  Created by Sola on 16/5/13.
//  Copyright © 2016年 forfunnet. All rights reserved.
//

#import "BasicUtility+Countdown.h"
#import <objc/runtime.h>


static const void *TimerCountdownKey= &TimerCountdownKey;
static const void *NumberCountDownKey = &NumberCountDownKey;


@implementation BasicUtility (Countdown)

- (dispatch_source_t)timerCountdown
{
    return objc_getAssociatedObject(self, TimerCountdownKey);
}

- (void)setTimerCountdown:(dispatch_source_t)timerCountdown
{
    objc_setAssociatedObject(self, TimerCountdownKey, timerCountdown, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber*)numberCountDown
{
    return objc_getAssociatedObject(self, NumberCountDownKey);
}

- (void)setNumberCountDown:(NSNumber *)numberCountDown
{
    objc_setAssociatedObject(self, NumberCountDownKey, numberCountDown, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)startTimer:(int)nTimer progress:(void (^)(int nLeft))progress end:(void (^)())end
{
    int nNumber = [self.numberCountDown intValue];
    if (nNumber) {
        dispatch_source_cancel(self.timerCountdown);
        self.timerCountdown = nil;
    }
    
    self.numberCountDown = [NSNumber numberWithInt:nTimer];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    self.timerCountdown = timer;

    dispatch_source_set_event_handler(timer, ^{
        if([self.numberCountDown intValue] <= 0){
            dispatch_source_cancel(timer);
            self.timerCountdown = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                end();
            });
        }
        else {
            self.numberCountDown = [NSNumber numberWithInt:[self.numberCountDown intValue] - 1];
            dispatch_async(dispatch_get_main_queue(), ^{
                progress([self.numberCountDown intValue]);
            });
        }
    });
    
    dispatch_resume(timer);
}

@end
