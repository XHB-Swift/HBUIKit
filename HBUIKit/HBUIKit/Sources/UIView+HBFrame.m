//
//  UIView+HBFrame.m
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/10.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import "UIView+HBFrame.h"

@implementation UIView (HBFrame)

#pragma mark - 修改frame

- (void)setHb_x:(CGFloat)hb_x {
    CGRect frame = self.frame;
    frame.origin.x = hb_x;
    self.frame = frame;
}

- (CGFloat)hb_x {
    return CGRectGetMinX(self.frame);
}

- (void)setHb_y:(CGFloat)hb_y {
    CGRect frame = self.frame;
    frame.origin.y = hb_y;
    self.frame = frame;
}

- (CGFloat)hb_y {
    return CGRectGetMinY(self.frame);
}

- (void)setHb_width:(CGFloat)hb_width {
    CGRect frame = self.frame;
    frame.size.width = hb_width;
    self.frame = frame;
}

- (CGFloat)hb_width {
    return CGRectGetWidth(self.frame);
}

- (void)setHb_height:(CGFloat)hb_height {
    CGRect frame = self.frame;
    frame.size.height = hb_height;
    self.frame = frame;
}

- (CGFloat)hb_height {
    return CGRectGetHeight(self.frame);
}

- (void)setHb_origin:(CGPoint)hb_origin {
    CGRect frame = self.frame;
    frame.origin = hb_origin;
    self.frame = frame;
}

- (CGPoint)hb_origin {
    return self.frame.origin;
}

- (void)setHb_size:(CGSize)hb_size {
    CGRect frame = self.frame;
    frame.size = hb_size;
    self.frame = frame;
}

- (CGSize)hb_size {
    return self.frame.size;
}

- (CGFloat)hb_midX {
    return CGRectGetMidX(self.frame);
}

- (CGFloat)hb_midY {
    return CGRectGetMidY(self.frame);
}

- (CGFloat)hb_maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)hb_maxY {
    return CGRectGetMaxY(self.frame);
}

@end
