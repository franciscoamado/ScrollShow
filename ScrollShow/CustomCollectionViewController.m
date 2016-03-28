//
//  CustomCollectionViewController.m
//  ScrollShow
//
//  Created by Francisco Amado on 28/03/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

#import "CustomCollectionViewController.h"

@implementation CustomCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];

    self.cardArray = [CardModel allCards];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.cardArray != nil) {
        return self.cardArray.count;
    }

    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];

    [cell setCardModel:[self.cardArray objectAtIndex:indexPath.item]];

    return cell;
}

@end