//
//  BarDetailViewController.m
//  CMU Nightlife
//
//  Created by Evan Latner on 3/31/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import "BarDetailViewController.h"

@interface BarDetailViewController ()

@end

@implementation BarDetailViewController 

@synthesize barImageView;
@synthesize barLabel;
@synthesize specialsTextView;
@synthesize bar;
@synthesize barName;
@synthesize barAddress;
@synthesize barContact;


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
    
    self.title = bar.name;
    self.barLabel.text = bar.name; //Changed to Directions
    self.barContact.text = bar.contact;
    self.barImageView.image = [UIImage imageNamed:@"DvcPlaceholder.png"];
    self.barImageView.file = bar.imageFile;
    [barImageView loadInBackground];
    
    NSMutableString *specialsText = [NSMutableString string];
    for (NSString* special in bar.specials) {
        [specialsText appendFormat:@"%@\n", special];
    }
    self.specialsTextView.text = specialsText;
    
    NSMutableString *addressText = [NSMutableString string];
    for (NSString* address in bar.address) {
        [addressText appendFormat:@"%@\n", address];
    }
    self.barAddress.text = addressText;
    
}

- (void)viewDidUnload
{
    [self setBarImageView:nil];
    [self setBarLabel:nil];
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
