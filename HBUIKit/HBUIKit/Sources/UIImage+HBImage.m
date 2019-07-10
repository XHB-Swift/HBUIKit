//
//  UIImage+HBImage.m
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/10.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import "UIImage+HBImage.h"

@implementation UIImage (HBImage)

+ (UIImage * _Nullable)HBImageWithColor:(UIColor * _Nullable)color imageSize:(CGSize)size {
    return [UIImage HBImageWithColor:color imageSize:size cornerRadius:0];
}

+ (UIImage * _Nullable)HBImageWithColor:(UIColor * _Nullable)color imageSize:(CGSize)size cornerRadius:(CGFloat)radius {
    return [UIImage HBImageWithColor:color imageSize:size cornerRadius:radius rectCorner:(UIRectCornerAllCorners)];
}

+ (UIImage * _Nullable)HBImageWithColor:(UIColor * _Nullable)color imageSize:(CGSize)size cornerRadius:(CGFloat)radius rectCorner:(UIRectCorner)corner {
    
    CGFloat scale = [[UIScreen mainScreen] scale];
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:(CGSize){radius,radius}];
    [cornerPath addClip];
    [cornerPath fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage * _Nullable)HBCropImageInRect:(CGRect)rect {
    UIImage *cropImage = nil;
    CGSize imageSize = self.size;
    CGRect imageBounds = CGRectMake(0, 0, imageSize.width, imageSize.height);
    if (CGRectContainsRect(rect, imageBounds)) {
        CGImageRef imageRef = self.CGImage;
        CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef,rect);
        cropImage = [UIImage imageWithCGImage:imagePartRef];
        CGImageRelease(imagePartRef);
    }
    return cropImage;
}

- (UIImage * _Nullable)HBResizeImageToSize:(CGSize)size {
    
    CGFloat scale = [[UIScreen mainScreen] scale];
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    [self drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
