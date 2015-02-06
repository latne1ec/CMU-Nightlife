//
//  BarTableCell.m
//  CMU Nightlife
//
//  Created by Evan Latner on 3/31/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import "BarTableCell.h"

@implementation BarTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
