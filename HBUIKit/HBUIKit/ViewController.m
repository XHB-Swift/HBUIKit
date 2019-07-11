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
    
    UIView *circleView = [[UIView alloc] initWithFrame:(CGRect){0,80,100,100}];
    circleView.layer.contents = (__bridge id)[UIImage HBImageWithColor:[UIColor HBColorWithHexString:@"0x00F5FF"] imageSize:(CGSize){100,100} cornerRadius:50].CGImage;
    circleView.hb_x = (self.view.hb_width - circleView.hb_width) / 2;
    circleView.tag = 1807;
    [self.view addSubview:circleView];
    
    UILabel *hexColorLbl = [[UILabel alloc] initWithFrame:(CGRect){0,circleView.hb_maxY+50,0,0}];
    hexColorLbl.textColor = [UIColor blackColor];
    hexColorLbl.tag = 1808;
    hexColorLbl.text = @"0x00F5FF";
    [hexColorLbl sizeToFit];
    hexColorLbl.hb_x = (self.view.hb_width - hexColorLbl.hb_width) / 2;
    [self.view addSubview:hexColorLbl];
    
    CGFloat w = self.view.hb_width - 30;
    CGFloat x = (self.view.hb_width - w) / 2;
    NSInteger initValue = 0x00f5ff;
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

- (void)hexSliderChange:(UISlider *)sender {
    UILabel *hexColorLbl = [self.view viewWithTag:1808];
    UISlider *redSlider = [self.view viewWithTag:1809];
    UISlider *greenSlider = [self.view viewWithTag:1810];
    UISlider *blueSlider = [self.view viewWithTag:1811];
    UISlider *cornerSlider = [self.view viewWithTag:1812];
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
    hexColorLbl.text = [NSString stringWithFormat:@"0x%@", hexContent];
    [hexColorLbl sizeToFit];
    hexColorLbl.hb_x = (self.view.hb_width - hexColorLbl.hb_width) / 2;
    UIView *circleView = [self.view viewWithTag:1807];
    CGFloat radius = circleView.hb_width*cornerSlider.value;
    circleView.layer.contents = nil;
    circleView.layer.contents = (__bridge id)[UIImage HBImageWithColor:[UIColor HBColorWithHexInt:hexInt] imageSize:(CGSize)circleView.hb_size cornerRadius:radius].CGImage;
}

- (void)cornerSliderChange:(UISlider *)sender {
    UILabel *hexColorLbl = [self.view viewWithTag:1808];
    UIView *circleView = [self.view viewWithTag:1807];
    CGFloat radius = sender.value * circleView.hb_width;
    circleView.layer.contents = nil;
    circleView.layer.contents = (__bridge id)[UIImage HBImageWithColor:[UIColor HBColorWithHexString:hexColorLbl.text] imageSize:(CGSize)circleView.hb_size cornerRadius:radius].CGImage;
}

@end
