//
//  UIColor+CRAddition.m
//  新浪微博
//
//  Created by GDC on 17/2/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import "UIColor+CRAddition.h"

@implementation UIColor (CRAddition)

- (UIColor *)cr_randomColor{
    UIColor *color = [UIColor colorWithRed:(arc4random()%255)/255.0f green:(arc4random()%255)/255.0f blue:(arc4random()%255)/255.0f alpha:1];
    return  color;
}


@end
