//
//  NSString+CRAddition.m
//  新浪微博
//
//  Created by GDC on 17/2/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import "NSString+CRAddition.h"

@implementation NSString (CRAddition)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize textSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return textSize;
}

@end
