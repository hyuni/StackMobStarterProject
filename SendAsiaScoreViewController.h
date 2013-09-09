//
//  SendAsiaScoreViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/31/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "AsiaSendData.h"

@interface SendAsiaScoreViewController : UIViewController {
    Dashboard *dashboard;
    
    NSMutableArray *arr_asiaSend;
    
    
}

@property (weak, nonatomic) IBOutlet UITextField *tf_to;
@property (weak, nonatomic) IBOutlet UITextField *tf_cc;
@property (weak, nonatomic) IBOutlet UITextField *tf_subject;
@property (weak, nonatomic) IBOutlet UITextView *tv_message;
@property (weak, nonatomic) IBOutlet UIButton *tv_confirm;
//@property (strong, nonatomic) NSMutableArray *arr_asiaSend;
@property (strong, nonatomic) AsiaSendData *asiaSend;
- (IBAction)btn_confirm:(id)sender;



@end
