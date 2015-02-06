//
//  Entertainment.h
//  CMU Nightlife
//
//  Created by Evan Latner on 4/12/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Entertainment : NSObject

@property (nonatomic, strong) NSString *name; //name of entertainment
@property (nonatomic, strong) NSString *teaser;
@property (nonatomic, strong)PFFile *imageFile;
@property (nonatomic, strong) NSString *image; //image filename of entertainment
@property (nonatomic, strong) NSArray *specials;
@property (nonatomic, strong) NSArray *address;
@property (nonatomic, strong) NSString *contact;
@property (nonatomic, strong) NSArray *hours;

@end
