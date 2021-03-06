//
//  SplashFailedView.h
//  HaoYa
//
//  Created by Sola on 15/4/16.
//  Copyright (c) 2015年 Hao Ya. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SplashFailedViewDelegate <NSObject>
@optional
- (void)st_reloadData;

@end

@interface SplashFailedView : UIView

- (void)setFailedState:(NSError*)dicInfo;

@property (nonatomic, weak) id<SplashFailedViewDelegate> delegate;

@end
