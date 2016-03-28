//
//  UIColor+Palette.h
//  ScrollShow
//
//  Created by Francisco Amado on 28/03/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Palette)

+ (UIColor *)colorFromRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b;
+ (NSArray <UIColor *> *)palette;
@end