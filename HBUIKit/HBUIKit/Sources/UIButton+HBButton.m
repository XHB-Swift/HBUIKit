//
//  UIButton+HBButton.m
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/15.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import "UIButton+HBButton.h"

@implementation UIButton (HBButton)

+ (instancetype)HBButtonWithType:(UIButtonType)buttonType
                          target:(id)target
                          action:(SEL)action
                           event:(UIControlEvents)event {
    
    __kindof UIButton *button = [self buttonWithType:(buttonType)];
    [button addTarget:target action:action forControlEvents:event];
    return button;
}

@end
