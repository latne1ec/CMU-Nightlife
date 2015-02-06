//
//  BarTableCell.h
//  CMU Nightlife
//
//  Created by Evan Latner on 3/31/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *barTeaser;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;



@end
