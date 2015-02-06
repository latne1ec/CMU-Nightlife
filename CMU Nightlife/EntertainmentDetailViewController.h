//
//  EntertainmentDetailViewController.h
//  CMU Nightlife
//
//  Created by Evan Latner on 4/12/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entertainment.h"
#import <Parse/Parse.h>

@interface EntertainmentDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *entertainmentLabel;
@property (nonatomic, strong) IBOutlet NSString *entertainmentName;
@property (weak, nonatomic) IBOutlet PFImageView *entertainmentImageView;
@property (weak, nonatomic) IBOutlet UITextView *specialsTextView;
@property (strong, nonatomic) IBOutlet UITextView *entertainmentAddress;
@property (strong, nonatomic) IBOutlet UITextView *entertainmentContact;
@property (weak, nonatomic) IBOutlet UITextView *entertainmentHours;



@property (nonatomic, strong) Entertainment *entertainment;



@end
