//
//  CustomLayout.h
//  ScrollShow
//
//  Created by Francisco Amado on 25/03/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLayout : UICollectionViewLayout

#define CustomLayoutConstantsStandardHeight 100
#define CustomLayoutConstantsFeaturedHeight 280

@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic) NSInteger featuredItemIndex;
@property (assign, nonatomic) CGFloat nextItemPercentageOffset;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) NSInteger numberOfItems;

@end