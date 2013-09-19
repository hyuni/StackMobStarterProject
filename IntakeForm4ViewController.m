//
//  IntakeForm4ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "IntakeForm4ViewController.h"
#import "IntakeForm4InjuryTypeViewController.h"
#import "IntakeForm4FractureTypeViewController.h"
#import "IntakeForm5ViewController.h"
#import "Clipboard.h"
#import "NumberPadViewController.h"
#import "OnePickerViewController.h"
#import "TLICScoreViewController.h"
#import "IntakeMotorViewController.h"
#import "LightTouchViewController.h"
#import "SendAsiaScoreViewController.h"
#import "StackMob.h"
#import "DCRoundSwitch.h"
#import "KKDS_Preference.h"


@interface IntakeForm4ViewController ()

@end

@implementation IntakeForm4ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = (Dashboard *)[clip clipKey:@"create_intake"];
    
    storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    
//    arr_asiaSend = [[NSMutableArray alloc] init];
    asiaSend = [[AsiaSendData alloc] init];
    
}


- (void)viewWillAppear:(BOOL)animated {
    /* menu list
     Neurologically Intact
     Select Injury Type
     Select Fracture Type
     Degrees Of Kyphosis
     Height Loss
     TLIC Score
     Hangman
     Translation
     
     ----------------------
     
     ASIA Score
     Motor
     Light Touch / Pin Prick
     Voluntary anal contraction
     Anal sensation
     Complete or Incomplete
     Neurological level
     Zone of partial preservation
     Send ASIA report
     */
    
    //--- Menu Display ---//
    // 1 neurologically intact is always visible
    if([dashboard.neurologicallyintact isEqualToString:@"NO"]) {
        // intact == NO
        arr_menu = [NSMutableArray arrayWithObjects:@"Neurologically Intact", @"Select Injury Type", nil];
        
        if([dashboard.injurytype isEqualToString:@"Thoracic"]) {
            [arr_menu addObject: @"Select Fracture Type"];
            if([dashboard.fracturetype isEqualToString:@"Burst"]) {
                [arr_menu addObject:@"Degrees Of Kyphosis"];
                [arr_menu addObject:@"Height Loss"];
                [arr_menu addObject:@"TLIC Score"];
            }
        }
        else if([dashboard.injurytype isEqualToString:@"Cervical"]) {
            [arr_menu addObject: @"Select Fracture Type"];
            if([dashboard.fracturetype isEqualToString:@"Hangman"]) {
                [arr_menu addObject:@"Degrees Of Kyphosis"];
                [arr_menu addObject:@"Translation"];
            }
        }
        else if([dashboard.injurytype isEqualToString:@"Lumbar"]) {
            
        }
        
    }
    else {
        // intact == YES
        arr_menu = [NSMutableArray arrayWithObjects:@"Neurologically Intact", @"Select Injury Type", nil];
        if([dashboard.injurytype isEqualToString:@"Spinal cord"]) {
            [arr_menu addObject:@"ASIA Score"];
            [arr_menu addObject:@"Motor"];
            [arr_menu addObject:@"Light Touch / Pin Prick"];
            [arr_menu addObject:@"Voluntary anal contraction"];
            [arr_menu addObject:@"Anal sensation"];
            [arr_menu addObject:@"Complete or Incomplete"];
            [arr_menu addObject:@"Neurological level"];
            [arr_menu addObject:@"Zone of partial preservation"];
            [arr_menu addObject:@"Send ASIA report"];
        }
    }
    
    [self.tableView reloadData];
}




#pragma mark - Table view data source & delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section == 0)
        return [arr_menu count];
    else if(section == 1)
        // next
        return 1;
    else
        // error exception
        return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 45 115
    if (indexPath.section == 0) {
        NSString *str_menu = [arr_menu objectAtIndex:indexPath.row];
        if([str_menu isEqualToString:@"Neurological level"] || [str_menu isEqualToString:@"Zone of partial preservation"]) {
            return 115.0f;
        }
        else return 45.0f;
        
    }
    else return 45.0f;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSArray *topObject = nil;
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:tmp_index];
    // Configure the cell...

    /* menu list
     Neurologically Intact
     Select Injury Type
     Select Fracture Type
     Degrees Of Kyphosis
     Height Loss
     TLIC Score
     Hangman
     Translation
     
     ----------------------
     
     ASIA Score
     Motor
     Light Touch / Pin Prick
     Voluntary anal contraction
     Anal sensation
     Neurological level
     Zone of partial preservation
     Send ASIA report
     */
    
    if(indexPath.section == 0) {
        //--- menu ---//
        NSString *str_menuName = [arr_menu objectAtIndex:indexPath.row];
        if ([str_menuName isEqualToString:@"Neurologically Intact"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];            
        }
        
        else if ([str_menuName isEqualToString:@"Degrees Of Kyphosis"] || [str_menuName isEqualToString:@"Height Loss"] || [str_menuName isEqualToString:@"Translation"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"TextFieldCell" owner:self options:nil];
        }

        //--- If Neurologically intact == YES, then use specific Cell
        else if ([str_menuName isEqualToString:@"ASIA Score"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }
        else if ([str_menuName isEqualToString:@"Motor"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }
        else if ([str_menuName isEqualToString:@"Light Touch / Pin Prick"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"LightTouchMenuCell" owner:self options:nil];
        }

        else if ([str_menuName isEqualToString:@"Voluntary anal contraction"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }

        else if ([str_menuName isEqualToString:@"Anal sensation"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }
        else if ([str_menuName isEqualToString:@"Complete or Incomplete"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }
        
        else if ([str_menuName isEqualToString:@"Neurological level"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"Neurological_level" owner:self options:nil];
            
        }

        else if ([str_menuName isEqualToString:@"Zone of partial preservation"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"Neurological_level" owner:self options:nil];
        }

        else if ([str_menuName isEqualToString:@"Send ASIA report"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"SendAsiaCell" owner:self options:nil];
        }

        //--- If Neurologically intact == NO, then use normal MenuCell
        else {
            
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }
        cell = [topObject objectAtIndex:0];
        
        //--- Label Display ---//
        UILabel *lb_left = (UILabel *)[cell viewWithTag:1];
        lb_left.text = [arr_menu objectAtIndex:indexPath.row];
        
        if ([str_menuName isEqualToString:@"Neurologically Intact"]) {
            // intact only
            DCRoundSwitch *dcsw_custom = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom setOffText:@"NO"];
            [dcsw_custom setOnText:@"YES"];
            
            if([dashboard.neurologicallyintact isEqualToString:@"YES"]) [dcsw_custom setOn:YES animated:NO ignoreControlEvents:YES];
            else [dcsw_custom setOn:NO animated:NO ignoreControlEvents:YES];

            [cell addSubview:dcsw_custom];
            
            [dcsw_custom addTarget:self action:@selector(action_sw_intact:) forControlEvents:UIControlEventValueChanged];

//            UISwitch *sw_intact = (UISwitch *)[cell viewWithTag:2];
//            
//            if([dashboard.neurologicallyintact isEqualToString:@"YES"]) [sw_intact setOn:YES];
//            else [sw_intact setOn:NO];
//
//            [sw_intact addTarget:self action:@selector(action_sw_intact:) forControlEvents:UIControlEventValueChanged];
        }
        else if ([str_menuName isEqualToString:@"Degrees Of Kyphosis"]){
            UITextField *tf_tmp = (UITextField *)[cell viewWithTag:2];
            tf_tmp.returnKeyType  = UIReturnKeyDone;
//            tf_tmp.keyboardType = UIKeyboardTypeNumberPad;
            tf_tmp.text = dashboard.degree_kyphosis;
            [tf_tmp addTarget:self action:@selector(sel_degree:) forControlEvents:UIControlEventEditingChanged];
            [tf_tmp addTarget:self action:@selector(resignFirstResponder) forControlEvents:UIControlEventEditingDidEndOnExit];
//            lb_right.text = dashboard.degree_kyphosis;
        }
        else if ([str_menuName isEqualToString:@"Height Loss"]){
            UITextField *tf_tmp = (UITextField *)[cell viewWithTag:2];
            tf_tmp.returnKeyType  = UIReturnKeyDone;
//            tf_tmp.keyboardType = UIKeyboardTypeNumberPad;
            tf_tmp.text = dashboard.height_loss;
            [tf_tmp addTarget:self action:@selector(sel_heightLoss:) forControlEvents:
             UIControlEventEditingChanged];
            [tf_tmp addTarget:self action:@selector(resignFirstResponder) forControlEvents:UIControlEventEditingDidEndOnExit];

//            lb_right.text = dashboard.height_loss;
        }
        else if ([str_menuName isEqualToString:@"Translation"]){
            UITextField *tf_tmp = (UITextField *)[cell viewWithTag:2];
            tf_tmp.returnKeyType  = UIReturnKeyDone;
//            tf_tmp.keyboardType = UIKeyboardTypeNumberPad;
            tf_tmp.text = dashboard.translation;
            [tf_tmp addTarget:self action:@selector(sel_translation:) forControlEvents:UIControlEventEditingChanged];
            [tf_tmp addTarget:self action:@selector(resignFirstResponder) forControlEvents:UIControlEventEditingDidEndOnExit];

        }
        else {
            // every not intact
            UILabel *lb_right = (UILabel *)[cell viewWithTag:2];
            if([str_menuName isEqualToString:@"Select Injury Type"]) {
                if([dashboard.neurologicallyintact isEqualToString:@"YES"]) {
                    lb_right.text = dashboard.injurytype;
                }
                else {
                    // --- intact NO
                    if([dashboard.injurylevel length] > 0 && [dashboard.injurytype length] >0) {
                        NSString *str_rightValue = [NSString stringWithFormat:@"%@ L-%@", dashboard.injurytype, dashboard.injurylevel];
                        lb_right.text = str_rightValue;
                    }
                }
            }
            else if([str_menuName isEqualToString:@"Select Fracture Type"]){
                lb_right.text = dashboard.fracturetype;
            }
            else if ([str_menuName isEqualToString:@"TLIC Score"]) {
                if(dashboard.fracture_morphology_type != nil && dashboard.neurologic_status != nil && dashboard.plc) {
//                    int i_total = 0;
//                    if(dashboard.fracture_morphology_type != nil) i_total += [dashboard.fracture_morphology_type intValue];
//                    if(dashboard.neurologic_status != nil) i_total += [dashboard.neurologic_status intValue];
//                    if(dashboard.plc != nil) i_total += [dashboard.plc intValue];
//                    
//                    lb_right.text = [NSString stringWithFormat:@"%d", i_total];
                    lb_right.text = dashboard.tlic_score_total;
                }
            }
            
            //--- intact == YES
            if ([str_menuName isEqualToString:@"ASIA Score"]) {
                lb_right.text = dashboard.asia_score;
            }
            else if ([str_menuName isEqualToString:@"Motor"]) {
                lb_right.text = [NSString stringWithFormat:@"L:%@ R:%@ T:%@",
                                 dashboard.asia_motor_l_subtotal,
                                 dashboard.asia_motor_r_subtotal,
                                 dashboard.asia_motor_total];
            }
            else if ([str_menuName isEqualToString:@"Light Touch / Pin Prick"]) {
                UILabel *lb_light_right = (UILabel *)[cell viewWithTag:1];
                UILabel *lb_pin_right = (UILabel *)[cell viewWithTag:2];
                
                lb_light_right.text = [NSString stringWithFormat:@"L:%@ R:%@ T:%@",
                                       dashboard.asia_lighttouch_l_subtotal,
                                       dashboard.asia_lighttouch_r_subtotal,
                                       dashboard.asia_lighttouch_total];
                lb_pin_right.text = [NSString stringWithFormat:@"L:%@ R:%@ T:%@",
                                       dashboard.asia_pinpric_l_subtotal,
                                       dashboard.asia_pinpric_r_subtotal,
                                       dashboard.asia_pinpric_total];
                
            }
            else if ([str_menuName isEqualToString:@"Voluntary anal contraction"]) {
                DCRoundSwitch *dcsw_custom = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
                [dcsw_custom setOffText:@"NO"];
                [dcsw_custom setOnText:@"YES"];
                
                if([dashboard.voluntary_anal_contraction isEqualToString:@"YES"]) [dcsw_custom setOn:YES animated:NO ignoreControlEvents:YES];
                else [dcsw_custom setOn:NO animated:NO ignoreControlEvents:YES];
                
                [cell addSubview:dcsw_custom];
                
                [dcsw_custom addTarget:self action:@selector(action_sw_Voluntary:) forControlEvents:UIControlEventValueChanged];
                
//                UISwitch *sw_tmp = (UISwitch *)[cell viewWithTag:2];
//                
//                if([dashboard.voluntary_anal_contraction isEqualToString:@"YES"]) [sw_tmp setOn:YES];
//                else [sw_tmp setOn:NO];
//                
//                [sw_tmp addTarget:self action:@selector(action_sw_Voluntary:) forControlEvents:UIControlEventValueChanged];
            }
            else if ([str_menuName isEqualToString:@"Anal sensation"]) {
                DCRoundSwitch *dcsw_custom = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
                [dcsw_custom setOffText:@"NO"];
                [dcsw_custom setOnText:@"YES"];
                
                if([dashboard.anal_sensation isEqualToString:@"YES"]) [dcsw_custom setOn:YES animated:NO ignoreControlEvents:YES];
                else [dcsw_custom setOn:NO animated:NO ignoreControlEvents:YES];
                
                [cell addSubview:dcsw_custom];
                
                [dcsw_custom addTarget:self action:@selector(action_sw_Anal:) forControlEvents:UIControlEventValueChanged];
//                UISwitch *sw_tmp = (UISwitch *)[cell viewWithTag:2];
//                
//                if([dashboard.anal_sensation isEqualToString:@"YES"]) [sw_tmp setOn:YES];
//                else [sw_tmp setOn:NO];
//                
//                [sw_tmp addTarget:self action:@selector(action_sw_Anal:) forControlEvents:UIControlEventValueChanged];
            }
            else if ([str_menuName isEqualToString:@"Complete or Incomplete"]) {
                DCRoundSwitch *dcsw_custom = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
                [dcsw_custom setOffText:@"NO"];
                [dcsw_custom setOnText:@"YES"];
                
                if([dashboard.complete_or_incomplete isEqualToString:@"YES"]) [dcsw_custom setOn:YES animated:NO ignoreControlEvents:YES];
                else [dcsw_custom setOn:NO animated:NO ignoreControlEvents:YES];
                
                [cell addSubview:dcsw_custom];
                
                [dcsw_custom addTarget:self action:@selector(action_sw_Complete:) forControlEvents:UIControlEventValueChanged];
//                UISwitch *sw_tmp = (UISwitch *)[cell viewWithTag:2];
//                
//                if([dashboard.complete_or_incomplete isEqualToString:@"YES"]) [sw_tmp setOn:YES];
//                else [sw_tmp setOn:NO];
//                
//                [sw_tmp addTarget:self action:@selector(action_sw_Complete:) forControlEvents:UIControlEventValueChanged];
            }
            else if ([str_menuName isEqualToString:@"Neurological level"]) {
                UIButton *btn_s_r = (UIButton *)[cell viewWithTag:2];
                UIButton *btn_s_l = (UIButton *)[cell viewWithTag:3];
                UIButton *btn_m_r = (UIButton *)[cell viewWithTag:4];
                UIButton *btn_m_l = (UIButton *)[cell viewWithTag:5];
                
                [btn_s_r setTitle:dashboard.n_sensory_r forState:UIControlStateNormal];
                [btn_s_l setTitle:dashboard.n_sensory_l forState:UIControlStateNormal];
                [btn_m_r setTitle:dashboard.n_motor_r forState:UIControlStateNormal];
                [btn_m_l setTitle:dashboard.n_motor_l forState:UIControlStateNormal];
                
                [btn_s_r addTarget:self action:@selector(action_btn_pressed:) forControlEvents:UIControlEventTouchUpInside];
                [btn_s_l addTarget:self action:@selector(action_btn_pressed:) forControlEvents:UIControlEventTouchUpInside];
                [btn_m_r addTarget:self action:@selector(action_btn_pressed:) forControlEvents:UIControlEventTouchUpInside];
                [btn_m_l addTarget:self action:@selector(action_btn_pressed:) forControlEvents:UIControlEventTouchUpInside];
                
            }
            else if ([str_menuName isEqualToString:@"Zone of partial preservation"]) {
                if([dashboard.asia_score isEqualToString:@"E"]) {
                    // If asia score is E, this field will be disabled.
                    cell.userInteractionEnabled = NO;
                }
                else {
                    UIButton *btn_s_r = (UIButton *)[cell viewWithTag:2];
                    UIButton *btn_s_l = (UIButton *)[cell viewWithTag:3];
                    UIButton *btn_m_r = (UIButton *)[cell viewWithTag:4];
                    UIButton *btn_m_l = (UIButton *)[cell viewWithTag:5];
                    
                    [btn_s_r setTitle:dashboard.z_sensory_r forState:UIControlStateNormal];
                    [btn_s_l setTitle:dashboard.z_sensory_l forState:UIControlStateNormal];
                    [btn_m_r setTitle:dashboard.z_motor_r forState:UIControlStateNormal];
                    [btn_m_l setTitle:dashboard.z_motor_l forState:UIControlStateNormal];
                    
                    [btn_s_r addTarget:self action:@selector(action_btn_zone_pressed:) forControlEvents:UIControlEventTouchUpInside];
                    [btn_s_l addTarget:self action:@selector(action_btn_zone_pressed:) forControlEvents:UIControlEventTouchUpInside];
                    [btn_m_r addTarget:self action:@selector(action_btn_zone_pressed:) forControlEvents:UIControlEventTouchUpInside];
                    [btn_m_l addTarget:self action:@selector(action_btn_zone_pressed:) forControlEvents:UIControlEventTouchUpInside];

                }
            }
            else if ([str_menuName isEqualToString:@"Send ASIA report"]) {
                
                UILabel *lb_detail = (UILabel *)[cell viewWithTag:5];
                
                NSMutableString *mStr_recipient = [[NSMutableString alloc] initWithString:@""];
                
                for(NSString *str_tmp in asiaSend.arr_toEmail) {
                    [mStr_recipient appendFormat:@"[%@] ", str_tmp];
                }
                for(NSString *str_tmp in asiaSend.arr_ccEmail) {
                    [mStr_recipient appendFormat:@"[%@] ", str_tmp];
                }
                lb_detail.text = mStr_recipient;

            }
            else {
                
            }
        }
        
    }
    else {
        //--- next & error ---//
        topObject = [[NSBundle mainBundle] loadNibNamed:@"Next" owner:self options:nil];
        cell = [topObject objectAtIndex:0];
    }
    
    return cell;
}

- (IBAction)action_btn_zone_pressed:(id)sender {
    
    OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
    NSMutableArray *component = [[NSMutableArray alloc] initWithObjects:
                                 @"C2", @"C3", @"C4", @"C5", @"C6",
                                 @"C7", @"C8", @"T1", @"T2", @"T3",
                                 @"T4", @"T5", @"T6", @"T7", @"T8",
                                 @"T9", @"T10", @"T11", @"T12", @"L1",
                                 @"L2", @"L3", @"L4", @"L5", @"S1",
                                 @"S2", @"S3", @"S45", nil];
    oneController.title = @"Neurological level";
    oneController.arr_component_0 = component;
    
    
    //--- set data array
    int i_tag = ((UIButton *)sender).tag;
    
    switch (i_tag) {
        case 2:
            [oneController setMode:@"z_sensory_r" object1:dashboard object2:nil indexpath:nil];
            break;
        case 3:
            [oneController setMode:@"z_sensory_l" object1:dashboard object2:nil indexpath:nil];
            break;
        case 4:
            [oneController setMode:@"z_motor_r" object1:dashboard object2:nil indexpath:nil];
            break;
        case 5:
            [oneController setMode:@"z_motor_l" object1:dashboard object2:nil indexpath:nil];
            break;
            
        default:
            break;
    }
    
    
    [self.navigationController pushViewController:oneController animated:YES];
}

- (IBAction)action_btn_pressed:(id)sender {

    OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
    NSMutableArray *component = [[NSMutableArray alloc] initWithObjects:
                                 @"C2", @"C3", @"C4", @"C5", @"C6",
                                 @"C7", @"C8", @"T1", @"T2", @"T3",
                                 @"T4", @"T5", @"T6", @"T7", @"T8",
                                 @"T9", @"T10", @"T11", @"T12", @"L1",
                                 @"L2", @"L3", @"L4", @"L5", @"S1",
                                 @"S2", @"S3", @"S45", nil];
    oneController.title = @"Neurological level";
    oneController.arr_component_0 = component;
    
    
    //--- set data array
    int i_tag = ((UIButton *)sender).tag;
    
    switch (i_tag) {
        case 2:
            [oneController setMode:@"n_sensory_r" object1:dashboard object2:nil indexpath:nil];
            break;
        case 3:
            [oneController setMode:@"n_sensory_l" object1:dashboard object2:nil indexpath:nil];
            break;
        case 4:
            [oneController setMode:@"n_motor_r" object1:dashboard object2:nil indexpath:nil];
            break;
        case 5:
            [oneController setMode:@"n_motor_l" object1:dashboard object2:nil indexpath:nil];
            break;
            
        default:
            break;
    }
    
    
    [self.navigationController pushViewController:oneController animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    if(indexPath.section == 0) {
        
        NSString *str_menu = [arr_menu objectAtIndex:indexPath.row];
        if([str_menu isEqualToString:@"Select Injury Type"]) {
            if([dashboard.neurologicallyintact isEqualToString:@"YES"]) {
                OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
                
                oneController.title = [arr_menu objectAtIndex:indexPath.row];
                        
                NSMutableArray *arr_tmp = [NSMutableArray arrayWithObjects:@"Spinal cord", @"Conus/Cauda equina (TBD)", @"Radiculopathy (TBD)", @"Brain (TBD)", nil];
                
                oneController.arr_component_0 = arr_tmp;
                [self.navigationController pushViewController:oneController animated:YES];
            }
            else {
                IntakeForm4InjuryTypeViewController *injuryController = [[IntakeForm4InjuryTypeViewController alloc] initWithNibName:@"IntakeForm4InjuryTypeViewController" bundle:nil];
                injuryController.title = [arr_menu objectAtIndex:indexPath.row];
                [self.navigationController pushViewController:injuryController animated:YES];
            }
        }
        else if([str_menu isEqualToString:@"Select Fracture Type"]) {

            if([dashboard.injurytype length] > 0) {
                //--- injury first ---//
                IntakeForm4FractureTypeViewController *fractureController = [[IntakeForm4FractureTypeViewController alloc] initWithNibName:@"IntakeForm4FractureTypeViewController" bundle:nil];
                fractureController.title = [arr_menu objectAtIndex:indexPath.row];
                [self.navigationController pushViewController:fractureController animated:YES];
            }
            
        }
//        else if([str_menu isEqualToString:@"Degrees Of Kyphosis"]) {
//            OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
//            
//            oneController.title = [arr_menu objectAtIndex:indexPath.row];
//            
//            NSMutableArray *arr_tmp = [NSMutableArray arrayWithObjects:@"0", @"1", nil];
//            NSMutableArray *arr_tmp1 = [NSMutableArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", nil];
//            NSMutableArray *arr_tmp2 = [NSMutableArray arrayWithObjects:@"0", @"1", nil];
//            oneController.arr_component_0 = arr_tmp;
//            [oneController setMode:@"triple" object1:arr_tmp1 object2:arr_tmp2 indexpath:nil];
//            [self.navigationController pushViewController:oneController animated:YES];
//            
//        }
//        else if([str_menu isEqualToString:@"Height Loss"]) {
//            OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
//            
//            oneController.title = [arr_menu objectAtIndex:indexPath.row];
//            
//            NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
//            NSString *str_tmp = nil;
//            for(int i = 0; i < 100; i++) {
//                str_tmp = [NSString stringWithFormat:@"%d", i];
//                [arr_tmp addObject:str_tmp];
//            }
//            
//            oneController.arr_component_0 = arr_tmp;
//            [self.navigationController pushViewController:oneController animated:YES];
//            
//        }
        else if([str_menu isEqualToString:@"TLIC Score"]) {
            TLICScoreViewController *tlicController = [storyboard instantiateViewControllerWithIdentifier:@"TLICScoreViewController"];
            
            [self.navigationController pushViewController:tlicController animated:YES];
        }
        else if([str_menu isEqualToString:@"Degrees Of Kyphosis"]) {
//            OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
//            
//            oneController.title = [arr_menu objectAtIndex:indexPath.row];
//            
//            NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
//            NSString *str_tmp = nil;
//            for(int i = 0; i < 156; i++) {
//                str_tmp = [NSString stringWithFormat:@"%d", i];
//                [arr_tmp addObject:str_tmp];
//            }
//            
//            oneController.arr_component_0 = arr_tmp;
//            [self.navigationController pushViewController:oneController animated:YES];
        }
        else if([str_menu isEqualToString:@"Translation"]) {
//            OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
//            
//            oneController.title = [arr_menu objectAtIndex:indexPath.row];
//            
//            NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
//            NSString *str_tmp = nil;
//            for(int i = 0; i < 358; i++) {
//                str_tmp = [NSString stringWithFormat:@"%d", i];
//                [arr_tmp addObject:str_tmp];
//            }
//            
//            oneController.arr_component_0 = arr_tmp;
//            [self.navigationController pushViewController:oneController animated:YES];
        }
        else if([str_menu isEqualToString:@"ASIA Score"]) {
            ModalPickerViewController *modalController = [[ModalPickerViewController alloc] initWithNibName:@"ModalPickerViewController" bundle:nil];
            modalController.delegate = self;
            NSMutableArray *arr_sources = [[NSMutableArray alloc] init];
            [arr_sources addObject:[NSMutableArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", nil]];
            modalController.arr_sources = arr_sources;
            NSString *str_title = @"ASIA Score";
            modalController.tag = str_title;
            [modalController setToolbarTitle:str_title];
            [self presentViewController:modalController animated:YES completion:nil];

//            OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
//            
//            oneController.title = [arr_menu objectAtIndex:indexPath.row];
//            
//            NSMutableArray *arr_tmp = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", nil];
//            
//            oneController.arr_component_0 = arr_tmp;
//            [self.navigationController pushViewController:oneController animated:YES];
        }
        else if([str_menu isEqualToString:@"Motor"]) {
            IntakeMotorViewController *motorController = [storyboard instantiateViewControllerWithIdentifier:@"IntakeMotorViewController"];
            motorController.title = [arr_menu objectAtIndex:indexPath.row];
            
            [self.navigationController pushViewController:motorController animated:YES];
            
        }
        else if([str_menu isEqualToString:@"Light Touch / Pin Prick"]) {
            LightTouchViewController *lightController = [[LightTouchViewController alloc] initWithNibName:@"LightTouchViewController" bundle:nil];
            lightController.title = [arr_menu objectAtIndex:indexPath.row];
            
            [self.navigationController pushViewController:lightController animated:YES];
        }
        else if([str_menu isEqualToString:@"Voluntary anal contraction"]) {
            
        }
        else if([str_menu isEqualToString:@"Anal sensation"]) {
            
        }
        else if([str_menu isEqualToString:@"Neurological level"]) {
            
        }
        else if([str_menu isEqualToString:@"Zone of partial preservation"]) {
            
        }
        else if([str_menu isEqualToString:@"Send ASIA report"]) {
            SendAsiaScoreViewController *sendController = [[SendAsiaScoreViewController alloc] initWithNibName:@"SendAsiaScoreViewController" bundle:nil];
            sendController.asiaSend = asiaSend;
            [self.navigationController pushViewController:sendController animated:YES];
        }

    }
    else {
        // next or error
        IntakeForm5ViewController *form5Controller = [storyboard instantiateViewControllerWithIdentifier:@"IntakeForm5ViewController"];
        [self.navigationController pushViewController:form5Controller animated:YES];
    }
    
    
    //    if(indexPath.section == 0 && indexPath.row == 0) {
    //
    //
    //    }
    //    else if(indexPath.section == 0 && indexPath.row == 1) {
    //        //--- Injury Type ---//
    //        IntakeForm4InjuryTypeViewController *injuryController = [[IntakeForm4InjuryTypeViewController alloc] initWithNibName:@"IntakeForm4InjuryTypeViewController" bundle:nil];
    //        [self.navigationController pushViewController:injuryController animated:YES];
    //    }
}

-(void)didFinishedModalPickerConfirmed:(NSMutableArray *)arr_selectedItems tag:(id)tag {
    //            [arr_menu0 addObject:@"Start/Time Date of Surgery"];
    //            [arr_menu0 addObject:@"End /Time Date of Surgery"];
    
    if([tag isEqualToString:@"ASIA Score"]) {
        dashboard.asia_score = [arr_selectedItems objectAtIndex:0];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Method

- (void)sel_degree:(id)sender {
    dashboard.degree_kyphosis = ((UITextField *)sender).text;
}

- (void)sel_heightLoss:(id)sender {
    dashboard.height_loss = ((UITextField *)sender).text;
}

- (void)sel_translation:(id)sender {
    dashboard.translation = ((UITextField *)sender).text;
}

- (void)action_sw_Voluntary:(id)sender {
    BOOL b_state = [sender isOn];
    if(b_state == YES) {
        dashboard.voluntary_anal_contraction = @"YES";
    }
    else {
        dashboard.voluntary_anal_contraction = @"NO";
    }
}

- (void)action_sw_Anal:(id)sender {
    BOOL b_state = [sender isOn];
    if(b_state == YES) {
        dashboard.anal_sensation = @"YES";
    }
    else {
        dashboard.anal_sensation = @"NO";
    }
}

- (void)action_sw_Complete:(id)sender {
    BOOL b_state = [sender isOn];
    if(b_state == YES) {
        dashboard.complete_or_incomplete = @"YES";
    }
    else {
        dashboard.complete_or_incomplete = @"NO";
    }
}


- (void)action_sw_intact:(id)sender {
    BOOL b_state = [sender isOn];
    if(b_state == YES) {
        dashboard.neurologicallyintact = @"YES";
    }
    else {
        dashboard.neurologicallyintact = @"NO";
    }
    
    //--- init value ---//
    dashboard.injurylevel = @"";
    dashboard.injurytype = @"";
    dashboard.fracturetype = @"";
    
    [self viewWillAppear:NO];
}

#pragma mark - custom method

- (void)saveCurrentScreenData {
    //--- this view already saved every data to dashboard object.
//    dashboard.occur_date = _lb_date.text;
//    dashboard.visit_type = _tf_visitType.text;
//    dashboard.billingcode = _tf_billingCode.text;
}
- (IBAction)save_local:(id)sender {
    [self saveCurrentScreenData];
    
    dashboard.status = @"Local";
    //    Clipboard *clip = [Clipboard sharedClipboard];
    //    [clip clipValue:dashboard clipKey:@"local_dashboard"];
    
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    // An asynchronous Core Data save method provided by the StackMob iOS SDK.
    
    [context saveOnSuccess:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    } onFailure:^(NSError *error) {
        NSLog(@"Error saving todo: %@", error);
    }];
    
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveLocalData" object:dashboard];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1) {
        // OK
        NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
        // An asynchronous Core Data save method provided by the StackMob iOS SDK.
        [context deleteObject:dashboard];
        [context saveOnSuccess:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } onFailure:^(NSError *error) {
            NSLog(@"Error saving todo: %@", error);
        }];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
}

- (IBAction)cancel_local:(id)sender {
    // delete
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Are you sure you want to delete the selected item?"
                                                   delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.delegate = self;
    [alert show];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end
