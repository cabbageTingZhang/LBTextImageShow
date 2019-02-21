//
//  UIColor+K1Util.h
//  Friday4iOS
//
//  Created by k1 on 12-12-29.
//  Copyright (c) 2012年 k1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (K1Util)

/**
 *  @author bingyu
 *
 *  根据颜色字符串返回相应的颜色
 *
 *  @param hexString 颜色字符串
 *
 *  @return 返回的颜色
 */
+ (UIColor *) colorWithHexString: (NSString *) hexString;

@end
