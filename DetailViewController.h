//
//  DetailViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/9/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "DCRoundSwitch.h"
#import "RangeSlider.h"
#import "PickerViewController.h"
#import "LightInfoViewController.h"


@protocol DetailViewControllerDelegate <NSObject>
-(void)delegateOk:(NSMutableArray *)arr_result;
@end


@interface DetailViewController : UITableViewController<PickerViewControllerDelegate> {
    
    __weak IBOutlet UILabel *lb_title;
    __weak IBOutlet UILabel *lb_subTitle;
    __weak IBOutlet UIButton *btn_1;
    __weak IBOutlet UIButton *btn_2;
    __weak IBOutlet UIButton *btn_3;
    __weak IBOutlet UIButton *btn_4;
    __weak IBOutlet UIButton *btn_5;
    __weak IBOutlet UIButton *btn_6;
    __weak IBOutlet UIButton *btn_7;
    __weak IBOutlet UIButton *btn_8;
    __weak IBOutlet UIButton *btn_9;
    __weak IBOutlet UIButton *btn_10;
        
    __weak IBOutlet UIButton *btn_location;
    
    __weak IBOutlet UITableViewCell *cell_mis;
    __weak IBOutlet UITableViewCell *cell_revision;
    __weak IBOutlet UITableViewCell *cell_location;
    
    NSMutableArray *arr_detailData;
    NSMutableArray *arr_btn;
    
    DCRoundSwitch *sw_mis;
    DCRoundSwitch *sw_revision;
    
    RangeSlider *slider;
    UILabel *reportLabel;

}


@property (nonatomic, assign) id<DetailViewControllerDelegate>delegate;
@property NSString *str_detailData;

- (IBAction)action_ok:(id)sender;
- (IBAction)action_cancel:(id)sender;
- (IBAction)action_btn_location:(id)sender;
- (void)setLabelTitle:(NSString *)title subTitle:(NSString *)subTitle;

- (IBAction)action_info:(id)sender;

@end
