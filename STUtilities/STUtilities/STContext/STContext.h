//
//  STContext.h
//  minjian
//
//  Created by Sola on 16/5/12.
//  Copyright © 2016年 forfunnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  设备类型
 */
typedef NS_ENUM(NSUInteger, DeviceType){
    /**
     *  iPhone 4S
     */
    DeviceType4 = 0,
    /**
     *  iPhone 4S, 5, 5S
     */
    DeviceType5 = 1,
    /**
     *  iPhone 6
     */
    DeviceType6 = 2,
    /**
     *  iPhone 6 Plus
     */
    DeviceType6Plus = 3,
};

/**
 *  系统版本
 */
typedef NS_ENUM(NSUInteger, SystemVersion){
    /**
     *  iOS 7
     */
    SystemVersion7 = 70,
    /**
     *  iOS7.1
     */
    SystemVersion71 = 71,
    /**
     *  iOS 8
     */
    SystemVersion8 = 80,
    /**
     *  iOS 8.1
     */
    SystemVersion81 = 81,
    /**
     *  iOS 8.2
     */
    SystemVersion82 = 82,
    /**
     *  iOS 8.3
     */
    SystemVersion83 = 83,
    /**
     *  iOS 8.4
     */
    SystemVersion84 = 84,
    /**
     *  iOS 9.0
     */
    SystemVersion90 = 90,
    /**
     *  iOS 9.1
     */
    SystemVersion91= 91,
    /**
     *  iOS 9.2
     */
    SystemVersion92 = 92,
};

@interface STContext : NSObject

+ (instancetype)sharedInstance;

- (NSString *)deviceId;
- (NSString *)systemVersion;
- (NSString *)applicationVersion;
- (NSString *)buildVersion;

- (CGFloat)screenHeight;
- (CGFloat)screenWidth;
- (DeviceType)currentDeviceType;
- (SystemVersion)currentSystemVersion;

@end