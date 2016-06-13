//
//  CardModel.m
//  ScrollShow
//
//  Created by Francisco Amado on 25/03/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

#import "CardModel.h"
#import "UIImage+Decompression.h"

@interface CardModel ()

@end

@implementation CardModel

- (instancetype)initWith:(NSString *)title room:(NSString *)room time:(NSString *)time andBackgroundImage:(UIImage *)backgroundImage
{
    self = [super init];

    if (self) {
        self.title = title;
        self.room = room;
        self.time = time;
        self.backgroundImage = backgroundImage;
    }

    return self;
}

+ (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title =  ![[dictionary objectForKey:@"Title"] isEqual:nil] ? [dictionary objectForKey:@"Title"] : @"";
    NSString *room =  ![[dictionary objectForKey:@"Location"]isEqual:nil] ? [dictionary objectForKey:@"Location"] : @"";
    NSString *time =  ![[dictionary objectForKey:@"Position"]isEqual:nil] ? [dictionary objectForKey:@"Position"] : @"";
    NSString *backgroundImageTitle =  ![[dictionary objectForKey:@"Background"]isEqual:nil] ? [dictionary objectForKey:@"Background"] : @"";

    UIImage *backgroundImage = [UIImage imageNamed:backgroundImageTitle];

//    return [[CardModel alloc]initWith:title room:room time:time andBackgroundImage:[backgroundImage decompressedImage]];
    return [[CardModel alloc]initWith:title room:room time:time andBackgroundImage:backgroundImage];
}

+ (NSArray <CardModel *> *)allCards
{
    NSMutableArray <CardModel *> *cards = [NSMutableArray new];

    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"background" withExtension:@"plist"];

    if (URL != nil) {
        NSArray *dataFromPlist = [NSArray arrayWithContentsOfURL:URL];

        if (dataFromPlist != nil && dataFromPlist.count > 0) {
            for (NSDictionary *dictionary in dataFromPlist) {
                if (dictionary != nil) {
                    CardModel *card = [CardModel initWithDictionary:dictionary];
                    [cards addObject:card];
                }
            }
        }
    }

    return cards;
}

@end