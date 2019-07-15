//
//  UIView+HBView.h
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/15.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HBView)

+ (instancetype)HBViewWithTag:(NSInteger)tag;

+ (instancetype)HBViewWithBackgroundColor:(UIColor * _Nullable)backgroundColor;

@end

NS_ASSUME_NONNULL_END
