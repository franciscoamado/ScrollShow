//
//  UIImage+Decompression.m
//  ScrollShow
//
//  Created by Francisco Amado on 28/03/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

#import "UIImage+Decompression.h"

@implementation UIImage (Decompression)

- (UIImage *)decompressedImage
{
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);
    [self drawAtPoint:CGPointZero];
    UIImage *decompressedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return decompressedImage;
}

@end