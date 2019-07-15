//
//  UILabel+HBLabel.h
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/15.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (HBLabel)

+ (instancetype)HBLabelWithText:(NSString *)text;

+ (instancetype)HBLabelWithText:(NSString *)text textColor:(UIColor * _Nullable)textColor;

+ (instancetype)HBLabelWithText:(NSString *)text textColor:(UIColor * _Nullable)textColor textFont:(UIFont * _Nullable)textFont;

+ (instancetype)HBLabelWithAttributedText:(NSAttributedString *)attributedText;

@end

NS_ASSUME_NONNULL_END
