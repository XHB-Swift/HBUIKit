//
//  ViewController.m
//  HBUIKit
//
//  Created by 谢鸿标 on 2019/7/10.
//  Copyright © 2019 谢鸿标. All rights reserved.
//

#import "ViewController.h"
#import "HBUIKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *circleView = [UIView HBViewWithTag:1807];
    circleView.frame = (CGRect){0,80,200,200};
    circleView.layer.contents = (__bridge id)[UIImage HBImageWithColor:[UIColor HBColorWithHexString:@"0x959595"] imageSize:circleView.hb_size cornerRadius:circleView.hb_width/2].CGImage;
    circleView.hb_x = (self.view.hb_width - circleView.hb_width) / 2;
    [self.view addSubview:circleView];
    
    UILabel *radiusLbl = [UILabel HBLabelWithText:@"圆角：0.50" textColor:[UIColor blackColor]];
    radiusLbl.tag = 1806;
    radiusLbl.hb_x = (self.view.hb_width - radiusLbl.hb_width) / 2;
    radiusLbl.hb_y = circleView.hb_maxY+50;
    [self.view addSubview:radiusLbl];
    
    UILabel *hexColorLbl = [UILabel HBLabelWithText:@"颜色：0x959595" textColor:[UIColor blackColor]];
    hexColorLbl.tag = 1808;
    hexColorLbl.hb_x = (self.view.hb_width - hexColorLbl.hb_width) / 2;
    hexColorLbl.hb_y = radiusLbl.hb_maxY+20;
    [self.view addSubview:hexColorLbl];
    
    CGFloat w = self.view.hb_width - 30;
    CGFloat x = (self.view.hb_width - w) / 2;
    NSInteger initValue = 0x959595;
    //颜色值
    UISlider *redSlider = [[UISlider alloc] initWithFrame:(CGRect){x,hexColorLbl.hb_maxY+20,w,20}];
    redSlider.tag = 1809;
    [redSlider addTarget:self action:@selector(hexSliderChange:) forControlEvents:(UIControlEventValueChanged)];
    redSlider.minimumValue = 0;
    redSlider.maximumValue = 255;
    redSlider.value = ((initValue & 0xff0000) >> 16);
    redSlider.minimumTrackTintColor = [UIColor redColor];
    [self.view addSubview:redSlider];
    
    UISlider *greenSlider = [[UISlider alloc] initWithFrame:(CGRect){x,redSlider.hb_maxY+20,w,20}];
    greenSlider.tag = 1810;
    [greenSlider addTarget:self action:@selector(hexSliderChange:) forControlEvents:(UIControlEventValueChanged)];
    greenSlider.minimumValue = 0;
    greenSlider.maximumValue = 255;
    greenSlider.value = ((initValue & 0x00ff00) >> 8);
    greenSlider.minimumTrackTintColor = [UIColor greenColor];
    [self.view addSubview:greenSlider];
    
    UISlider *blueSlider = [[UISlider alloc] initWithFrame:(CGRect){x,greenSlider.hb_maxY+20,w,20}];
    blueSlider.tag = 1811;
    [blueSlider addTarget:self action:@selector(hexSliderChange:) forControlEvents:(UIControlEventValueChanged)];
    blueSlider.minimumValue = 0;
    blueSlider.maximumValue = 255;
    blueSlider.value = ((initValue & 0x0000ff) >> 0);
    blueSlider.minimumTrackTintColor = [UIColor blueColor];
    [self.view addSubview:blueSlider];
    
    //调整图片圆角
    UISlider *cornerSlider = [[UISlider alloc] initWithFrame:(CGRect){x,blueSlider.hb_maxY+20,w,20}];
    [cornerSlider addTarget:self action:@selector(cornerSliderChange:) forControlEvents:(UIControlEventValueChanged)];
    cornerSlider.minimumTrackTintColor = [UIColor blackColor];
    cornerSlider.minimumValue = 0;
    cornerSlider.maximumValue = 0.5;
    cornerSlider.value = 0.5;
    cornerSlider.tag = 1812;
    [self.view addSubview:cornerSlider];
}

- (NSString *)currentColorString {
    UISlider *redSlider = [self.view viewWithTag:1809];
    UISlider *greenSlider = [self.view viewWithTag:1810];
    UISlider *blueSlider = [self.view viewWithTag:1811];
    NSInteger redHex = (NSInteger)redSlider.value;
    NSInteger greenHex = (NSInteger)greenSlider.value;
    NSInteger blueHex = (NSInteger)blueSlider.value;
    NSInteger hexInt = (redHex << 16) + (greenHex << 8) + (blueHex << 0);
    char cHex[16];
    memset(cHex, 0, 16);
    sprintf(cHex, "%lx", hexInt);
    NSString *hexContent = [NSString stringWithUTF8String:cHex].uppercaseString;
    NSUInteger hexContentLen = hexContent.length;
    if (hexContentLen < 6) {
        NSUInteger left0 = 6 - hexContentLen;
        for (NSUInteger i = 0; i < left0; i += 1) {
            hexContent = [@"0" stringByAppendingString:hexContent];
        }
    }
    return [@"0x" stringByAppendingString:hexContent];
}

- (void)hexSliderChange:(UISlider *)sender {
    UILabel *hexColorLbl = [self.view viewWithTag:1808];
    UISlider *cornerSlider = [self.view viewWithTag:1812];
    NSString *hexColorString = [self currentColorString];
    hexColorLbl.text = [NSString stringWithFormat:@"颜色：%@", [self currentColorString]];
    [hexColorLbl sizeToFit];
    hexColorLbl.hb_x = (self.view.hb_width - hexColorLbl.hb_width) / 2;
    UIView *circleView = [self.view viewWithTag:1807];
    CGFloat radius = circleView.hb_width*cornerSlider.value;
    circleView.layer.contents = nil;
    circleView.layer.contents = (__bridge id)[UIImage HBImageWithColor:[UIColor HBColorWithHexString:hexColorString] imageSize:(CGSize)circleView.hb_size cornerRadius:radius].CGImage;
}

- (void)cornerSliderChange:(UISlider *)sender {
    UILabel *radiusLbl = [self.view viewWithTag:1806];
    NSString *hexColorString = [self currentColorString];
    UIView *circleView = [self.view viewWithTag:1807];
    CGFloat radius = sender.value * circleView.hb_width;
    radiusLbl.text = [NSString stringWithFormat:@"圆角：%.2f",sender.value];
    [radiusLbl sizeToFit];
    radiusLbl.hb_x = (self.view.hb_width - radiusLbl.hb_width) / 2;
    circleView.layer.contents = nil;
    circleView.layer.contents = (__bridge id)[UIImage HBImageWithColor:[UIColor HBColorWithHexString:hexColorString] imageSize:(CGSize)circleView.hb_size cornerRadius:radius].CGImage;
}

@end
