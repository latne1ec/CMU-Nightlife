//
//  UserLocationViewController.m
//  CMU Nightlife
//
//  Created by Evan Latner on 10/8/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import "UserLocationViewController.h"

@interface UserLocationViewController ()

@end

@implementation UserLocationViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
}

#pragma mark - Table view data source

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        //The className to query on
        self.parseClassName = @"Location";
        
        //The key of the PFObject to display in the label of the default cell style
        self.textKey = @"collegeName";
        
        //Whether the built in pull to refresh is enabled
        self.pullToRefreshEnabled = NO;
        
        //Whether the built in pagination is enabled
        self.paginationEnabled = NO;
    }
    return self;
}


#pragma mark - Table view delagate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    
    
    
    
    
//    NSString *userLocation = [self.allColleges objectAtIndex:indexPath.row];
//    PFUser *newUser = [PFUser user];
//    [newUser addObject:userLocation];
    
    
    PFObject *userLocation = [PFObject objectWithClassName:@"Location"];
    [userLocation setObject:userLocation forKey:@"collegeName"];
    
    
    [PFUser currentUser];
   
    
    
   
    
    
    
    
    
    
    
    
    
}

@end
