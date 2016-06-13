//
//  CardModel.h
//  ScrollShow
//
//  Created by Francisco Amado on 25/03/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CardModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *room;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) UIImage *backgroundImage;

- (instancetype)initWith:(NSString *)title room:(NSString *)room time:(NSString *)time andBackgroundImage:(UIImage *)backgroundImage;
+ (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray <CardModel *> *)allCards;

@end