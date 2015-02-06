//
//  CabsDetailViewController.m
//  CMU Nightlife
//
//  Created by Evan Latner on 4/4/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import "CabsDetailViewController.h"

@interface CabsDetailViewController ()

@end

@implementation CabsDetailViewController

@synthesize cabsImageView;
@synthesize cabsLabel;
@synthesize specialsTextView;
@synthesize cabs;
@synthesize cabsName;
@synthesize cabsAddress;
@synthesize cabsContact;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = cabs.name;
    self.cabsLabel.text = cabs.name; //Changed to Directions
    self.cabsContact.text = cabs.contact;
    self.cabsImageView.file = cabs.imageFile;
    [cabsImageView loadInBackground];
    
    NSMutableString *specialsText = [NSMutableString string];
    for (NSString* special in cabs.specials) {
        [specialsText appendFormat:@"%@\n", special];
    }
    self.specialsTextView.text = specialsText;
    
    NSMutableString *addressText = [NSMutableString string];
    for (NSString* address in cabs.address) {
        [addressText appendFormat:@"%@\n", address];
    }
    self.cabsAddress.text = addressText;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
