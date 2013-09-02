//
//  DashboardViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/20/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "DashboardViewController.h"
#import "MFSideMenu.h"
#import "Clipboard.h"
#import "StackMob.h"
#import "Utility.h"

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

    arr_menu = [[NSArray alloc] init];
    arr_sorted_menu = [[NSMutableArray alloc] init];

}

- (void)viewWillAppear:(BOOL)animated {

    
    //--- make data model ---//
    if([_tab_bar selectedItem] == _tab_all) {
        [self fetchData:@"All" ];
    }
    else if([_tab_bar selectedItem] == _tab_draft) {
        [self fetchData:@"Draft" ];
    }
    else if([_tab_bar selectedItem] == _tab_sent) {
        [self fetchData:@"Sent" ];
    }
    else if([_tab_bar selectedItem] == _tab_local) {
        [self fetchData:@"Local" ];
    }

//    [_dashTableView reloadData];
}

- (void)fetchData:(NSString *)status {
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Dashboard"];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createddate" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
    if(![status isEqualToString:@"All"]) {
        NSPredicate *equalPredicate = [NSPredicate predicateWithFormat:@"status == %@", status];
        [fetchRequest setPredicate:equalPredicate];        
    }
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    [context executeFetchRequest:fetchRequest onSuccess:^(NSArray *results) {
        arr_menu = results;
        [self dateCalc];
        [_dashTableView reloadData];
        NSLog(@"result count : %d", [arr_menu count]);
    } onFailure:^(NSError *error) {
        //        [self.refreshControl endRefreshing];
        NSLog(@"An error %@, %@", error, [error userInfo]);
    }];
    
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

- (void)dateCalc {
    if([arr_menu count] <= 0)
        return;
    
    Dashboard *board = (Dashboard *)[arr_menu objectAtIndex:0];
    NSString *str_before = [Utility dateToString:board.createddate];
    NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
    
    arr_sorted_menu = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < [arr_menu count]; i++) {
        Dashboard *tmp_board = [arr_menu objectAtIndex:i];

        NSString *str_current = [Utility dateToString:tmp_board.createddate];
        
        if([str_before isEqualToString:str_current]) {
            [arr_tmp addObject:tmp_board];
            if([arr_tmp lastObject] == [arr_tmp objectAtIndex:i]) {
                [arr_sorted_menu addObject:arr_tmp];
            }
        }
        else {
            str_before = [Utility dateToString:tmp_board.createddate];
            [arr_sorted_menu addObject:arr_tmp];
            arr_tmp = [[NSMutableArray alloc] init];
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arr_menu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell...
//    cell.textLabel.text = ((Dashboard *)[arr_menu objectAtIndex:indexPath.row]).status;
    UILabel *lb_healthNumber = (UILabel *)[cell viewWithTag:1];
    UILabel *lb_explain = (UILabel *)[cell viewWithTag:2];
    UIButton *btn_status = (UIButton *)[cell viewWithTag:3];
    
    lb_healthNumber.text = ((Dashboard *)[arr_menu objectAtIndex:indexPath.row]).healthcard_number;
    lb_explain.text = [NSString stringWithFormat:@"%@", ((Dashboard *)[arr_menu objectAtIndex:indexPath.row]).patient_status];
    NSString *str_tmp = ((Dashboard *)[arr_menu objectAtIndex:indexPath.row]).status;
    [btn_status setTitle:str_tmp forState:UIControlStateNormal];

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
    
    [self viewWillAppear:nil];

}
@end
