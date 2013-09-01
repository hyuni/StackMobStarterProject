//
//  DashboardViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/20/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "StackMob.h"

@interface DashboardViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITabBarControllerDelegate, UITabBarDelegate> {
    NSMutableArray *arr_menu;
}

- (IBAction)bbtn_left:(id)sender;
@property (weak, nonatomic) IBOutlet UITabBar *tab_bar;
@property (weak, nonatomic) IBOutlet UITabBarItem *tab_all;
@property (weak, nonatomic) IBOutlet UITabBarItem *tab_draft;
@property (weak, nonatomic) IBOutlet UITabBarItem *tab_sent;
@property (strong, nonatomic) SMClient *client;



@end
