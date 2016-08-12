//
//  STContext.m
//  minjian
//
//  Created by Sola on 16/5/12.
//  Copyright © 2016年 forfunnet. All rights reserved.
//

#import "STContext.h"

@implementation STContext

+ (instancetype)sharedInstance {
    static STContext* context;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        context = [STContext new];
    });
    return context;
}

- (NSString *)deviceId {
    static NSString* deviceId = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceId = [UIDevice currentDevice].identifierForVendor.UUIDString;
    });
    return deviceId;
}

- (NSString *)systemVersion {
    static NSString* version = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion;
    });
    return version;
}

- (NSString *)applicationVersion {
    static NSString* version = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary* dict = [NSBundle mainBundle].infoDictionary;
        version = dict[@"CFBundleShortVersionString"];
    });
    return version;
}

- (NSString *)buildVersion
{
    static NSString* version = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary* dict = [NSBundle mainBundle].infoDictionary;
        version = dict[@"CFBundleVersion"];
    });
    return version;
}


- (CGFloat)screenHeight {
    static CGFloat height = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        height = [UIScreen mainScreen].bounds.size.height;
    });
    return height;
}

- (CGFloat)screenWidth {
    static CGFloat width = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        width = [UIScreen mainScreen].bounds.size.width;
    });
    return width;
}

- (DeviceType)currentDeviceType {
    static DeviceType type;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat height = [self screenHeight];
        if (height < 568) {
            type = DeviceType4;
        }
        else if (height < 667) {
            type = DeviceType5;
        } else if (height < 736) {
            type = DeviceType6;
        } else {
            type = DeviceType6Plus;
        }
    });
    return type;
}

- (SystemVersion)currentSystemVersion {
    static SystemVersion version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        double v = [UIDevice currentDevice].systemVersion.doubleValue;
        if (v < 7.09) {
            version = SystemVersion7;
        } else if (v < 7.99) {
            version = SystemVersion71;
        } else if (v < 8.09) {
            version = SystemVersion8;
        } else if (v < 8.19) {
            version = SystemVersion81;
        } else if (v < 8.29) {
            version = SystemVersion82;
        } else if (v < 8.39) {
            version = SystemVersion83;
        } else if (v < 8.99) {
            version = SystemVersion84;
        } else if (v < 9.09) {
            version = SystemVersion90;
        } else if (v < 9.19) {
            version = SystemVersion91;
        } else {
            version = SystemVersion92;
        }
    });
    return version;
}

@end
