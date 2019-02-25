//
//  RecogizeCardManager.h
//  LBTextImageShow
//
//  Created by SuperCabbage on 2019/2/21.
//  Copyright © 2019 SuperCabbage. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

typedef void (^CompleateBlock)(NSString * _Nonnull text);

NS_ASSUME_NONNULL_BEGIN

@interface RecogizeCardManager : NSObject

/**
 *  初始化一个单例
 *
 *  @return 返回一个RecogizeCardManager的实例对象
 */
+ (instancetype)recognizeCardManager;

/**
 *  根据身份证照片得到身份证号码
 *
 *  @param cardImage 传入的身份证照片
 *  @param compleate 识别完成后的回调
 */
- (void)recognizeCardWithImage:(UIImage *)cardImage compleate:(CompleateBlock)compleate;

@end

NS_ASSUME_NONNULL_END
