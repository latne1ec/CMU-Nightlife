//
//  FoodDetailViewController.m
//  CMU Nightlife
//
//  Created by Evan Latner on 4/4/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import "FoodDetailViewController.h"

@interface FoodDetailViewController ()

@end

@implementation FoodDetailViewController

@synthesize foodImageView;
@synthesize foodLabel;
@synthesize specialsTextView;
@synthesize food;
@synthesize foodName;
@synthesize foodAddress;
@synthesize foodContact;
@synthesize foodHours;


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
    
    self.title = food.name;
    self.foodLabel.text = food.name; //Changed to Directions
    self.foodContact.text = food.contact;
    self.foodImageView.image = [UIImage imageNamed:@"DvcPlaceholder.png"];
    self.foodImageView.file = food.imageFile;
    [foodImageView loadInBackground];
    
    NSMutableString *specialsText = [NSMutableString string];
    for (NSString* special in food.specials) {
        [specialsText appendFormat:@"%@\n", special];
    }
    self.specialsTextView.text = specialsText;
    
    NSMutableString *addressText = [NSMutableString string];
    for (NSString* address in food.address) {
        [addressText appendFormat:@"%@\n", address];
    }
    self.foodAddress.text = addressText;
    
    NSMutableString *hoursText = [NSMutableString string];
    for (NSString* hour in food.hours) {
        [hoursText appendFormat:@"%@\n", hour];
    }
    self.foodHours.text = hoursText;
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
