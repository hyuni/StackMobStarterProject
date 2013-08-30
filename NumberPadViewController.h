//
//  NumberPadViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/30/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberPadViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *tf_value;
@property (weak, nonatomic) IBOutlet UILabel *lb_title;
- (IBAction)done:(id)sender;

@end
