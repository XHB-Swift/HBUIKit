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

- (UIImage *)decodedImage {
    CGImageRef imageRef = self.CGImage;
    UIImage *decodeImage = nil;
    if (imageRef != NULL) {
        size_t width = CGImageGetWidth(imageRef);
        size_t height = CGImageGetHeight(imageRef);
        CGColorSpaceRef colorSpace = CGImageGetColorSpace(imageRef);
        if (colorSpace != NULL) {
            size_t bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
            size_t bitsPerPixel = CGImageGetBitsPerPixel(imageRef);
            size_t bytesPerRow = CGImageGetBytesPerRow(imageRef);
            CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);
            CGDataProviderRef dataProvider = CGImageGetDataProvider(imageRef);
            if (dataProvider != NULL) {
                CFDataRef data = CGDataProviderCopyData(dataProvider);
                if (data != NULL) {
                    CGDataProviderRef newDataProvider = CGDataProviderCreateWithCFData(data);
                    CFRelease(data);
                    if (newDataProvider != NULL) {
                        CGImageRef newImageRef = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpace, bitmapInfo, newDataProvider, NULL, false, kCGRenderingIntentDefault);
                        CFRelease(newDataProvider);
                        if (newImageRef != NULL) {
                            decodeImage = [[UIImage alloc] initWithCGImage:newImageRef];
                            CGImageRelease(newImageRef);
                        }
                    }
                }
            }
        }
    }
    return decodeImage;
}

- (void)asyncDecodeImageCompletion:(void(^)(UIImage *_Nullable))completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (completion) {
            UIImage *decodedImage = [self decodedImage];
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(decodedImage);
            });
        }
    });
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
