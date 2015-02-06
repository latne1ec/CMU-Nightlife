//
//  FoodTableViewController.m
//  CMU Nightlife
//
//  Created by Evan Latner on 4/4/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import "FoodTableViewController.h"
#import "FoodTableCell.h"
#import "FoodDetailViewController.h"
#import "Food.h"


@interface FoodTableViewController ()

@end

@implementation FoodTableViewController

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
    
    //Nav Bar Image for CMU Nightlife Logo
    //UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CMULOGOSMALL.png"]]];
    //self.navigationItem.leftBarButtonItem = item;
    
    //Table View Background Image
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TableViewBackground.png"]];
    [self.tableView setBackgroundView:imageView];
    
    //remove unused table cell lines
    self.tableView.tableFooterView = [UIView new];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - Table view data source

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        //The className to query on
        self.parseClassName = @"Food";
        
        //The key of the PFObject to display in the label of the default cell style
        self.textKey = @"foodName";
        
        //Whether the built in pull to refresh is enabled
        self.pullToRefreshEnabled = NO;
        
        //Whether the built in pagination is enabled
        self.paginationEnabled = NO;
    }
    return self;
}


- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *CellIdentifier = @"FoodTableCell";
    
    FoodTableCell *cell = (FoodTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Configure the cell
    PFFile *thumbnail = [object objectForKey:@"foodImage"];
    PFImageView *thumbnailImageView = (PFImageView*)cell.thumbnailImageView;
    thumbnailImageView.image = [UIImage imageNamed:@"TableCellimage.png"];
    thumbnailImageView.file = thumbnail;
    [thumbnailImageView loadInBackground];
    
    cell.nameLabel.text = [object objectForKey:@"foodName"];
    cell.foodTeaser.text = [object objectForKey:@"foodTeaser"];
    
    return cell;
    
}

- (void) objectsDidLoad:(NSError *)error
{
    [super objectsDidLoad:error];
    
    NSLog(@"error: %@", [error localizedDescription]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showFoodDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow]; FoodDetailViewController *destViewController = segue.destinationViewController;
        
        PFObject *object = [self.objects objectAtIndex:indexPath.row];
        Food *food = [[Food alloc]init];
        food.name = [object objectForKey:@"foodName"]; //changed to Directions
        food.imageFile = [object objectForKey:@"foodImageDvc"];
        food.specials = [object objectForKey:@"foodSpecials"];
        food.address = [object objectForKey:@"foodAddress"];
        food.contact = [object objectForKey:@"foodContact"];
        food.hours = [object objectForKey:@"foodHours"];
        destViewController.food= food;
        
        destViewController.hidesBottomBarWhenPushed = YES;
    }
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
