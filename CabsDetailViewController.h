//
//  CabsDetailViewController.h
//  CMU Nightlife
//
//  Created by Evan Latner on 4/4/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cabs.h"
#import <Parse/Parse.h>

@interface CabsDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *cabsLabel;
@property (nonatomic, strong) IBOutlet NSString *cabsName;
@property (weak, nonatomic) IBOutlet PFImageView *cabsImageView;
@property (weak, nonatomic) IBOutlet UITextView *specialsTextView;
@property (strong, nonatomic) IBOutlet UITextView *cabsAddress;
@property (strong, nonatomic) IBOutlet UITextView *cabsContact;



@property (nonatomic, strong) Cabs *cabs;


@end
