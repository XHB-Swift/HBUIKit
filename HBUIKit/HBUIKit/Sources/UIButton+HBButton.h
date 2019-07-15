//
//  UIButton+HBButton.h
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/15.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (HBButton)

+ (instancetype)HBButtonWithType:(UIButtonType)buttonType
                          target:(id)target
                          action:(SEL)action
                           event:(UIControlEvents)event;

@end

NS_ASSUME_NONNULL_END
