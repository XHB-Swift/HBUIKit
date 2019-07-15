//
//  UIView+HBView.m
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/15.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import "UIView+HBView.h"

@implementation UIView (HBView)

+ (instancetype)HBViewWithTag:(NSInteger)tag {
    __kindof UIView *view = [[self alloc] init];
    view.tag = tag;
    return view;
}

+ (instancetype)HBViewWithBackgroundColor:(UIColor * _Nullable)backgroundColor {
    __kindof UIView *view = [[self alloc] init];
    view.backgroundColor = backgroundColor ?: [UIColor whiteColor];
    return view;
}

@end
