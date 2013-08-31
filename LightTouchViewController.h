//
//  LightTouchViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/30/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface LightTouchViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    Dashboard *dashboard;
    
    
    //--- cell 28 ---//
    NSMutableArray *arr_asia_lighttouch_l;
    NSMutableArray *arr_asia_lighttouch_r;
    
    NSMutableArray *arr_asia_pinpric_l;
    NSMutableArray *arr_asia_pinpric_r;
    
    NSMutableArray *arr_row_title;
    
    int i_light_total;
    int i_pin_total;
    
    int i_light_subtotal_l;
    int i_light_subtotal_r;
    int i_pin_subtotal_l;
    int i_pin_subtotal_r;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;




@end
