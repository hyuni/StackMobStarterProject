//
//  VertebralSurgeryViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/9/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "VertebralSurgeryViewController.h"
#import "Clipboard.h"


@interface VertebralSurgeryViewController ()

@end

@implementation VertebralSurgeryViewController

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
    
    
}

- (void)initVertebralData {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    arr_menu = [[NSMutableArray alloc] init];
    [arr_menu addObject:@"Excision"];
    if([dashboard.excision isEqualToString:@"YES"]) {
        [arr_menu addObject:@"Discectomy"];
        [arr_menu addObject:@"Removal of spinal instrumentation"];
    }
    
    [arr_menu addObject:@"Decompression"];
    if([dashboard.decompression isEqualToString:@"YES"]) {
        [arr_menu addObject:@"Laminectomy"];
        [arr_menu addObject:@"Laminotomy"];
        [arr_menu addObject:@"Foraminotomy"];
        [arr_menu addObject:@"Laminoplasty"];
    }
    
    [arr_menu addObject:@"Fixation / Fusion"];
    if([dashboard.flxation_fusion isEqualToString:@"YES"]) {
        [arr_menu addObject:@"Device used"];
        [arr_menu addObject:@"Bone graft"];
    }
    
    [arr_menu addObject:@"I & D"];
    if([dashboard.i_and_d isEqualToString:@"YES"]) {
        [arr_menu addObject:@" I & D "];
    }
    
    [arr_menu addObject:@"Osteotomy"];
    if([dashboard.osteotomy isEqualToString:@"YES"]) {
        [arr_menu addObject:@"Smith Peterson"];
        [arr_menu addObject:@"VCR"];
        [arr_menu addObject:@"Pedicle Subtraction"];
        [arr_menu addObject:@"Corpectomy"];
    }
    
    [arr_menu addObject:@"Augmentation"];
    if([dashboard.augmentation isEqualToString:@"YES"]) {
        [arr_menu addObject:@"Vertebroplasty"];
        [arr_menu addObject:@"Kyphoplasty"];
    }
    
    [arr_menu addObject:@"Excision tumour"];
    if([dashboard.excision_tumour isEqualToString:@"YES"]) {
        [arr_menu addObject:@"Intralesional"];
        [arr_menu addObject:@"Marginal"];
        [arr_menu addObject:@"Wide"];
    }
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arr_menu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    NSString *CellIdentifier = nil;
    NSString *str_tmpMenuName = [arr_menu objectAtIndex:indexPath.row];

    //Main Menu
    if([str_tmpMenuName isEqualToString:@"Excision"]) {
        CellIdentifier = @"CellDefault";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.excision isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if([str_tmpMenuName isEqualToString:@"Decompression"]) {
        CellIdentifier = @"CellDefault";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.decompression isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Fixation / Fusion"]) {
        CellIdentifier = @"CellDefault";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.flxation_fusion isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"I & D"]) {
        CellIdentifier = @"CellDefault";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.i_and_d isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Osteotomy"]) {
        CellIdentifier = @"CellDefault";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.osteotomy isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Augmentation"]) {
        CellIdentifier = @"CellDefault";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.augmentation isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Excision tumour"]) {
        CellIdentifier = @"CellDefault";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.excision_tumour isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    //Sub Menu
    
    else if([str_tmpMenuName isEqualToString:@"Discectomy"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.excision_discectomy isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Removal of spinal instrumentation"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.excision_removal_of_spinal isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Laminectomy"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.decom_laminectomy isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Laminotomy"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.decom_laminotomy isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Foraminotomy"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.decom_foraminotomy isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Laminoplasty"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.decom_laminoplasty isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Device used"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.flxation_device_used isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Bone graft"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.flxation_bone_graft isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@" I & D "]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.i_and_d_i_and_d isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Smith Peterson"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.ost_smith isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"VCR"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.ost_vcr isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Pedicle Subtraction"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.ost_ped isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Corpectomy"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.ost_corp isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Vertebroplasty"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.aug_vert isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Kyphoplasty"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.aug_kyp isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Intralesional"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.excision_tumour_int isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Marginal"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.exicsion_tumour_mar isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([str_tmpMenuName isEqualToString:@"Wide"]) {
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
        [btn_x setTitle:([dashboard.excision_tumour_wide isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
        [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
    lb_title.text = str_tmpMenuName;
    
    
    // Configure the cell...
    
    return cell;
}

- (void)action_btn_x:(id)sender {
    CGPoint buttonOriginInTableView = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonOriginInTableView];

    //Main Menu
    NSString *str_tmpMenuName = [arr_menu objectAtIndex:indexPath.row];
    if([str_tmpMenuName isEqualToString:@"Excision"]) {
        dashboard.excision = ([dashboard.excision isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Decompression"]) {
        dashboard.decompression = ([dashboard.decompression isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Fixation / Fusion"]) {
        dashboard.flxation_fusion = ([dashboard.flxation_fusion isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"I & D"]) {
        dashboard.i_and_d = ([dashboard.i_and_d isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Osteotomy"]) {
        dashboard.osteotomy = ([dashboard.osteotomy isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Augmentation"]) {
        dashboard.augmentation = ([dashboard.augmentation isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Excision tumour"]) {
        dashboard.excision_tumour = ([dashboard.excision_tumour isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    //Sub Menu
    else if([str_tmpMenuName isEqualToString:@"Discectomy"]) {
        dashboard.excision_discectomy = ([dashboard.excision_discectomy isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Removal of spinal instrumentation"]) {
        dashboard.excision_removal_of_spinal = ([dashboard.excision_removal_of_spinal isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Laminectomy"]) {
        dashboard.decom_laminectomy = ([dashboard.decom_laminectomy isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Laminotomy"]) {
        dashboard.decom_laminotomy = ([dashboard.decom_laminotomy isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Foraminotomy"]) {
        dashboard.decom_foraminotomy = ([dashboard.decom_foraminotomy isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Laminoplasty"]) {
        dashboard.decom_laminoplasty = ([dashboard.decom_laminoplasty isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Device used"]) {
        dashboard.flxation_device_used = ([dashboard.flxation_device_used isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Bone graft"]) {
        dashboard.flxation_bone_graft = ([dashboard.flxation_bone_graft isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@" I & D "]) {
        dashboard.i_and_d_i_and_d = ([dashboard.i_and_d_i_and_d isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Smith Peterson"]) {
        dashboard.ost_smith = ([dashboard.ost_smith isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"VCR"]) {
        dashboard.ost_vcr = ([dashboard.ost_vcr isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Pedicle Subtraction"]) {
        dashboard.ost_ped = ([dashboard.ost_ped isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Corpectomy"]) {
        dashboard.ost_corp = ([dashboard.ost_corp isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Vertebroplasty"]) {
        dashboard.aug_vert = ([dashboard.aug_vert isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Kyphoplasty"]) {
        dashboard.aug_kyp = ([dashboard.aug_kyp isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Intralesional"]) {
        dashboard.excision_tumour_int = ([dashboard.excision_tumour_int isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Marginal"]) {
        dashboard.exicsion_tumour_mar = ([dashboard.exicsion_tumour_mar isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Wide"]) {
        dashboard.excision_tumour_wide = ([dashboard.excision_tumour_wide isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    
    [self viewWillAppear:YES];
    
    /*
    //Main Menu
    NSString *str_tmpMenuName;
    if([str_tmpMenuName isEqualToString:@"Excision"]) {

    }
    else if([str_tmpMenuName isEqualToString:@"Decompression"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Fixation / Fusion"]) {
     
    }
    else if([str_tmpMenuName isEqualToString:@"I & D"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Osteotomy"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Augmentation"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Excision tumour"]) {
        
    }
    //Sub Menu
    else if([str_tmpMenuName isEqualToString:@"Discectomy"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Removal of spinal instrumentation"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Laminectomy"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Laminotomy"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Foraminotomy"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Laminoplasty"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Device used"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Bone graft"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@" I & D "]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Smith Peterson"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"VCR"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Pedicle Subtraction"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Corpectomy"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Vertebroplasty"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Kyphoplasty"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Intralesional"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Marginal"]) {
        
    }
    else if([str_tmpMenuName isEqualToString:@"Wide"]) {
        
    }
     */
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
    NSString *str_tmpMenuName = [arr_menu objectAtIndex:indexPath.row];
    
    //Sub Menu
    if([str_tmpMenuName isEqualToString:@"Discectomy"]) {
        if(![dashboard.excision_discectomy isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.excision_discectomy_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];
    }
    else if([str_tmpMenuName isEqualToString:@"Removal of spinal instrumentation"]) {
        if(![dashboard.excision_removal_of_spinal isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.excision_removal_of_spinal_deta;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];

        
    }
    else if([str_tmpMenuName isEqualToString:@"Laminectomy"]) {
        if(![dashboard.decom_laminectomy isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.decom_laminectomy_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];
    }
    else if([str_tmpMenuName isEqualToString:@"Laminotomy"]) {
        if(![dashboard.decom_laminotomy isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.decom_laminotomy_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];
    }
    else if([str_tmpMenuName isEqualToString:@"Foraminotomy"]) {
        if(![dashboard.decom_foraminotomy isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.decom_foraminotomy_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];
    }
    else if([str_tmpMenuName isEqualToString:@"Laminoplasty"]) {
        if(![dashboard.decom_laminoplasty isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.decom_laminoplasty_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];
    }
    else if([str_tmpMenuName isEqualToString:@"Device used"]) {
        if(![dashboard.flxation_device_used isEqualToString:@"YES"]) {
            return;
        }
    }
    else if([str_tmpMenuName isEqualToString:@"Bone graft"]) {
        if(![dashboard.flxation_bone_graft isEqualToString:@"YES"]) {
            return;
        }
    }
    else if([str_tmpMenuName isEqualToString:@" I & D "]) {
        if(![dashboard.i_and_d_i_and_d isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.i_and_d_i_and_d_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];

    }
    else if([str_tmpMenuName isEqualToString:@"Smith Peterson"]) {
        if(![dashboard.ost_smith isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.ost_smith_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];

    }
    else if([str_tmpMenuName isEqualToString:@"VCR"]) {
        if(![dashboard.ost_vcr isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.ost_vcr_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];

    }
    else if([str_tmpMenuName isEqualToString:@"Pedicle Subtraction"]) {
        if(![dashboard.ost_ped isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.ost_ped_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];

    }
    else if([str_tmpMenuName isEqualToString:@"Corpectomy"]) {
        if(![dashboard.ost_corp isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.ost_corp_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];

    }
    else if([str_tmpMenuName isEqualToString:@"Vertebroplasty"]) {
        if(![dashboard.aug_vert isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.aug_vert_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];

    }
    else if([str_tmpMenuName isEqualToString:@"Kyphoplasty"]) {
        if(![dashboard.aug_kyp isEqualToString:@"YES"]) {
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        DetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailController.title = [arr_menu objectAtIndex:indexPath.row];
        detailController.str_detailData = dashboard.aug_kyp_detail;
        detailController.delegate = self;
        [self.navigationController pushViewController:detailController animated:YES];

    }
    else if([str_tmpMenuName isEqualToString:@"Intralesional"]) {
        if(![dashboard.excision_tumour_int isEqualToString:@"YES"]) {
            return;
        }
    }
    else if([str_tmpMenuName isEqualToString:@"Marginal"]) {
        if(![dashboard.exicsion_tumour_mar isEqualToString:@"YES"]) {
            return;
        }
    }
    else if([str_tmpMenuName isEqualToString:@"Wide"]) {
        if(![dashboard.excision_tumour_wide isEqualToString:@"YES"]) {
            return;
        }
    }
}

-(void)delegateOk:(NSMutableArray *)arr_result {
    NSString *str_tmpTitle = [arr_result lastObject];
    if([str_tmpTitle isEqualToString:@"Discectomy"]) {
        dashboard.excision_discectomy_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Removal of spinal instrumentation"]) {
        dashboard.excision_removal_of_spinal_deta = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Laminectomy"]) {
        dashboard.decom_laminectomy_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Laminotomy"]) {
        dashboard.decom_laminotomy_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Foraminotomy"]) {
        dashboard.decom_foraminotomy_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Laminoplasty"]) {
        dashboard.decom_laminoplasty_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@" I & D "]) {
        dashboard.i_and_d_i_and_d_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Smith Peterson"]) {
        dashboard.ost_smith_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"VCR"]) {
        dashboard.ost_vcr_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Pedicle Subtraction"]) {
        dashboard.ost_ped_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Corpectomy"]) {
        dashboard.ost_corp_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Vertebroplasty"]) {
        dashboard.aug_vert_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Kyphoplasty"]) {
        dashboard.aug_kyp_detail = [arr_result objectAtIndex:0];
    }
}

@end
