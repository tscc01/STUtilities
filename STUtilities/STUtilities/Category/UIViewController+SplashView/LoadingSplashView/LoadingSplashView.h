//
//  LoadingSplashView.h
//  TengNiu
//
//  Created by Sola on 15/4/16.
//  Copyright (c) 2015年 Teng Niu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingSplashView : UIView

- (void)setLoading:(BOOL)bLoading;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
