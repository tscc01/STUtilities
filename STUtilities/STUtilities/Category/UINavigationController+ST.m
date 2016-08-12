//
//  UINavigationController+ST.m
//  TengNiu
//
//  Created by Sola on 15/5/27.
//  Copyright (c) 2015年 Teng Niu. All rights reserved.
//

#import "UINavigationController+ST.h"

@implementation UINavigationController (ST)

- (UIImageView *)st_navigationBottomBorderView {
    return [self findHairlineImageViewUnder:self.navigationBar];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

@end
