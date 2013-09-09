//
//  AsiaEmailViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/3/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "AsiaEmailViewController.h"

@interface AsiaEmailViewController ()

@end

@implementation AsiaEmailViewController

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
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action_confirm:(id)sender {
    // save & comback
    if ([_tf_email.text length] > 0) {
        [self.arr_Email addObject:_tf_email.text];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

@end
