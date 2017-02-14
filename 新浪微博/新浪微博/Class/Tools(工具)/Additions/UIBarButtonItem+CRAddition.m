//
//  UIBarButtonItem+CRAddition.m
//  新浪微博
//
//  Created by GDC on 17/2/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import "UIBarButtonItem+CRAddition.h"
#import "UIView+AutoLayout.h"

@implementation UIBarButtonItem (CRAddition)

+ (instancetype)cr_barButtonItemWTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action{
    return [[self alloc] initWithTitle:title style:style target:target action:action];
}


+ (instancetype)cr_barButtonItemImage:(NSString *)image hightImage:(NSString *)hightImage target:(id)target action:(SEL)action{
    UIButton *button = [UIButton new];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    button.titleLabel.textColor = [UIColor darkGrayColor];
    button.titleLabel.highlightedTextColor = [UIColor orangeColor];
    
    //设置按钮的尺寸为背景图片的尺寸
    button.size = button.currentBackgroundImage.size;
    //监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

@end
