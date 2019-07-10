//
//  UIView+HBFrame.h
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/10.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HBFrame)

@property (nonatomic) CGFloat hb_x;

@property (nonatomic) CGFloat hb_y;

@property (nonatomic) CGFloat hb_width;

@property (nonatomic) CGFloat hb_height;

@property (nonatomic) CGPoint hb_origin;

@property (nonatomic) CGSize hb_size;

@property (nonatomic, readonly) CGFloat hb_midX;

@property (nonatomic, readonly) CGFloat hb_midY;

@property (nonatomic, readonly) CGFloat hb_maxX;

@property (nonatomic, readonly) CGFloat hb_maxY;

@end

NS_ASSUME_NONNULL_END
