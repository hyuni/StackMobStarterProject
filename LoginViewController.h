//
//  LoginViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/15/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

-(IBAction)action_login:(id)sender;
-(IBAction)action_test:(id)sender;

@property(nonatomic,strong)NSManagedObjectContext* managedObjectContext;

@end
