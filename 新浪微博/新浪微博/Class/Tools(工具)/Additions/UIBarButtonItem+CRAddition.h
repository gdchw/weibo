//
//  UIBarButtonItem+CRAddition.h
//  新浪微博
//
//  Created by GDC on 17/2/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CRAddition)

/**
 初始化系统导航按钮

 @param title 导航标题
 @param style 按钮类型
 @param target self
 @param action 事件
 @return 返回
 */
+ (instancetype)cr_barButtonItemWTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;


/**
 初始化纯图片背景导航按钮

 @param image 图片
 @param hightImage 高亮图标
 @param target self
 @param action 事件
 @return 返回
 */
+ (instancetype)cr_barButtonItemImage:(NSString *)image hightImage:(NSString *)hightImage target:(id)target action:(SEL)action;

@end
