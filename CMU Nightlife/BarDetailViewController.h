//
//  BarDetailViewController.h
//  CMU Nightlife
//
//  Created by Evan Latner on 3/31/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bar.h"
#import <Parse/Parse.h>

@interface BarDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *barLabel;
@property (nonatomic, strong) IBOutlet NSString *barName;
@property (weak, nonatomic) IBOutlet PFImageView *barImageView;
@property (weak, nonatomic) IBOutlet UITextView *specialsTextView;
@property (strong, nonatomic) IBOutlet UITextView *barAddress;
@property (strong, nonatomic) IBOutlet UITextView *barContact;



@property (nonatomic, strong) Bar *bar;




@end
