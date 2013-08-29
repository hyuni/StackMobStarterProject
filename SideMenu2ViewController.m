//
//  SideMenu2ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/20/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "SideMenu2ViewController.h"

@interface SideMenu2ViewController ()

@end

@implementation SideMenu2ViewController
@synthesize tv_menu, nb_menu;

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
//    UITableView *tv = (UITableView *)[self.view viewWithTag:100];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tv_back.png"]];
    [tempImageView setFrame:tv_menu.frame];
    
    self.tv_menu.backgroundView = tempImageView;

    [nb_menu setBackgroundImage:[UIImage imageNamed:@"navigationBackground.png"] forBarMetrics:UIBarMetricsDefault];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 5;
            break;
        case 1:
            return 3;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyIdentifier"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    
    NSString *str_menuName;
    
    if(indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                str_menuName = @"Intake Form";
                break;
            case 1:
                str_menuName = @"Spine Surgery Form";
                break;
            case 2:
                str_menuName = @"Discharge Form";
                break;
            case 3:
                str_menuName = @"Notifications (TBD)";
                break;
            case 4:
                str_menuName = @"My Patients (TBD)";
                break;
            default:
                break;
        }
    }
    else if(indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                str_menuName = @"Settings (TBD)";
                break;
            case 1:
                str_menuName = @"Report a Problem";
                break;
            case 2:
                str_menuName = @"Logout";
                break;
            default:
                break;
        }
    }
    else {
        str_menuName = @"";
    }
    
    cell.textLabel.text = str_menuName;

//    NSDictionary *item = (NSDictionary *)[self.content objectAtIndex:indexPath.row];
//    cell.textLabel.text = [item objectForKey:@"mainTitleKey"];
//    cell.detailTextLabel.text = [item objectForKey:@"secondaryTitleKey"];
//    NSString *path = [[NSBundle mainBundle] pathForResource:[item objectForKey:@"imageKey"] ofType:@"png"];
//    UIImage *theImage = [UIImage imageWithContentsOfFile:path];
//    cell.imageView.image = theImage;
    
    
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {

}


@end
