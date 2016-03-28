//
//  CustomCell.h
//  ScrollShow
//
//  Created by Francisco Amado on 28/03/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardModel.h"
#import "CustomLayout.h"

@interface CustomCell : UICollectionViewCell

@property (strong, nonatomic) CardModel *cardModel;

@end