//
//  BasicUtility+Countdown.h
//  minjian
//
//  Created by Sola on 16/5/13.
//  Copyright © 2016年 forfunnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicUtility.h"

@interface BasicUtility (Countdown)


@property (nonatomic, strong) dispatch_source_t timerCountdown;
@property (nonatomic, strong) NSNumber *numberCountDown;

- (void)startTimer:(int)nTimer progress:(void (^)(int nLeft))progress end:(void (^)())end;


@end
