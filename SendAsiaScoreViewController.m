//
//  SendAsiaScoreViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/31/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "SendAsiaScoreViewController.h"
#import "Clipboard.h"   
#import "AsiaEmailViewController.h"


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
    
    //--- set data ---//
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = (Dashboard *)[clip clipKey:@"create_intake"];

    //--- get user_info & username
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    NSDictionary *dic_userInfo = [userDefault objectForKey:@"user_info"];
//    NSString *str_userName = [dic_userInfo objectForKey:@"username"];
    
    self.title = @"Send ASIA Report";
    self.tf_subject.text = [NSString stringWithFormat:@"Subject: ASIA form for patient [%@]", dashboard.healthcard_number];
    self.tv_message.text = [NSString stringWithFormat:@"This is a reminder that the ASIA form for patient [%@] needs to be completed at 0, 3 and 7 days following admittance to hospital.", dashboard.healthcard_number];
    
    
    UIBarButtonItem *confirmButton = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStylePlain target:self action:@selector(btn_confirm:)];
    self.navigationItem.rightBarButtonItem = confirmButton;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardDidHideNotification object:nil];

}

#pragma mark - keyboard
//-(void) keyboardShown:(NSNotification*) notification {
//    CGRect rect_message = _tv_message.frame;
//    rect_message.origin.x = 20;
//    rect_message.origin.y = 20;
//    _tv_message.frame = rect_message;
//    
////    _initialTVHeight = self.view.frame.size.height;
////    
////    CGRect initialFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
////    CGRect convertedFrame = [self.view convertRect:initialFrame fromView:nil];
////    CGRect tvFrame = self.view.frame;
////    tvFrame.size.height = convertedFrame.origin.y;
////    self.view.frame = tvFrame;
//}
//
//-(void) keyboardHidden:(NSNotification*) notification {
//    CGRect rect_message = _tv_message.frame;
//    rect_message.origin.x = 20;
//    rect_message.origin.y = 210;
//    _tv_message.frame = rect_message;
//
////    CGRect tvFrame = self.view.frame;
////    tvFrame.size.height = _initialTVHeight;
////    [UIView beginAnimations:@"TableViewDown" context:NULL];
////    [UIView setAnimationDuration:0.5f];
////    self.view.frame = tvFrame;
////    [UIView commitAnimations];
//}


- (void)viewWillAppear:(BOOL)animated {
    NSMutableString *str_to = [[NSMutableString alloc] initWithString:@"To: "];
    
    for(NSString *str_tmp in _asiaSend.arr_toEmail) {
        [str_to appendFormat:@"[%@] ", str_tmp];
    }
    
    _tf_to.text = str_to;
    
    NSMutableString *str_cc = [[NSMutableString alloc] initWithString:@"CC: "];
    
    for(NSString *str_tmp in _asiaSend.arr_ccEmail) {
        [str_cc appendFormat:@"[%@] ", str_tmp];
    }
    
    _tf_cc.text = str_cc;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_confirm:(id)sender {
    _asiaSend.str_subject = self.tf_subject.text;
    _asiaSend.str_message = self.tv_message.text;
    
//    [_arr_asiaSend addObject:asiaSend];
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)btn_to:(id)sender {
    AsiaEmailViewController *emailController = [[AsiaEmailViewController alloc] initWithNibName:@"AsiaEmailViewController" bundle:nil];
    emailController.arr_Email = _asiaSend.arr_toEmail;
//    emailController.mode = @"to";
    
    [self.navigationController pushViewController:emailController animated:YES];
    
}


- (IBAction)btn_cc:(id)sender {
    AsiaEmailViewController *emailController = [[AsiaEmailViewController alloc] initWithNibName:@"AsiaEmailViewController" bundle:nil];
    emailController.arr_Email = _asiaSend.arr_ccEmail;
//    emailController.mode = @"cc";
    
    [self.navigationController pushViewController:emailController animated:YES];

}

@end
