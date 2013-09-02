//
//  Discharge2ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/1/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface Discharge2ViewController : UITableViewController {
    Dashboard *dashboard;
    int selected_row;
}

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *cells;
@property (weak, nonatomic) IBOutlet UITextField *tf_other;

@end
