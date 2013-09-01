//
//  SendAsiaScoreViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/31/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendAsiaScoreViewController : UIViewController {
    
    
}

@property (weak, nonatomic) IBOutlet UITextField *tf_to;
@property (weak, nonatomic) IBOutlet UITextField *tf_cc;
@property (weak, nonatomic) IBOutlet UITextField *tf_subject;
@property (weak, nonatomic) IBOutlet UITextView *tv_message;
@property (weak, nonatomic) IBOutlet UIButton *tv_confirm;
- (IBAction)btn_confirm:(id)sender;



@end
