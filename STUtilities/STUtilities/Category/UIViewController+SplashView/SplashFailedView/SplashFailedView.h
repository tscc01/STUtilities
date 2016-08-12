//
//  SplashFailedView.h
//  TengNiu
//
//  Created by Sola on 15/4/16.
//  Copyright (c) 2015年 Teng Niu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+SplashView.h"

@interface SplashFailedView : UIView

- (void)setFailedState:(NSError*)dicInfo;

@property (nonatomic, weak) id<SplashFailedViewDelegate> delegate;

@end
