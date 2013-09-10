//
//  DeviceUseViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/10/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"
#import "DCRoundSwitch.h"

@protocol DeviceUseViewControllerDelegate <NSObject>
-(void)didFinishedDeviceUse:(NSMutableArray *)arr_result;
@end

@interface DeviceUseViewController : UITableViewController<PickerViewControllerDelegate> {
    NSMutableArray *arr_detailData;
    
    DCRoundSwitch *sw_anterior;
    DCRoundSwitch *sw_posterior;
    DCRoundSwitch *sw_deviceLocation;
    __weak IBOutlet UIButton *btn_location;
}

@property NSString *str_detailData;
@property (weak, nonatomic) IBOutlet UITableViewCell *CellAnterior;
@property (weak, nonatomic) IBOutlet UITableViewCell *CellPosterior;
@property (weak, nonatomic) IBOutlet UITableViewCell *CellDeviceLocation;

@property (nonatomic, assign) id<DeviceUseViewControllerDelegate>delegate;

@end
