//
//  UIColor+HBColor.h
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/10.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HBColor)

#pragma mark - 16进制颜色值

+ (UIColor *)HBColorWithHexInt:(long)hexInt;

+ (UIColor *)HBColorWithHexInt:(long)hexInt alpha:(CGFloat)alpha;

+ (UIColor * _Nullable)HBColorWithHexString:(NSString *)hexString;

+ (UIColor * _Nullable)HBColorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

#pragma mark - RGBA颜色值

+ (UIColor *)HBColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

+ (UIColor *)HBColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
