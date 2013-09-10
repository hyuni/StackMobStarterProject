/**
 * Copyright 2012-2013 StackMob
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "AppDelegate.h"
/*
 Import the StackMob header.
 */
#import "StackMob.h"
#import "Clipboard.h"
#import "FileAccess.h"
#import "Dashboard.h"
#import <AddressBookUI/AddressBookUI.h>


@interface AppDelegate ()

/*
 We define the 2 main components of the StackMob iOS SDK:
 
 An SMClient instance is used as the outlet to every other SDK component we might use.
 An SMCoreDataStore instance initializes our custom Core Data stack and gets it ready for persistence. It will also be our outlet for interacting with the caching and syncing systems.
 */
@property (strong, nonatomic) SMClient *client;
@property (strong, nonatomic) SMCoreDataStore *coreDataStore;

@end

@implementation AppDelegate

@synthesize managedObjectModel = _managedObjectModel;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*
     Initialization of the StackMob components.
     
     We also turn on the caching system so fetched objects are stored locally and loading them into memory does not require additional network calls.
     */
    SM_CACHE_ENABLED = YES;
    self.client = [[SMClient alloc] initWithAPIVersion:@"0" publicKey:@"52f0d07b-03c1-44de-bd6b-90be6f1b2272"];
    self.coreDataStore = [self.client coreDataStoreWithManagedObjectModel:self.managedObjectModel];
   
    //--- Local Core Data ManagedObjectContext setting ---//
    Clipboard *clip = [Clipboard sharedClipboard];
    NSManagedObjectContext *localContext = [self _localManagedObjectContext];
    [clip clipValue:localContext clipKey:@"managaedObjectContext"];
    
//    [self syncStackMobData:nil];
//    [self saveStackMobData];
//    [self fetchStackMobData];
//    [self saveLocalCoreData];
//    [self fetchLocalCoreData];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(syncStackMobData:) name:@"syncStackMobData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveLocalData:) name:@"saveLocalData" object:nil];
    
    
    
    
//    NSString *a = @"aaa";
//    NSString *__strong *tmp;
//    tmp = &a;
//    
//    *tmp = @"bbb";
//    
//    NSLog(@"a : %@", a);
//    NSLog(@"tmp : %@", *tmp);
    
//    NSDate *first = nil;
//    
//    NSLog(@"### result before : %@", first.description);
//    
//    [self test:&first];
//    
//    
//    NSLog(@"### result after : %@", first.description);
    

    
    
    return YES;
}

- (void)test:(NSDate *__strong *)date_in {
    *date_in = [NSDate date];
}

- (void)saveLocalData:(id)sender {
    

    
    Clipboard *clip = [Clipboard sharedClipboard];
    Dashboard *i_dashboard = [clip clipKey:@"local_dashboard"];
    
    NSManagedObjectContext *localContext = [clip clipKey:@"managaedObjectContext"];

    Dashboard *dashboard = [NSEntityDescription insertNewObjectForEntityForName:@"Dashboard" inManagedObjectContext:localContext];
    
    dashboard.admit_to_hospital = i_dashboard.admit_to_hospital;
    dashboard.admitted = i_dashboard.admitted;
    dashboard.anal_sensation = i_dashboard.anal_sensation;
    dashboard.asia_lighttouch_l = i_dashboard.asia_lighttouch_l;
    dashboard.asia_lighttouch_l_subtotal = i_dashboard.asia_lighttouch_l_subtotal;
    dashboard.asia_lighttouch_r = i_dashboard.asia_lighttouch_r;
    dashboard.asia_lighttouch_r_subtotal = i_dashboard.asia_lighttouch_r_subtotal;
    dashboard.asia_lighttouch_total = i_dashboard.asia_lighttouch_total;
    dashboard.asia_motor_l = i_dashboard.asia_motor_l;
    dashboard.asia_motor_l_subtotal = i_dashboard.asia_motor_l_subtotal;
    dashboard.asia_motor_r = i_dashboard.asia_motor_r;
    dashboard.asia_motor_r_subtotal = i_dashboard.asia_motor_r_subtotal;
    dashboard.asia_motor_total = i_dashboard.asia_motor_total;
    dashboard.asia_pinpric_l = i_dashboard.asia_pinpric_l;
    dashboard.asia_pinpric_l_subtotal = i_dashboard.asia_pinpric_l_subtotal;
    dashboard.asia_pinpric_r = i_dashboard.asia_pinpric_r;
    dashboard.asia_pinpric_r_subtotal = i_dashboard.asia_pinpric_r_subtotal;
    dashboard.asia_pinpric_total = i_dashboard.asia_pinpric_total;
    dashboard.asia_score = i_dashboard.asia_score;
    dashboard.billingcode = i_dashboard.billingcode;
    dashboard.brace_required = i_dashboard.brace_required;
    dashboard.complete_or_incomplete = i_dashboard.complete_or_incomplete;
    dashboard.createddate = i_dashboard.createddate;
    dashboard.dashboard_id = i_dashboard.dashboard_id;
    dashboard.date_of_birth = i_dashboard.date_of_birth;
    dashboard.date_of_surgery = i_dashboard.date_of_surgery;
    dashboard.degree_kyphosis = i_dashboard.degree_kyphosis;
    dashboard.diagnosis_details = i_dashboard.diagnosis_details;
    dashboard.follow_up_required = i_dashboard.follow_up_required;
    dashboard.fracture_morphology_type = i_dashboard.fracture_morphology_type;
    dashboard.fracturetype = i_dashboard.fracturetype;
    dashboard.hangman = i_dashboard.hangman;
    dashboard.healthcard_number = i_dashboard.healthcard_number;
    dashboard.height_loss = i_dashboard.height_loss;
    dashboard.injurylevel = i_dashboard.injurylevel;
    dashboard.injurytype = i_dashboard.injurytype;
    dashboard.lastmoddate = i_dashboard.lastmoddate;
    dashboard.n_motor_l = i_dashboard.n_motor_l;
    dashboard.n_motor_r = i_dashboard.n_motor_r;
    dashboard.n_sensory_l = i_dashboard.n_sensory_l;
    dashboard.n_sensory_r = i_dashboard.n_sensory_r;
    dashboard.neurologic_status = i_dashboard.neurologic_status;
    dashboard.neurological_level = i_dashboard.neurological_level;
    dashboard.neurologicallyintact = i_dashboard.neurologicallyintact;
    dashboard.occur_date = i_dashboard.occur_date;
    dashboard.option2 = i_dashboard.option2;
    dashboard.patient_status = i_dashboard.patient_status;
    dashboard.plc = i_dashboard.plc;
    dashboard.status = i_dashboard.status;
    dashboard.surgery_required = i_dashboard.surgery_required;
    dashboard.surgical_billing_code = i_dashboard.surgical_billing_code;
    dashboard.tlic_score = i_dashboard.tlic_score;
    dashboard.translation = i_dashboard.translation;
    dashboard.trauma = i_dashboard.trauma;
    dashboard.visit_type = i_dashboard.visit_type;
    dashboard.voluntary_anal_contraction = i_dashboard.voluntary_anal_contraction;
    dashboard.z_motor_l = i_dashboard.z_motor_l;
    dashboard.z_motor_r = i_dashboard.z_motor_r;
    dashboard.z_sensory_l = i_dashboard.z_sensory_l;
    dashboard.z_sensory_r = i_dashboard.z_sensory_r;
    dashboard.zone_partial_preservation = i_dashboard.zone_partial_preservation;
    dashboard.tlic_score_total = i_dashboard.tlic_score_total;


    NSError *error;
    if(![localContext save:&error]){
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
}

- (void)syncStackMobData:(id)sender {
    // You'll need a block declared core data store instance
    __block SMCoreDataStore *blockCoreDataStore = self.coreDataStore;

    [self.client.session.networkMonitor setNetworkStatusChangeBlockWithCachePolicyReturn:^SMCachePolicy(SMNetworkStatus status) {

        if (status == SMNetworkStatusReachable) {
            // Initiate sync
            [blockCoreDataStore syncWithServer];
            return SMCachePolicyTryNetworkElseCache;
        } else {
            return SMCachePolicyTryCacheOnly;
        }
    }];
}

- (void)saveStackMobData {
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    
    Dashboard *dashboard = [NSEntityDescription insertNewObjectForEntityForName:@"Dashboard" inManagedObjectContext:context];
    // assignObjectId is provided by the StackMob iOS SDK, and generates a random string ID for the object. This needs to be done for every new object before it is saved.
    
    dashboard.dashboard_id = [dashboard assignObjectId];
    dashboard.healthcard_number = @"bool_test";
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
    
    
    // An asynchronous Core Data save method provided by the StackMob iOS SDK.
    [context saveOnSuccess:^{
        //        [self refreshTable];
    } onFailure:^(NSError *error) {
        NSLog(@"Error saving todo: %@", error);
    }];
}

- (void)fetchStackMobData {
    //--- StackMob Data Select ---//
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Dashboard"];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createddate" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
//    NSPredicate *equalPredicate = [NSPredicate predicateWithFormat:@"etc1 == %@", @"etc1"];
//    [fetchRequest setPredicate:equalPredicate];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    [context executeFetchRequest:fetchRequest onSuccess:^(NSArray *results) {
        NSLog(@"Data %@", results);
//        Dashboard *dash = [results objectAtIndex:0];
//        NSString *asdf = dash.z_sensory_r;
//        int a = 0;
        
//        [self saveStackMobDataToLocalCoreData:dash];
        
    } onFailure:^(NSError *error) {
        //        [self.refreshControl endRefreshing];
        NSLog(@"An error %@, %@", error, [error userInfo]);
    }];
}

- (void)saveStackMobDataToLocalCoreData:(id)object {
    Clipboard *clip = [Clipboard sharedClipboard];
    NSManagedObjectContext *localContext = [clip clipKey:@"managaedObjectContext"];
    

    NSError *error;
    if(![localContext save:&error]){
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

- (void)saveLocalCoreData:(id)sender {
    
    Clipboard *clip = [Clipboard sharedClipboard];
    NSManagedObjectContext *localContext = [clip clipKey:@"managaedObjectContext"];
    
    Dashboard *dashboard = [NSEntityDescription insertNewObjectForEntityForName:@"Dashboard" inManagedObjectContext:localContext];
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
    
    NSError *error;
    if(![localContext save:&error]){
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

- (void)fetchLocalCoreData {
    
    Clipboard *clip = [Clipboard sharedClipboard];
    NSManagedObjectContext *localContext = [clip clipKey:@"managaedObjectContext"];
    //--- Select LocalCoreData
    // Test listing all FailedBankInfos from the store
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dashboard"
                                              inManagedObjectContext:localContext];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *fetchedObjects = [localContext executeFetchRequest:fetchRequest error:&error];
    for (Dashboard *info in fetchedObjects) {
        NSLog(@"z_sensory_r: %@", info.z_sensory_r);
        //        FailedBankDetails *details = info.asia_lighttouch_r;
        //        NSLog(@"Zip: %@", details.zip);
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

/*
 Modified method to call StackMob saveAndWait: when application terminates.
 */
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext saveAndWait:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - StackMob Core Data stack

/*
 StackMob only needs the developer to initialize the managed object model. The persistent store coordinator and managed object context are initialized by the StackMob iOS SDK.
 
 Here we initialize the managed object model if it is nil.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"StackMobStarterProject" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}
#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)_localManagedObjectContext
{
    if (_localManagedObjectContext != nil) {
        return _localManagedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self _localPersistentStoreCoordinator];
    if (coordinator != nil) {
        _localManagedObjectContext = [[NSManagedObjectContext alloc] init];
        [_localManagedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _localManagedObjectContext;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)_localPersistentStoreCoordinator
{
    if (_localPersistentStoreCoordinator != nil) {
        return _localPersistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Followup.sqlite"];

    //--- Weird error check ??? ---//
//    if (![[NSFileManager defaultManager] fileExistsAtPath:[storeURL path]]) {
//        NSURL *preloadURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CoreDataTutorial2" ofType:@"sqlite"]];
//        
//        NSError* err = nil;
//        
//        if (![[NSFileManager defaultManager] copyItemAtURL:preloadURL toURL:storeURL error:&err]) {
//            NSLog(@"Oops, could copy preloaded data");
//        }
//    }
    
    NSError *error = nil;
    _localPersistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_localPersistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _localPersistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - Custom Method
- (void)saveData {
    Clipboard *clipboard = [Clipboard sharedClipboard];
    NSMutableArray *arr_chat = [clipboard clipKey:@"Chat"];
    NSMutableArray *arr_friend = [clipboard clipKey:@"Friend"];
    NSMutableArray *arr_friendSendInfo = [clipboard clipKey:@"FriendSendInfo"];
    NSMutableArray *arr_adBlInfo = [clipboard clipKey:@"AdBlInfo"];
    NSMutableArray *arr_adBgInfo = [clipboard clipKey:@"AdBgInfo"];
    
    [FileAccess setFile:@"Chat" object:arr_chat];
    [FileAccess setFile:@"Friend" object:arr_friend];
    [FileAccess setFile:@"FriendSendInfo" object:arr_friendSendInfo];
    [FileAccess setFile:@"AdBlInfo" object:arr_adBlInfo];
    [FileAccess setFile:@"AdBgInfo" object:arr_adBgInfo];
    
}

- (void)loadData {
    //--- data load
    NSMutableArray *arr_chat = [FileAccess getFile:@"Chat"];                //chat info
    NSMutableArray *arr_friend = [FileAccess getFile:@"Friend"];            //friends info
    NSMutableArray *arr_friendSendInfo = [FileAccess getFile:@"FriendSendInfo"];    //invite info
    NSMutableArray *arr_adBlInfo = [FileAccess getFile:@"AdBlInfo"];
    NSMutableArray *arr_adBgInfo = [FileAccess getFile:@"AdBgInfo"];
    
    Clipboard *clipboard = [Clipboard sharedClipboard];
    [clipboard clipValue:arr_chat clipKey:@"Chat"];
    [clipboard clipValue:arr_friend clipKey:@"Friend"];
    [clipboard clipValue:arr_friendSendInfo clipKey:@"FriendSendInfo"];
    [clipboard clipValue:arr_adBlInfo clipKey:@"AdBlInfo"];
    [clipboard clipValue:arr_adBgInfo clipKey:@"AdBgInfo"];
}

@end
