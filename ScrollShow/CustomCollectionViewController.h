//
//  CustomCollectionViewController.h
//  ScrollShow
//
//  Created by Francisco Amado on 28/03/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardModel.h"
#import "CustomLayout.h"
#import "UIColor+Palette.h"
#import "CustomCell.h"

@interface CustomCollectionViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray <CardModel *> *cardArray;
@property (strong, nonatomic) NSArray <UIColor *> *palette;

@end