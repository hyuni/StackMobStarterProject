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
#import "Discharge1ViewController.h"

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
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"occur_date" ascending:NO];
    NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"createddate" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, sortDescriptor2, nil];
    
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createddate" ascending:NO];
//    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"occur_date" ascending:NO];
//    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];

    
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
        [self dateCalc];
        [_dashTableView reloadData];
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
    if([arr_menu count] <= 0) {
        arr_sorted_menu = [[NSMutableArray alloc] init];
        return;
    }
    
    arr_sorted_menu = [[NSMutableArray alloc] init];

    // set first data
    Dashboard *board = (Dashboard *)[arr_menu objectAtIndex:0];
    NSString *str_before = board.occur_date;
    NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
    [arr_tmp addObject:[arr_menu objectAtIndex:0]];

    //calc from second data
    for(int i = 1; i < [arr_menu count]; i++) {
        NSString *str_current = ((Dashboard *)[arr_menu objectAtIndex:i]).occur_date;
        
        if([str_before isEqualToString:str_current]) {
            //same
            [arr_tmp addObject:[arr_menu objectAtIndex:i]]; // add to tmp
        }
        else {
            //different date
            [arr_sorted_menu addObject:arr_tmp];    // add current tmp to object
            arr_tmp = [[NSMutableArray alloc] init];    // renew tmp
            [arr_tmp addObject:[arr_menu objectAtIndex:i]]; // add to tmp
            str_before = str_current;
        }
    }
    //add last object
    [arr_sorted_menu addObject:arr_tmp];

    
//    Dashboard *board = (Dashboard *)[arr_menu objectAtIndex:0];
//    NSString *str_currentDate = [Utility dateToString:board.createddate];
//    NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
//    
//    arr_sorted_menu = [[NSMutableArray alloc] init];
//    
//    for(int i = 0; i < [arr_menu count]; i++) {
//        NSString *str_tmpDate = [Utility dateToString:((Dashboard *)[arr_menu objectAtIndex:i]).createddate];
//        
//        [arr_tmp addObject:[arr_menu objectAtIndex:i]];
//        if(![str_currentDate isEqualToString:str_tmpDate] || i == ([arr_menu count]-1)) {
//            //different date
//            [arr_sorted_menu addObject:arr_tmp];
//            arr_tmp = [[NSMutableArray alloc] init];
//            str_currentDate = str_tmpDate;
//            
//        }
//    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return ((Dashboard *)[(NSArray *)[arr_sorted_menu objectAtIndex:section] objectAtIndex:0]).occur_date;
//    return [Utility dateToString:((Dashboard *)[(NSArray *)[arr_sorted_menu objectAtIndex:section] objectAtIndex:0]).createddate];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [arr_sorted_menu count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [(NSArray *)[arr_sorted_menu objectAtIndex:section] count];
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
    
    lb_healthNumber.text = ((Dashboard *)[(NSArray *)[arr_sorted_menu objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]).healthcard_number;
    lb_explain.text = [NSString stringWithFormat:@"%@", ((Dashboard *)[(NSArray *)[arr_sorted_menu objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]).patient_status];
    NSString *str_tmp = ((Dashboard *)[(NSArray *)[arr_sorted_menu objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]).status;
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
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
//    Discharge1ViewController *discharge1Controller = [storyboard instantiateViewControllerWithIdentifier:@"Discharge1ViewController"];
//    
//    [self.navigationController pushViewController:discharge1Controller animated:YES];

}

#pragma mark - tab bar delegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSLog(@"Tab bar : %d", item.tag);
    
    [self viewWillAppear:nil];

}
@end
