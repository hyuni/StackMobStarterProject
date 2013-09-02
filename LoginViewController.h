//
//  LoginViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/15/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btn_test;

-(IBAction)action_login:(id)sender;
-(IBAction)action_test:(id)sender;
- (IBAction)btn_createAccount:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tf_username;
@property (weak, nonatomic) IBOutlet UITextField *tf_password;
@property(nonatomic,strong)NSManagedObjectContext* managedObjectContext;
@property (weak, nonatomic) IBOutlet UITextView *tv_test;

@end
