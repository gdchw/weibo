//
//  UIButton+CRAddition.h
//  新浪微博
//
//  Created by GDC on 17/2/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CRAddition)

/**
 初始化图像按钮
 
 @param image 按钮的图像
 @param backgroundImage 按钮背景图像
 @return 返回图像按钮
 */
+ (instancetype)cr_imageButton:(NSString *)image backgroundImageName:(NSString *)backgroundImage;

/**
 初始化系统按钮

 @param title 标题
 @param fontSize 标题字体大小
 @param normalColor 颜色
 @param highlightedColor 高亮颜色
 @return UIButton
 */
+ (instancetype)cr_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highlightedColor:(UIColor *)highlightedColor;

@end
