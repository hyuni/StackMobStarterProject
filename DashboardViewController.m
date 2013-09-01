//
//  DashboardViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/20/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "DashboardViewController.h"
#import "MFSideMenu.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController
@synthesize client;

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
	// Do any additional setup after loading the view.
    [_tab_bar setSelectedItem:_tab_all];

    arr_menu = [[NSMutableArray alloc] init];

}

- (void)viewWillAppear:(BOOL)animated {
//    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
//    
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Dashboard"];
//    
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createddate" ascending:NO];
//    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
//    
//    //    NSPredicate *equalPredicate = [NSPredicate predicateWithFormat:@"userid == %@", @"kakadais"];
//    //    [fetchRequest setPredicate:equalPredicate];
//    
//    [fetchRequest setSortDescriptors:sortDescriptors];
//    
//    [context executeFetchRequest:fetchRequest onSuccess:^(NSArray *results) {
//        NSLog(@"Data %@", results);
//        Dashboard *dashboard = [results lastObject];
//        
//        NSLog(@"dashboard_id : %@", dashboard.dashboard_id);
//        NSLog(@"date_of_birth : %@", dashboard.date_of_birth);
//        NSLog(@"diagnosis_details : %@", dashboard.diagnosis_details);
//        NSLog(@"surgery_required : %@", dashboard.surgery_required);
//        
//    } onFailure:^(NSError *error) {
//        //        [self.refreshControl endRefreshing];
//        NSLog(@"An error %@, %@", error, [error userInfo]);
//    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupMenuBarButtonItems {
//    self.navigationItem.rightBarButtonItem = [self rightMenuBarButtonItem];
//    if(self.menuContainerViewController.menuState == MFSideMenuStateClosed &&
//       ![[self.navigationController.viewControllers objectAtIndex:0] isEqual:self]) {
//        self.navigationItem.leftBarButtonItem = [self backBarButtonItem];
//    } else {
//        self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
//    }
}

- (IBAction)bbtn_left:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
//        [self setupMenuBarButtonItems];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell...
    

    return cell;
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
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - tab bar delegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"Tab bar : %d", item.tag);
    if(item.tag == 3) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"syncStackMobData" object:nil];
        NSLog(@"SYNC PERFORMED");
    }
}
@end
