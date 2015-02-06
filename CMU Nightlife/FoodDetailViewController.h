//
//  FoodDetailViewController.h
//  CMU Nightlife
//
//  Created by Evan Latner on 4/4/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Food.h"
#import <Parse/Parse.h>

@interface FoodDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *foodLabel;
@property (nonatomic, strong) IBOutlet NSString *foodName;
@property (weak, nonatomic) IBOutlet PFImageView *foodImageView;
@property (weak, nonatomic) IBOutlet UITextView *specialsTextView;
@property (strong, nonatomic) IBOutlet UITextView *foodAddress;
@property (strong, nonatomic) IBOutlet UITextView *foodContact;
@property (weak, nonatomic) IBOutlet UITextView *foodHours;



@property (nonatomic, strong) Food *food;

@end
