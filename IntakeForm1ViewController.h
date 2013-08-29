//
//  IntakeForm1ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/28/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntakeForm1ViewController : UITableViewController<UITextFieldDelegate> {
    
}

@property (strong, nonatomic) IBOutlet UIView *modalView;
@property (weak, nonatomic) IBOutlet UITextField *tf_healthCardNumber;
@property (weak, nonatomic) IBOutlet UILabel *lb_dataOfBirth;
@property (weak, nonatomic) IBOutlet UIDatePicker *dp_dateOfBirth;

- (IBAction)modalDown:(id)sender;
- (IBAction)btn_confirm:(id)sender;

@end
