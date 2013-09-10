//
//  BoneGraftViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/10/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "BoneGraftViewController.h"
#import "Clipboard.h"
#import "Utility.h"

@interface BoneGraftViewController ()

@end

@implementation BoneGraftViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = [clip clipKey:@"create_surgery"];
    
    arr_menu_bool = [Utility getArrayBoneGraftDataFromStrong:dashboard.flxation_bone_graft_bool];
    [arr_menu_bool insertObject:@"" atIndex:0];
    [arr_menu_bool insertObject:@"" atIndex:7];
    [arr_menu_bool insertObject:@"" atIndex:11];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    arr_menu = [[NSMutableArray alloc] init];
    [arr_menu addObject:@"Autograft"];
    [arr_menu addObject:@"Local"];
    [arr_menu addObject:@"Fibula"];
    [arr_menu addObject:@"Rib"];
    [arr_menu addObject:@"Structural Ilium"];
    [arr_menu addObject:@"Morcelized Ilium"];
    [arr_menu addObject:@"Vascularized"];
    [arr_menu addObject:@"Allograft"];
    [arr_menu addObject:@"Structural"];
    [arr_menu addObject:@"Morcelized"];
    [arr_menu addObject:@"DBM"];
    [arr_menu addObject:@"Allograft"];
    [arr_menu addObject:@"BMP"];
    [arr_menu addObject:@"PMMA"];
    [arr_menu addObject:@"Other"];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section == 0)
        return [arr_menu count];
    else
        return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    UITableViewCell *cell = nil;
    if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Other"]) {
        //        cell = [tableView dequeueReusableCellWithIdentifier:@"CellOther"];
        return 178;
    }
    else {
        //        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1Label"];
        return 45;
    }
    
    //    return cell.frame.size.height;
    //    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    UITableViewCell *cell = nil;
    
    if(indexPath.section == 0) {
        if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Other"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellOther"];
            UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
            lb_title.text = [arr_menu objectAtIndex:indexPath.row];
            
            tv_other = (UITextView *)[cell viewWithTag:4];
            tv_other.text = dashboard.flxation_bone_graft_other;
            
            UIButton *btn_yes = (UIButton *)[cell viewWithTag:2];
            if([[arr_menu_bool objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
                //NO
                [btn_yes setTitle:@"  " forState:UIControlStateNormal];
            }
            else {
                [btn_yes setTitle:@"X" forState:UIControlStateNormal];
            }
            [btn_yes addTarget:self action:@selector(action_btn_yes:) forControlEvents:UIControlEventTouchUpInside];

            
        }
        else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Autograft"] || [[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Allograft"] || [[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Allograft"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellTitle"];
            UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
            lb_title.text = [arr_menu objectAtIndex:indexPath.row];
        }
        else {
            // except other
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1Label"];
            UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
            lb_title.text = [arr_menu objectAtIndex:indexPath.row];
            
            UIButton *btn_yes = (UIButton *)[cell viewWithTag:2];
            if([[arr_menu_bool objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
                //NO
                [btn_yes setTitle:@"  " forState:UIControlStateNormal];
            }
            else {
                [btn_yes setTitle:@"X" forState:UIControlStateNormal];
            }
            [btn_yes addTarget:self action:@selector(action_btn_yes:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        

    }
    else {
        // back to surgery
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellBack"];

        
    }
    
    
    return cell;
}

- (void)action_btn_yes:(id)sender {
    CGPoint buttonOriginInTableView = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonOriginInTableView];
    
    
    NSString *str_tmp = [arr_menu_bool objectAtIndex:indexPath.row];
    str_tmp = ([str_tmp isEqualToString:@"1"] ? @"0" : @"1");
    
    [arr_menu_bool replaceObjectAtIndex:indexPath.row withObject:str_tmp];
    
    
    [self viewWillAppear:NO];
    
}

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
    
    if(indexPath.section == 1 && indexPath.row == 0) {
        // back to surgery
        NSMutableString *mStr_result = [[NSMutableString alloc] init];
        for(NSString *tmp in arr_menu_bool) {
            [mStr_result appendString:tmp];
        }
        dashboard.flxation_bone_graft_bool = mStr_result;
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - text view delegate
- (void)textViewDidChange:(UITextView *)textView {
    dashboard.flxation_bone_graft_other = tv_other.text;
}
@end
