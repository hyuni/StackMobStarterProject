//
//  LoginViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/15/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "MFSideMenuContainerViewController.h"
#import "User.h"
#import "StackMob.h"
#import "UserDoctor.h"
#import "Patient.h"
#import "Dashboard.h"
#import "KKDS_Preference.h"
#import "DCRoundSwitch.h"
#import "AsiaSendData.h"
#import "DataObject.h"




@interface LoginViewController ()

@end

@implementation LoginViewController

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
	// Do any additional setup after loading the view.
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBackground.png"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action_test:(id)sender {
//    NSString *test1 = @"yo";
//    NSString *test2 = @"yo";
//    NSString **test1 = &test2;
    
    
    
//    NSString *__strong *a;
//    NSString *b = @"b";
//    NSString *c = @"c";
//    a = &b;
//    *a = c;
//    
//    NSLog(@"%@",b);//I wanna see "c"
    
    
//    AsiaSendData *send = [[AsiaSendData alloc] init];
//    NSString *str_tmp = @"Not Changed!";
//    send.str_test = &str_tmp;
//    [self test:send.str_test];
//
//    NSLog(@"RESULT : %@", *send.str_test);
    
    
    
    AsiaSendData *send = [[AsiaSendData alloc] init];
    send.str_subject = @"Not Changed!";
    [self realTest:send.str_subject];
    
    NSLog(@"RESULT : %@", send.str_subject);

}


- (void)realTest:(NSString *)in_str {
    in_str = [in_str stringByReplacingCharactersInRange:NSRangeFromString(@"3") withString:@"333"];
    NSLog(@"in_str : %@", in_str);
//    in_str = @"Changed!";
    
//    NSString *__strong *tmp = &in_str;
//    *tmp = @"Changed!";
//    
//    
//    in_str = @"Changed!";
//    [(NSMutableString *)in_str setString:@"Changed!"];
}

- (void)test:(NSString *__strong *)in_str {
    
    *in_str = @"Changed!";
    
}

#pragma mark - Actions

- (IBAction)action_login:(id)sender {
    

    if(EXECUTE_MODE == EXECUTE_MODE_TEST) {
        [self action_login_success:nil];
    }
    else {
        [[SMClient defaultClient] loginWithUsername:_tf_username.text password:_tf_password.text onSuccess:^(NSDictionary *result){
            // result contains a dictionary representation of the user object
            NSLog(@"SUCCESS : %@", result);
            [self action_login_success:nil];
            
            /*
             2013-09-03 20:30:55.238 StackMobStarterProject[36989:11f03] SUCCESS : {
             createddate = 1377143973932;
             email = "kakadais@gmail.com";
             lastmoddate = 1377143973932;
             "sm_owner" = "user/kakadais";
             username = kakadais;
             }
             */
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setObject:result forKey:@"user_info"];
            [userDefault synchronize];
            
        } onFailure:^(NSError *error){
            // Error
            NSLog(@"Error : %@", error);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Login Failed. Invalid Username or Password."
                                                           delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
            [alert show];
        }];        
    }


}

- (IBAction)btn_createAccount:(id)sender {
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    User *newUser = [[User alloc] initNewUserInContext:context];
    [newUser setUsername:_tf_username.text];
    [newUser setPassword:_tf_password.text];
    
    [context saveOnSuccess:^{
        // Saved the user object
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"User Created"
													   delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		
		[alert show];
    } onFailure:^(NSError *error){
        // Error
    }];
    
}

-(IBAction)action_login_success:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
//    [[UIApplication sharedApplication] windows];
    

    //--- Make side menu view controller here ---//
    MFSideMenuContainerViewController *container = [[MFSideMenuContainerViewController alloc] init];

    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:@"realNavigationController"];
    UIViewController *leftSideMenuViewController = [storyboard instantiateViewControllerWithIdentifier:@"leftSideMenu2ViewController"];
//    UIViewController *dashboardController = [storyboard instantiateViewControllerWithIdentifier:@"dashboardController"];
    
    //--- don't use a right menu view ---//
//    UIViewController *rightSideMenuViewController = [storyboard instantiateViewControllerWithIdentifier:@"rightSideMenuViewController"];
    
    [container setLeftMenuViewController:leftSideMenuViewController];
//    [container setRightMenuViewController:rightSideMenuViewController];
    [container setCenterViewController:navigationController];
    
    [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBackground.png"] forBarMetrics:UIBarMetricsDefault];
    
    AppDelegate* myDelegate = (((AppDelegate*) [UIApplication sharedApplication].delegate));
    myDelegate.window.rootViewController = container;
    myDelegate.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
//    [self presentViewController:container animated:YES completion:nil];
}

- (IBAction)kayboard_down:(id)sender {
    [_tf_username resignFirstResponder];
    [_tf_password resignFirstResponder];
}
- (IBAction)password_down:(id)sender {
    [_tf_username resignFirstResponder];
    [_tf_password resignFirstResponder];
}

    

-(IBAction)action_selectUser:(id)sender {
    // Pull username from login screen text field, for example
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    NSString *username = @"kakadais";
    
    NSFetchRequest *userFetch = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    [userFetch setPredicate:[NSPredicate predicateWithFormat:@"username == %@", username]];

    
    [context executeFetchRequest:userFetch onSuccess:^(NSArray *results) {
        if ([results count] != 1) {
            // There should only be one result
        };
        
        User *currentUser = (User *)[results objectAtIndex:0];
        // Edit user object or store ID to pass around
        
    } onFailure:^(NSError *error) {
        
        //        [self.refreshControl endRefreshing];
        NSLog(@"An error %@, %@", error, [error userInfo]);
    }];
    
   
}

-(IBAction)action_createUser:(id)sender {
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    User *newUser = [[User alloc] initNewUserInContext:context];
    [newUser setUsername:@"kakadais"];
    [newUser setPassword:@"nicejin123"];
    [newUser setEmail:@"kakadais@gmail.com"];
    
    [context saveOnSuccess:^{
        // Saved the user object
    } onFailure:^(NSError *error){
        // Error
    }];
}

-(IBAction)action_test33:(id)sender {
    /*
     The first thing we do is acquire an initialized managed object context from our SMCoreDataStore instance.
     
     Then we create a fetch request for the Todo entity, sorted by the created date.
     
     Finally, we execute the fetch request, assign the results to our objects property, and reload the table data.
     */
    
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"UserDoctor"];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createddate" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    [context executeFetchRequest:fetchRequest onSuccess:^(NSArray *results) {
        NSLog(@"Data %@", results);
        UserDoctor *userDoctor = [results lastObject];
        
        NSLog(@"userdoctorId : %@", userDoctor.userdoctorId);
        NSLog(@"userid : %@", userDoctor.userid);
        NSLog(@"password : %@", userDoctor.password);
        NSLog(@"email : %@", userDoctor.email);
        
        
        
    } onFailure:^(NSError *error) {
        
        //        [self.refreshControl endRefreshing];
        NSLog(@"An error %@, %@", error, [error userInfo]);
    }];
}



-(IBAction)action_create:(id)sender {
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    
    UserDoctor *user = [NSEntityDescription insertNewObjectForEntityForName:@"UserDoctor" inManagedObjectContext:context];
    // assignObjectId is provided by the StackMob iOS SDK, and generates a random string ID for the object. This needs to be done for every new object before it is saved.
    user.userdoctorId = [user assignObjectId];
    user.userid = @"kakadais";
    user.password = @"Thflskf0";
    user.name = @"jungwon jin";
    user.email = @"kakadais@gmail.com";
    
    
    // An asynchronous Core Data save method provided by the StackMob iOS SDK.
    [context saveOnSuccess:^{
//        [self refreshTable];
    } onFailure:^(NSError *error) {
        NSLog(@"Error saving todo: %@", error);
    }];

    
}

-(IBAction)action_selectByQueryRestAPI:(id)sender {
    
    SMQuery *newQuery = [[SMQuery alloc] initWithSchema:@"UserDoctor"];
    [newQuery where:@"userid" isEqualTo:@"kakadais"];
    
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"UserDoctor"];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createddate" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];


    [[[SMClient defaultClient] dataStore] performQuery:newQuery onSuccess:^(NSArray *results) {

        NSDictionary *userDoctor = [results lastObject];
        
        
        int a =0;
//        NSLog(@"email : %@", userDoctor.email);
        
    } onFailure:^(NSError *error) {
        
    }];
}

- (IBAction)action_selectByQuery:(id)sender {
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"UserDoctor"];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createddate" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
    NSPredicate *equalPredicate = [NSPredicate predicateWithFormat:@"userid == %@", @"kakadais"];
    [fetchRequest setPredicate:equalPredicate];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    [context executeFetchRequest:fetchRequest onSuccess:^(NSArray *results) {
        NSLog(@"Data %@", results);
        UserDoctor *userDoctor = [results lastObject];
        
        NSLog(@"userdoctorId : %@", userDoctor.userdoctorId);
        NSLog(@"userid : %@", userDoctor.userid);
        NSLog(@"password : %@", userDoctor.password);
        NSLog(@"email : %@", userDoctor.email);

    } onFailure:^(NSError *error) {
        //        [self.refreshControl endRefreshing];
        NSLog(@"An error %@, %@", error, [error userInfo]);
    }];
}




- (IBAction)action_logoutToStackMob:(id)sender {
    
    [[SMClient defaultClient] logoutOnSuccess:^(NSDictionary *result){
        // Successful logout
        NSLog(@"SUCCESS : %@", result);
    } onFailure:^(NSError *error){
        // Error
    }];
}

- (IBAction)action_test1:(id)sender {
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    
    Dashboard *dashboard = [NSEntityDescription insertNewObjectForEntityForName:@"Dashboard" inManagedObjectContext:context];
    // assignObjectId is provided by the StackMob iOS SDK, and generates a random string ID for the object. This needs to be done for every new object before it is saved.
    
    dashboard.dashboard_id = [dashboard assignObjectId];
    dashboard.healthcard_number = @"";
    dashboard.status = @"";
    dashboard.visit_type = @"";
    dashboard.admitted = @"";
    dashboard.patient_status = @"";
    dashboard.diagnosis_details = @"2";
    dashboard.date_of_birth = @"today";

    dashboard.billingcode = @"";
    dashboard.trauma = @"";
    dashboard.neurologicallyintact = @"";
    dashboard.injurytype = @"";
    dashboard.injurylevel = @"";
    dashboard.fracturetype = @"";
    dashboard.degree_kyphosis = @"3";
    dashboard.height_loss = @"";
    dashboard.tlic_score = @"";
    dashboard.fracture_morphology_type = @"";
    dashboard.neurologic_status = @"";
    dashboard.plc = @"";
    dashboard.translation = @"";
    dashboard.asia_score = @"";
    dashboard.asia_motor_l = @"";
    dashboard.asia_motor_r = @"";
    dashboard.asia_lighttouch_l = @"4";
    dashboard.asia_lighttouch_r = @"";
    dashboard.asia_pinpric_l = @"";
    dashboard.asia_pinpric_r = @"";
    dashboard.voluntary_anal_contraction = @"";
    dashboard.anal_sensation = @"";
    dashboard.neurological_level = @"5";
    dashboard.n_sensory_r = @"";
    dashboard.n_sensory_l = @"";
    dashboard.n_motor_r = @"";
    dashboard.n_motor_l = @"";
    dashboard.zone_partial_preservation = @"";
    dashboard.z_sensory_r = @"6";
    dashboard.z_sensory_l = @"";
    dashboard.z_motor_r = @"";
    dashboard.z_motor_l = @"";


    //--- Save default test form
//    dashboard.dashboard_id = [dashboard assignObjectId];
//    dashboard.dashboard_id = @"";
//    dashboard.patient_index = @"";
//    dashboard.status = @"";
//    dashboard.visit_type = @"";
//    dashboard.admitted = @"";
//    dashboard.patient_status = @"";
//    dashboard.diagnosis_details = @"";
//    //    dashboard.birthday = @"";
//    dashboard.billingcode = @"";
//    dashboard.trauma = @"";
//    dashboard.neurologicallyintact = @"";
//    dashboard.injurytype = @"";
//    dashboard.injurylevel = @"";
//    dashboard.fracturetype = @"";
//    dashboard.degree_kyphosis = @"";
//    dashboard.height_loss = @"";
//    dashboard.tlic_score = @"";
//    dashboard.fracture_morphology_type = @"";
//    dashboard.neurologic_status = @"";
//    dashboard.plc = @"";
//    dashboard.translation = @"";
//    dashboard.asia_score = @"";
//    dashboard.asia_motor_l = @"";
//    dashboard.asia_motor_r = @"";
//    dashboard.asia_lighttouch_l = @"";
//    dashboard.asia_lighttouch_r = @"";
//    dashboard.asia_pinpric_l = @"";
//    dashboard.asia_pinpric_r = @"";
//    dashboard.voluntary_anal_contraction = @"";
//    dashboard.anal_sensation = @"";
//    dashboard.neurological_level = @"";
//    dashboard.n_sensory_r = @"";
//    dashboard.n_sensory_l = @"";
//    dashboard.n_motor_r = @"";
//    dashboard.n_motor_l = @"";
//    dashboard.zone_partial_preservation = @"";
//    dashboard.z_sensory_r = @"";
//    dashboard.z_sensory_l = @"";
//    dashboard.z_motor_r = @"";
//    dashboard.z_motor_l = @"";

    
    
    
    // An asynchronous Core Data save method provided by the StackMob iOS SDK.
    [context saveOnSuccess:^{
        //        [self refreshTable];
    } onFailure:^(NSError *error) {
        NSLog(@"Error saving todo: %@", error);
    }];
}

- (IBAction)action_select_dashboard:(id)sender {
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Dashboard"];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createddate" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
//    NSPredicate *equalPredicate = [NSPredicate predicateWithFormat:@"etc1 == %@", @"etc1"];
//    [fetchRequest setPredicate:equalPredicate];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    [context executeFetchRequest:fetchRequest onSuccess:^(NSArray *results) {
        NSLog(@"Data %@", results);
        Dashboard *ppp = [results objectAtIndex:0];
//        NSString *asdf = ppp.birthday;
        
//        UserDoctor *userDoctor = [results lastObject];
//        
//        NSLog(@"userdoctorId : %@", userDoctor.userdoctorId);
//        NSLog(@"userid : %@", userDoctor.userid);
//        NSLog(@"password : %@", userDoctor.password);
//        NSLog(@"email : %@", userDoctor.email);
        
    } onFailure:^(NSError *error) {
        //        [self.refreshControl endRefreshing];
        NSLog(@"An error %@, %@", error, [error userInfo]);
    }];
}

- (IBAction)action_saveCoreDataLocal:(id)sender {
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"StackMobStarterProject" withExtension:@"momd"];
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
//    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    
    Dashboard *dashboard = [NSEntityDescription insertNewObjectForEntityForName:@"Dashboard" inManagedObjectContext:context];
    // assignObjectId is provided by the StackMob iOS SDK, and generates a random string ID for the object. This needs to be done for every new object before it is saved.
    
    dashboard.tlic_score = @"tlic";
    dashboard.billingcode = @"bili";
    dashboard.trauma = @"tra";
    dashboard.neurologicallyintact = @"asdf";
    dashboard.injurytype = @"fads";
    dashboard.injurylevel = @"fdas";
    dashboard.fracturetype = @"asdf";
    dashboard.degree_kyphosis = @"34543";
    dashboard.height_loss = @"45h4h";
    dashboard.tlic_score = @"sdfht";
    dashboard.fracture_morphology_type = @"45h";
    dashboard.neurologic_status = @"hdf";
    dashboard.plc = @"hserh";
    dashboard.translation = @"ah43";
    dashboard.asia_score = @"aeh5";
    dashboard.asia_motor_l = @"su6j";
    dashboard.asia_motor_r = @"sj54";
    dashboard.asia_lighttouch_l = @"s45j4j";
    dashboard.asia_lighttouch_r = @"srtjtj";
    dashboard.asia_pinpric_l = @"srtjrtsj";
    dashboard.asia_pinpric_r = @"4haeh";
    dashboard.voluntary_anal_contraction = @"herh";
    dashboard.anal_sensation = @"aeh5hrth";
    dashboard.neurological_level = @"a3h3h53h4";
    dashboard.n_sensory_r = @"34g34grh";
    dashboard.n_sensory_l = @"sdgdsgfdghj";
    dashboard.n_motor_r = @"awg43herh";
    dashboard.n_motor_l = @"eah45h5h";
    dashboard.zone_partial_preservation = @"j45hrthrt";
    dashboard.z_sensory_r = @"h34erg";
    dashboard.z_sensory_l = @"aergaerh35";
    dashboard.z_motor_r = @"aerhaeheaherhaehaerh";
    dashboard.z_motor_l = @"aerh3h5haerhaehearharehreh";
    
    // An asynchronous Core Data save method provided by the StackMob iOS SDK.
//    [context saveOnSuccess:^{
//        //        [self refreshTable];
//    } onFailure:^(NSError *error) {
//        NSLog(@"Error saving todo: %@", error);
//    }];
//    
    
    NSError *error;
    if(![context save:&error]){
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
}

@end
