//
//  BarTableViewController.h
//  CMU Nightlife
//
//  Created by Evan Latner on 3/31/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface BarTableViewController : PFQueryTableViewController


@property UIActivityIndicatorViewStyle activityIndicatorViewStyle;

@property (readwrite, nonatomic, retain) UIColor *color;

@property (nonatomic, strong) PFGeoPoint *userLocation;


@end
