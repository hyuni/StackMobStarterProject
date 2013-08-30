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
#import "Clipboard.h"
#import "NumberPadViewController.h"
#import "OnePickerViewController.h"
#import "TLICScoreViewController.h"


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
    
    arr_menu = [NSArray arrayWithObjects:@"Neurologically Intact", @"Select Injury Type", @"Select Fracture Type", nil];

        
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = (Dashboard *)[clip clipKey:@"create_intake"];
        
}


- (void)viewDidAppear:(BOOL)animated {
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
        //--- Menu cell ---//
        NSString *str_menuName = [arr_menu objectAtIndex:indexPath.row];
        if ([str_menuName isEqualToString:@"Neurologically Intact"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"Neurologically_Intact" owner:self options:nil];            
        }
        //--- If Neurologically intact == YES, then use specific Cell
        else if ([str_menuName isEqualToString:@"ASIA Score"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }
        else if ([str_menuName isEqualToString:@"Motor"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }
        else if ([str_menuName isEqualToString:@"Light Touch / Pin Prick"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }

        else if ([str_menuName isEqualToString:@"Voluntary anal contraction"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }

        else if ([str_menuName isEqualToString:@"Anal sensation"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }

        else if ([str_menuName isEqualToString:@"Neurological level"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }

        else if ([str_menuName isEqualToString:@"Zone of partial preservation"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        }

        else if ([str_menuName isEqualToString:@"Send ASIA report"]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
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
            UISwitch *sw_intact = (UISwitch *)[cell viewWithTag:2];
            
            if([dashboard.neurologicallyintact isEqualToString:@"YES"]) {
                [sw_intact setOn:YES];
            }
            else {
                [sw_intact setOn:NO];
            }
            
            [sw_intact addTarget:self action:@selector(action_sw_intact:) forControlEvents:UIControlEventValueChanged];
        }
        else {
            // every not intact
            UILabel *lb_right = (UILabel *)[cell viewWithTag:2];
            
            //--- intact == YES
            if ([str_menuName isEqualToString:@"ASIA Score"]) {
                
            }
            else if ([str_menuName isEqualToString:@"ASIA Score"]) {
                
            }
            else if ([str_menuName isEqualToString:@"ASIA Score"]) {
                
            }
            else if ([str_menuName isEqualToString:@"ASIA Score"]) {
                
            }
            else if ([str_menuName isEqualToString:@"ASIA Score"]) {
                
            }
            else if ([str_menuName isEqualToString:@"ASIA Score"]) {
                
            }
            else if ([str_menuName isEqualToString:@"ASIA Score"]) {
                
            }
            else if ([str_menuName isEqualToString:@"ASIA Score"]) {
                
            }
            //--- intact == NO
            else if([str_menuName isEqualToString:@"Select Injury Type"]) {
                if([dashboard.injurylevel length] > 0 && [dashboard.injurytype length] >0) {
                    NSString *str_rightValue = [NSString stringWithFormat:@"%@ L-%@", dashboard.injurytype, dashboard.injurylevel];
                    lb_right.text = str_rightValue;                    
                }
            }
            else if([str_menuName isEqualToString:@"Select Fracture Type"]){
                lb_right.text = dashboard.fracturetype;
            }
            else if ([str_menuName isEqualToString:@"Degrees Of Kyphosis"]){
                lb_right.text = dashboard.degree_kyphosis;
            }
            else if ([str_menuName isEqualToString:@"Height Loss"]){
                lb_right.text = dashboard.height_loss;
            }
            else if ([str_menuName isEqualToString:@"TLIC Score"]) {
                if(dashboard.fracture_morphology_type != nil && dashboard.neurologic_status != nil && dashboard.plc) {
                    int i_total = 0;
                    if(dashboard.fracture_morphology_type != nil) i_total += [dashboard.fracture_morphology_type intValue];
                    if(dashboard.neurologic_status != nil) i_total += [dashboard.neurologic_status intValue];
                    if(dashboard.plc != nil) i_total += [dashboard.plc intValue];
                    
                    lb_right.text = [NSString stringWithFormat:@"%d", i_total];
                }
            }
            else if ([str_menuName isEqualToString:@"Translation"]){
                lb_right.text = dashboard.degree_kyphosis;
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
            IntakeForm4InjuryTypeViewController *injuryController = [[IntakeForm4InjuryTypeViewController alloc] initWithNibName:@"IntakeForm4InjuryTypeViewController" bundle:nil];
            injuryController.title = [arr_menu objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:injuryController animated:YES];
        }
        else if([str_menu isEqualToString:@"Select Fracture Type"]) {

            if([dashboard.injurytype length] > 0) {
                //--- injury first ---//
                IntakeForm4FractureTypeViewController *fractureController = [[IntakeForm4FractureTypeViewController alloc] initWithNibName:@"IntakeForm4FractureTypeViewController" bundle:nil];
                fractureController.title = [arr_menu objectAtIndex:indexPath.row];
                [self.navigationController pushViewController:fractureController animated:YES];
            }
            
        }
        else if([str_menu isEqualToString:@"Degrees Of Kyphosis"]) {
            OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
            
            oneController.title = [arr_menu objectAtIndex:indexPath.row];
            
            NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
            NSString *str_tmp = nil;
            for(int i = 0; i < 181; i++) {
                str_tmp = [NSString stringWithFormat:@"%d", i];
                [arr_tmp addObject:str_tmp];
            }
            
            oneController.arr_component_0 = arr_tmp;
            [self.navigationController pushViewController:oneController animated:YES];
            
        }
        else if([str_menu isEqualToString:@"Height Loss"]) {
            OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
            
            oneController.title = [arr_menu objectAtIndex:indexPath.row];
            
            NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
            NSString *str_tmp = nil;
            for(int i = 0; i < 100; i++) {
                str_tmp = [NSString stringWithFormat:@"%d", i];
                [arr_tmp addObject:str_tmp];
            }
            
            oneController.arr_component_0 = arr_tmp;
            [self.navigationController pushViewController:oneController animated:YES];
            
        }
        else if([str_menu isEqualToString:@"TLIC Score"]) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
            
            TLICScoreViewController *tlicController = [storyboard instantiateViewControllerWithIdentifier:@"TLICScoreViewController"];
            
            [self.navigationController pushViewController:tlicController animated:YES];
        }
        else if([str_menu isEqualToString:@"Degrees Of Kyphosis"]) {
            OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
            
            oneController.title = [arr_menu objectAtIndex:indexPath.row];
            
            NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
            NSString *str_tmp = nil;
            for(int i = 0; i < 156; i++) {
                str_tmp = [NSString stringWithFormat:@"%d", i];
                [arr_tmp addObject:str_tmp];
            }
            
            oneController.arr_component_0 = arr_tmp;
            [self.navigationController pushViewController:oneController animated:YES];
        }
        else if([str_menu isEqualToString:@"Translation"]) {
            OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
            
            oneController.title = [arr_menu objectAtIndex:indexPath.row];
            
            NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
            NSString *str_tmp = nil;
            for(int i = 0; i < 358; i++) {
                str_tmp = [NSString stringWithFormat:@"%d", i];
                [arr_tmp addObject:str_tmp];
            }
            
            oneController.arr_component_0 = arr_tmp;
            [self.navigationController pushViewController:oneController animated:YES];
        }
    }
    else {
        // next or error
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    [self viewDidAppear:NO];
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
\


@end
