//
//  LoadingSplashView.m
//  HaoYa
//
//  Created by Sola on 15/4/16.
//  Copyright (c) 2015年 Hao Ya. All rights reserved.
//

#import "LoadingSplashView.h"
#import "UIImage+animatedGIF.h"

@interface LoadingSplashView ()


@end

@implementation LoadingSplashView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    [super awakeFromNib];
    
    UIImage *image = [UIImage imageNamed:@"st_loading.gif"];
    if (image) {
        _indicator.hidden = YES;
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"st_loading" withExtension:@"gif"];
        _imgView.image = [UIImage animatedImageWithAnimatedGIFURL:url];
        _imgView.hidden = NO;
    }
    else {
        _imgView.hidden = YES;
    }
}

- (void)setLoading:(BOOL)bLoading
{
    
}

@end
