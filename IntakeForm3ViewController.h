//
//  IntakeForm3ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface IntakeForm3ViewController : UITableViewController {
    Dashboard *dashboard;
}

- (IBAction)save_local:(id)sender;
- (IBAction)cancel_local:(id)sender;


@end
