//
//  UIButton+CRAddition.m
//  新浪微博
//
//  Created by GDC on 17/2/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import "UIButton+CRAddition.h"
#import "CRAdditions.h"

@implementation UIButton (CRAddition)


+ (instancetype)cr_imageButton:(NSString *)image backgroundImageName:(NSString *)backgroundImage{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    // imageWithRenderingMode:图像的渲染模式
    [button setBackgroundImage:[[UIImage imageNamed:backgroundImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",backgroundImage]] forState:UIControlStateHighlighted];
    // 设置按钮的尺寸为背景图片的尺寸
    button.size = button.currentBackgroundImage.size;
    
    return button;
}

+ (instancetype)cr_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highlightedColor:(UIColor *)highlightedColor{
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];

    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    

    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button sizeToFit];
    
//    button.size = [title sizeWithFont:button.titleLabel.font maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];

    
    return button;
}

@end

