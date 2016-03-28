//
//  UIColor+Palette.m
//  ScrollShow
//
//  Created by Francisco Amado on 28/03/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

#import "UIColor+Palette.h"

@implementation UIColor (Palette)

+ (UIColor *)colorFromRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b
{
    return [UIColor colorWithRed:(r / 255) green:(g / 255) blue:(b / 255) alpha:1];
}

+ (NSArray <UIColor *> *)palette
{
    return @[[UIColor colorFromRed:85 green:0 blue:255],
             [UIColor colorFromRed:170 green:0 blue:170],
             [UIColor colorFromRed:85 green:170 blue:85],
             [UIColor colorFromRed:0 green:85 blue:0],
             [UIColor colorFromRed:255 green:170 blue:0],
             [UIColor colorFromRed:255 green:255 blue:0],
             [UIColor colorFromRed:255 green:85 blue:0],
             [UIColor colorFromRed:0 green:85 blue:85],
             [UIColor colorFromRed:0 green:85 blue:255],
             [UIColor colorFromRed:170 green:170 blue:255],
             [UIColor colorFromRed:85 green:0 blue:0],
             [UIColor colorFromRed:170 green:85 blue:85],
             [UIColor colorFromRed:170 green:255 blue:0],
             [UIColor colorFromRed:85 green:170 blue:255],
             [UIColor colorFromRed:0 green:170 blue:170]];
}

@end