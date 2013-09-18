//
//  ModalPickerViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/11/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

/* USAGE
 -(void)didFinishedModalPickerConfirmed:(NSMutableArray *)arr_selectedItems tag:(id)tag {
 
 
 }
 
 - (IBAction)test_button:(id)sender {
 
 ModalPickerViewController *modalController = [[ModalPickerViewController alloc] initWithNibName:@"ModalPickerViewController" bundle:nil];
 modalController.delegate = self;
 NSMutableArray *arr_sources = [[NSMutableArray alloc] init];
 [arr_sources addObject:[NSMutableArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", nil]];
 [arr_sources addObject:[NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil]];
 modalController.arr_sources = arr_sources;
 modalController.tag = @"TAG";
 [self presentViewController:modalController animated:YES completion:nil];
 
 }
 */

typedef enum {
    ModalPickerViewModePikcer,  //default
    ModalPickerViewModeDatePicker,
    ModalPickerViewModeDateTimePicker
} ModalPickerViewMode;

@protocol ModalPickerViewDelegate <NSObject>
-(void)didFinishedModalPickerConfirmed:(NSMutableArray *)arr_selectedItems tag:(id)tag;
@end

@interface ModalPickerViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    __weak IBOutlet UILabel *lb_title;
    __weak IBOutlet UIPickerView *pv_picker;
    __weak IBOutlet UIDatePicker *pv_datePicker;
    NSString *str_lbTitle;
}

@property (nonatomic, assign) id<ModalPickerViewDelegate>delegate;
@property NSMutableArray *arr_sources;
@property id tag;
@property ModalPickerViewMode modalMode;

- (void)setToolbarTitle:(NSString *)pString;
- (IBAction)didPressedCancel:(id)sender;
- (IBAction)didPressedConfirm:(id)sender;
@end
