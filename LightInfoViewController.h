//
//  LightInfoViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/31/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LightInfoViewController : UITableViewController {
    NSString *str_tv_info;
    NSString *str_image_name;
}
@property (weak, nonatomic) IBOutlet UITextView *tv_info;

- (void)setInfoText:(NSString *)str_info;
@property (weak, nonatomic) IBOutlet UIImageView *iv_img;
- (void)setImageName:(NSString *)str_name;

@end
