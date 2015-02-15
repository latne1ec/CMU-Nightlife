//
//  BarTableViewController.m
//  CMU Nightlife
//
//  Created by Evan Latner on 3/31/14.
//  Copyright (c) 2014 Evan Latner. All rights reserved.
//

#import "BarTableViewController.h"
#import "BarTableCell.h"
#import "BarDetailViewController.h"
#import "Bar.h"

@interface BarTableViewController ()

@end

@implementation BarTableViewController

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
        self.parseClassName = @"Bars";
        
        //The key of the PFObject to display in the label of the default cell style
        self.textKey = @"barName";
        
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
    static NSString *CellIdentifier = @"BarTableCell";
    
    BarTableCell *cell = (BarTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Configure the cell
    PFFile *thumbnail = [object objectForKey:@"barImage"];
    PFImageView *thumbnailImageView = (PFImageView*)cell.thumbnailImageView;
    thumbnailImageView.image = [UIImage imageNamed:@""];
    thumbnailImageView.file = thumbnail;
    [thumbnailImageView loadInBackground];
    
    cell.nameLabel.text = [object objectForKey:@"barName"];
    cell.barTeaser.text = [object objectForKey:@"barTeaser"];
    
    return cell;
    
}

- (void) objectsDidLoad:(NSError *)error
{
    [super objectsDidLoad:error];
    
    NSLog(@"error: %@", [error localizedDescription]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showBarDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow]; BarDetailViewController *destViewController = segue.destinationViewController;
        
        PFObject *object = [self.objects objectAtIndex:indexPath.row];
        Bar *bar = [[Bar alloc]init];
        bar.name = [object objectForKey:@"barName"]; //changed to Directions
        bar.imageFile = [object objectForKey:@"barImageDvc"];
        bar.specials = [object objectForKey:@"specials"];
        bar.address = [object objectForKey:@"barAddress"];
        bar.contact = [object objectForKey:@"barContact"];
        destViewController.bar = bar;
        
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
