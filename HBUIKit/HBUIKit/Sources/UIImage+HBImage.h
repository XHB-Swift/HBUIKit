//
//  UIImage+HBImage.h
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/10.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HBImage)

+ (UIImage * _Nullable)HBImageWithColor:(UIColor * _Nullable)color imageSize:(CGSize)size;

+ (UIImage * _Nullable)HBImageWithColor:(UIColor * _Nullable)color imageSize:(CGSize)size cornerRadius:(CGFloat)radius;

+ (UIImage * _Nullable)HBImageWithColor:(UIColor * _Nullable)color imageSize:(CGSize)size cornerRadius:(CGFloat)radius rectCorner:(UIRectCorner)corner;

- (UIImage * _Nullable)HBCropImageInRect:(CGRect)rect;

- (UIImage * _Nullable)HBResizeImageToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
