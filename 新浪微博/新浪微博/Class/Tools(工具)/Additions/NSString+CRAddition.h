//
//  NSString+CRAddition.h
//  新浪微博
//
//  Created by GDC on 17/2/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CRAddition)

/**
 计算字符串的大小

 @param font 字体大小
 @param maxSize maxSize
 @return 返回 CGSize
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end
