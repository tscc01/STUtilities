//
//  NSObject+ST.h
//  HaoYa
//
//  Created by Sola on 15/3/20.
//  Copyright (c) 2015年 Hao Ya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ST)

+ (void)swizzleMethod:(SEL)originMethod newMethod:(SEL)newMethod;

@end
