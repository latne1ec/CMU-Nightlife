//
//  CabsTableCell.h
//  CMU Nightlife
//
//  Created by Evan Latner on 4/4/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CabsTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *cabTeaser;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@property (nonatomic, weak) IBOutlet UITextView *cabContact;

@end
