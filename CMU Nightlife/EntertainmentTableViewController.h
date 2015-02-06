//
//  EntertainmentTableViewController.h
//  CMU Nightlife
//
//  Created by Evan Latner on 4/12/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EntertainmentTableViewController : PFQueryTableViewController

@property (nonatomic, strong) PFGeoPoint *userLocation;

//@property (nonatomic, strong) CLLocation *currentLocation;

@property (strong, nonatomic) PFUser *user;

@end
