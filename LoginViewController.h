//
//  LoginViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/15/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RangeSlider.h"
#import "ModalPickerViewController.h"
#import "AppDelegate.h"

@interface LoginViewController : UIViewController<ModalPickerViewDelegate> {

}

-(IBAction)action_login:(id)sender;
- (IBAction)btn_createAccount:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tf_username;
@property (weak, nonatomic) IBOutlet UITextField *tf_password;
@property(nonatomic,strong)NSManagedObjectContext* managedObjectContext;
@property (weak, nonatomic) IBOutlet UITextView *tv_test;
@property (weak, nonatomic) IBOutlet UIButton *btn_login;
@property (weak, nonatomic) IBOutlet UIButton *btn_test;

@end
