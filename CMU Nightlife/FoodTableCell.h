//
//  FoodTableCell.h
//  CMU Nightlife
//
//  Created by Evan Latner on 4/4/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *foodTeaser;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
