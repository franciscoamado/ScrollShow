//
//  CustomCell.m
//  ScrollShow
//
//  Created by Francisco Amado on 28/03/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *coverView;

@end

@implementation CustomCell

- (void)setCardModel:(CardModel *)cardModel
{
    if (cardModel != nil) {
        [self.imageView setImage:cardModel.backgroundImage];
        [self.titleLabel setText:cardModel.title];
    }
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];

    // 1. These are the two convenience height constants you’ve used previously.
    NSInteger standardHeight = CustomLayoutConstantsStandardHeight;
    NSInteger featuredHeight = CustomLayoutConstantsFeaturedHeight;

    // 2. Calculate the delta of the cell as it’s moving to figure out how much to adjust the alpha in the following step.
    CGFloat delta = 1 - ((featuredHeight - CGRectGetHeight(self.frame)) / (featuredHeight - standardHeight));

    // 3. Based on the range constants, update the cell’s alpha based on the delta value.
    CGFloat minAlpha = 0.25;
    CGFloat maxAlpha = 0.60;

    [self.coverView setAlpha:maxAlpha - (delta * (maxAlpha - minAlpha))];

    CGFloat minScale = 0.5;
    CGFloat scale = MAX(delta, minScale);
    self.titleLabel.transform = CGAffineTransformMakeScale(scale, scale);
}

@end