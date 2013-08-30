//
//  IntakeForm4FractureTypeViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/30/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "IntakeForm4FractureTypeViewController.h"
#import "Clipboard.h"

@interface IntakeForm4FractureTypeViewController ()

@end

@implementation IntakeForm4FractureTypeViewController

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
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = (Dashboard *)[clip clipKey:@"create_intake"];
    
    [self setPickerViewData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UIPickerView delegate & data source
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [arr_component_0 count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [arr_component_0 objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}

- (void)setPickerViewData {
    //--- set default data ---//
    arr_component_0 = [[NSMutableArray alloc] init];
    if([dashboard.injurytype isEqualToString:@"Thoracic"]) {
        [arr_component_0 addObject:@"Burst"];
        [arr_component_0 addObject:@"Chance"];
        [arr_component_0 addObject:@"Wedge"];
        [arr_component_0 addObject:@"Dislocation"];
    }
    else if([dashboard.injurytype isEqualToString:@"Cervical"]){
        [arr_component_0 addObject:@"Hangman"];
        [arr_component_0 addObject:@"Odontoid"];
        [arr_component_0 addObject:@"Facet"];
    }
    else {
        // exception
        [arr_component_0 addObject:@"Burst"];
        [arr_component_0 addObject:@"Chance"];
        [arr_component_0 addObject:@"Wedge"];
        [arr_component_0 addObject:@"Dislocation"];

    }
}


#pragma mark - Custom Method

- (IBAction)confirm:(id)sender {
    dashboard.fracturetype = [arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
