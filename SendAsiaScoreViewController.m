//
//  SendAsiaScoreViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/31/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "SendAsiaScoreViewController.h"

@interface SendAsiaScoreViewController ()

@end

@implementation SendAsiaScoreViewController

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
    self.title = @"Send ASIA Report";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_confirm:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
