//
//  UILabel+HBLabel.m
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/15.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import "UILabel+HBLabel.h"

@implementation UILabel (HBLabel)

+ (instancetype)HBLabelWithText:(NSString *)text {
    return [self HBLabelWithText:text textColor:[UIColor blackColor]];
}

+ (instancetype)HBLabelWithText:(NSString *)text textColor:(UIColor *)textColor {
    return [self HBLabelWithText:text textColor:textColor textFont:nil];
}

+ (instancetype)HBLabelWithText:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont {
    __kindof UILabel *label = [[self alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = textFont;
    [label sizeToFit];
    return label;
}

+ (instancetype)HBLabelWithAttributedText:(NSAttributedString *)attributedText {
    __kindof UILabel *label = [[self alloc] init];
    label.attributedText = attributedText;
    [label sizeToFit];
    return label;
}

@end
