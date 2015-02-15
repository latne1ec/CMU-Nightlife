//
//  EntertainmentTableViewController.m
//  CMU Nightlife
//
//  Created by Evan Latner on 4/12/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import "EntertainmentTableViewController.h"
#import "Entertainment.h"
#import "EntertainmentTableCell.h"
#import "EntertainmentDetailViewController.h"

@interface EntertainmentTableViewController ()

@end

@implementation EntertainmentTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Nav Bar Image for CMU Nightlife Logo
    //UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CMULOGOSMALL.png"]]];
    //self.navigationItem.leftBarButtonItem = item;
    
    //TableView background image
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
        self.parseClassName = @"Entertainment";
        
        //The key of the PFObject to display in the label of the default cell style
        self.textKey = @"entertainmentName";
        
        //Whether the built in pull to refresh is enabled
        self.pullToRefreshEnabled = NO;
        
        //Whether the built in pagination is enabled
        self.paginationEnabled = NO;
    }
    return self;
}

- (PFQuery *)queryForTable {
    
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *CellIdentifier = @"EntertainmentTableCell";
    
    EntertainmentTableCell *cell = (EntertainmentTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Configure the cell
    PFFile *thumbnail = [object objectForKey:@"entertainmentImage"];
    PFImageView *thumbnailImageView = (PFImageView*)cell.thumbnailImageView;
    thumbnailImageView.image = [UIImage imageNamed:@""];
    thumbnailImageView.file = thumbnail;
    [thumbnailImageView loadInBackground];
    
    cell.nameLabel.text = [object objectForKey:@"entertainmentName"];
    cell.entertainmentTeaser.text = [object objectForKey:@"entertainmentTeaser"];
    
    return cell;
    
}

- (void)stylePFLoadingViewTheHardWay
{
    UIColor *labelTextColor = [UIColor whiteColor];
    UIColor *labelShadowColor = [UIColor darkGrayColor];
    UIActivityIndicatorViewStyle activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    
    // go through all of the subviews until you find a PFLoadingView subclass
    for (UIView *subview in self.view.subviews)
    {
        if ([subview class] == NSClassFromString(@"PFLoadingView"))
        {
            // find the loading label and loading activity indicator inside the PFLoadingView subviews
            for (UIView *loadingViewSubview in subview.subviews) {
                if ([loadingViewSubview isKindOfClass:[UILabel class]])
                {
                    UILabel *label = (UILabel *)loadingViewSubview;
                    {
                        label.textColor = labelTextColor;
                        label.shadowColor = labelShadowColor;
                    }
                }
                
                if ([loadingViewSubview isKindOfClass:[UIActivityIndicatorView class]])
                {
                    UIActivityIndicatorView *activityIndicatorView = (UIActivityIndicatorView *)loadingViewSubview;
                    activityIndicatorView.activityIndicatorViewStyle = activityIndicatorViewStyle;
                }
            }
        }
    }
}

- (void) objectsDidLoad:(NSError *)error
{
    [super objectsDidLoad:error];
    
    NSLog(@"error: %@", [error localizedDescription]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //Hides tab bar when User sets their location
    if ([segue.identifier isEqualToString:@"showSetUserLocation"]) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }
    else if ([segue.identifier isEqualToString:@"showEntertainmentDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow]; EntertainmentDetailViewController *destViewController = segue.destinationViewController;
        
        PFObject *object = [self.objects objectAtIndex:indexPath.row];
        Entertainment *entertainment = [[Entertainment alloc]init];
        entertainment.name = [object objectForKey:@"entertainmentName"]; //changed to Directions
        entertainment.imageFile = [object objectForKey:@"entertainmentImageDvc"];
        entertainment.specials = [object objectForKey:@"entertainmentSpecials"];
        entertainment.address = [object objectForKey:@"entertainmentAddress"];
        entertainment.contact = [object objectForKey:@"entertainmentContact"];
        entertainment.hours = [object objectForKey:@"entertainmentHours"];
        destViewController.entertainment = entertainment;
        
        destViewController.hidesBottomBarWhenPushed = YES;
        
        
    }
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
