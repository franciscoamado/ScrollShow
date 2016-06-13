//
//  CustomLayout.m
//  ScrollShow
//
//  Created by Francisco Amado on 25/03/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

#import "CustomLayout.h"

@interface CustomLayout ()

@property (strong, nonatomic) NSMutableArray <UICollectionViewLayoutAttributes *> *cache;

@end

@implementation CustomLayout

static CGFloat dragOffset = 180;

#pragma mark Variables access

// Returns the item index of the currently featured cell
- (NSInteger)featuredItemIndex
{
// Use max to make sure the featureItemIndex is never < 0
    return MAX(0, self.collectionView.contentOffset.y / dragOffset);
}

// Returns a value between 0 and 1 that represents how close the next cell is to becoming the featured cell
- (CGFloat)nextItemPercentageOffset
{
    return (self.collectionView.contentOffset.y / dragOffset) - (CGFloat) self.featuredItemIndex;
}

// Returns the width of the collection view
- (CGFloat)width
{
    return CGRectGetWidth(self.collectionView.bounds);
}

// Returns the height of the collection view
- (CGFloat)height
{
    return CGRectGetHeight(self.collectionView.bounds);
}

// Returns the number of items in the collection view
- (NSInteger)numberOfItems
{
    return [self.collectionView numberOfItemsInSection:0];
}

#pragma mark UICollectionViewLayout

// Return the size of all the content in the collection view
- (CGSize)collectionViewContentSize
{
    CGFloat contentHeight = (CGFloat) self.numberOfItems * dragOffset + (self.height - dragOffset);
    return CGSizeMake(self.width, contentHeight);
}

- (void)prepareLayout
{
    if (self.cache != nil && self.cache.count != 0) {
        [self.cache removeAllObjects];
    }
    else {
        self.cache =  [[NSMutableArray alloc]init];
    }

    CGFloat standardHeight = CustomLayoutConstantsStandardHeight;
    CGFloat featuredHeight = CustomLayoutConstantsFeaturedHeight;

    CGRect frame  = CGRectZero;
    CGFloat y = 0;

    for (int item = 0; item <  self.numberOfItems; item++) {
// 1. Create an index path to the current cell, then get its current attributes.
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

// 2. Prepare the cell to move up or down. Since the majority of cells will not be featured — there are many more standard cells than the single featured cells — it defaults to the standardHeight.
        attributes.zIndex = item;
        CGFloat height = standardHeight;

// 3. Determine the current cell’s status — featured, next or standard. In the case of the latter, you do nothing.
        if (indexPath.item == self.featuredItemIndex) {
// 4. If the cell is currently in the featured cell position, calculate the yOffset and use that to derive the new y value for the cell. After that, you set the cell’s height to be the featured height.
            CGFloat yOffset = standardHeight * self.nextItemPercentageOffset;

            y = self.collectionView.contentOffset.y - yOffset;
            height = featuredHeight;
        }
        else if (indexPath.item == (self.featuredItemIndex + 1) && indexPath.item != self.numberOfItems) {
// 5. If the cell is next in line, you start by calculating the largest y could be (in this case, larger than the featured cell) and combine that with a calculated height to end up with the correct value of y, which is 280.0 — the height of the featured cell.
            CGFloat maxY = y + standardHeight;
            height = standardHeight + MAX((featuredHeight - standardHeight) * self.nextItemPercentageOffset, 0);
            y = maxY - height;
        }

// 6. Lastly, the loop sets some common elements for each cell, including creating the right frame based upon the if condition above, setting the attributes to what was just calculated, and updating the cache values. The very last step is to update y so that it’s at the bottom of the last calculated cell, so you can move down the list of cells efficiently.
        frame = CGRectMake(0, y, self.width, height);
        attributes.frame = frame;
        [self.cache addObject:attributes];
        y = CGRectGetMaxY(frame);
    }
}

// Return all attributes in the cache whose frame intersects with the rect passed to the method
- (NSArray <UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray <UICollectionViewLayoutAttributes *> *layoutAttributes = [[NSMutableArray alloc]init];

    if (self.cache != nil) {
        for (UICollectionViewLayoutAttributes *attributes in self.cache) {
            if (CGRectIntersectsRect(attributes.frame, rect)) {
                [layoutAttributes addObject:attributes];
            }
        }
    }

    return layoutAttributes;
}

// Return true so that the layout is continuously invalidated as the user scrolls
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

// Method of UIScrollView that allows your app to respond with an effect similar to the page snapping effect of a paged UIScrollView.
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    float itemIndex = roundf(proposedContentOffset.y / dragOffset);
    float yOffset = itemIndex * dragOffset;
    return CGPointMake(0, yOffset);
}

@end