//
//  EntertainmentTableCell.h
//  CMU Nightlife
//
//  Created by Evan Latner on 4/12/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntertainmentTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *entertainmentTeaser;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
