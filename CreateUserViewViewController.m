//
//  CreateUserViewViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/2/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "CreateUserViewViewController.h"
#import "StackMob.h"
#import "User.h"

@interface CreateUserViewViewController ()

@end

@implementation CreateUserViewViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_createAccount:(id)sender {
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    User *newUser = [[User alloc] initNewUserInContext:context];
    [newUser setUsername:_tf_username.text];
    [newUser setPassword:_tf_password.text];
    
    [context saveOnSuccess:^{
        // Saved the user object
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"User Created"
													   delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		
		[alert show];
        [self.navigationController popViewControllerAnimated:YES];
        
    } onFailure:^(NSError *error){
        // Error
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"User Create was Failed"
													   delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		
		[alert show];
    }];
    
}

@end
