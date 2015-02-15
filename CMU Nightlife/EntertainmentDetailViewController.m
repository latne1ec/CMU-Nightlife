//
//  EntertainmentDetailViewController.m
//  CMU Nightlife
//
//  Created by Evan Latner on 4/12/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import "EntertainmentDetailViewController.h"

@interface EntertainmentDetailViewController ()

@end

@implementation EntertainmentDetailViewController

@synthesize entertainmentImageView;
@synthesize entertainmentLabel;
@synthesize specialsTextView;
@synthesize entertainment;
@synthesize entertainmentName;
@synthesize entertainmentAddress;
@synthesize entertainmentContact;

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
    
    self.title = entertainment.name;
    self.entertainmentLabel.text = entertainment.name; //Changed to Directions
    self.entertainmentContact.text = entertainment.contact;
    self.entertainmentImageView.image = [UIImage imageNamed:@"DvcPlaceholder.png"];
    self.entertainmentImageView.file = entertainment.imageFile;
    [entertainmentImageView loadInBackground];
    
    NSMutableString *specialsText = [NSMutableString string];
    for (NSString* special in entertainment.specials) {
        [specialsText appendFormat:@"%@\n", special];
    }
    self.specialsTextView.text = specialsText;
    
    NSMutableString *addressText = [NSMutableString string];
    for (NSString* address in entertainment.address) {
        [addressText appendFormat:@"%@\n", address];
    }
    self.entertainmentAddress.text = addressText;
    
    NSMutableString *hoursText = [NSMutableString string];
    for (NSString* hour in entertainment.hours) {
        [hoursText appendFormat:@"%@\n", hour];
    }
    self.entertainmentHours.text = hoursText;
    
}

- (void)viewDidUnload
{
    [self setEntertainmentImageView:nil];
    [self setEntertainmentLabel:nil];
    [self setSpecialsTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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
