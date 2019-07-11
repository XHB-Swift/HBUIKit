//
//  UIColor+HBColor.m
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/10.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import "UIColor+HBColor.h"

@implementation UIColor (HBColor)

#pragma mark - 16进制颜色值

+ (UIColor *)HBColorWithHexInt:(long)hexInt {
    return [UIColor HBColorWithHexInt:hexInt alpha:1];
}

+ (UIColor *)HBColorWithHexInt:(long)hexInt alpha:(CGFloat)alpha {
    CGFloat red = (CGFloat)((hexInt & 0xff0000) >> 16);
    CGFloat green = (CGFloat)((hexInt & 0x00ff00) >> 8);
    CGFloat blue = (CGFloat)((hexInt & 0x0000ff) >> 0);
    return [UIColor HBColorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor * _Nullable)HBColorWithHexString:(NSString *)hexString {
    return [UIColor HBColorWithHexString:hexString alpha:1];
}

+ (UIColor * _Nullable)HBColorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    NSString *hexPrefix = @"0x";
    BOOL hasPound = [hexString hasPrefix:@"#"];
    BOOL has0x = [hexString hasPrefix:hexPrefix];
    NSUInteger hexStringLength = hexString.length;
    UIColor *color = nil;
    
    if (hasPound || has0x) {
        NSString *hex = hexString;
        if (hasPound && hexStringLength > 1) {
            hex = [hexString substringFromIndex:1];
            hex = [hexPrefix stringByAppendingString:hex];
        }
        NSPredicate *hexStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^0x[A-Fa-f0-9]*"];
        if ([hexStringPredicate evaluateWithObject:hex]) {
            long hexInt = 0;
            sscanf(hex.UTF8String, "%lx", &hexInt);
            color = [UIColor HBColorWithHexInt:hexInt alpha:alpha];
        }
    }
    
    return color;
}

#pragma mark - RGBA颜色值

+ (UIColor *)HBColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor HBColorWithRed:red green:green blue:blue alpha:1];
}

+ (UIColor *)HBColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    CGFloat r = red/255.f;
    CGFloat g = green/255.f;
    CGFloat b = blue/255.f;
    CGFloat a = (alpha > 1 || alpha < 0) ? 1 : alpha;
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end
