//
//  Cabs.h
//  CMU Nightlife
//
//  Created by Evan Latner on 4/4/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@interface Cabs : NSObject

@property (nonatomic, strong) NSString *name; //name of Cab Company
@property (nonatomic, strong) NSString *teaser;
@property (nonatomic, strong)PFFile *imageFile;
@property (nonatomic, strong) NSString *image; //image filename of Cab Company
@property (nonatomic, strong) NSArray *specials;
@property (nonatomic, strong) NSArray *address;
@property (nonatomic, strong) NSString *contact;

@end
