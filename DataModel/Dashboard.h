//
//  Dashboard.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/31/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Dashboard : NSManagedObject

@property (nonatomic, retain) NSString * admitted;
@property (nonatomic, retain) NSString * anal_sensation;
@property (nonatomic, retain) NSString * asia_lighttouch_l;
@property (nonatomic, retain) NSString * asia_lighttouch_l_subtotal;
@property (nonatomic, retain) NSString * asia_lighttouch_r;
@property (nonatomic, retain) NSString * asia_lighttouch_r_subtotal;
@property (nonatomic, retain) NSString * asia_lighttouch_total;
@property (nonatomic, retain) NSString * asia_motor_l;
@property (nonatomic, retain) NSString * asia_motor_l_subtotal;
@property (nonatomic, retain) NSString * asia_motor_r;
@property (nonatomic, retain) NSString * asia_motor_r_subtotal;
@property (nonatomic, retain) NSString * asia_motor_total;
@property (nonatomic, retain) NSString * asia_pinpric_l;
@property (nonatomic, retain) NSString * asia_pinpric_l_subtotal;
@property (nonatomic, retain) NSString * asia_pinpric_r;
@property (nonatomic, retain) NSString * asia_pinpric_r_subtotal;
@property (nonatomic, retain) NSString * asia_pinpric_total;
@property (nonatomic, retain) NSString * asia_score;
@property (nonatomic, retain) NSString * billingcode;
@property (nonatomic, retain) NSDate * createddate;
@property (nonatomic, retain) NSString * dashboard_id;
@property (nonatomic, retain) NSString * date_of_birth;
@property (nonatomic, retain) NSString * degree_kyphosis;
@property (nonatomic, retain) NSString * diagnosis_details;
@property (nonatomic, retain) NSString * fracture_morphology_type;
@property (nonatomic, retain) NSString * fracturetype;
@property (nonatomic, retain) NSString * hangman;
@property (nonatomic, retain) NSString * healthcard_number;
@property (nonatomic, retain) NSString * height_loss;
@property (nonatomic, retain) NSString * injurylevel;
@property (nonatomic, retain) NSString * injurytype;
@property (nonatomic, retain) NSDate * lastmoddate;
@property (nonatomic, retain) NSString * n_motor_l;
@property (nonatomic, retain) NSString * n_motor_r;
@property (nonatomic, retain) NSString * n_sensory_l;
@property (nonatomic, retain) NSString * n_sensory_r;
@property (nonatomic, retain) NSString * neurologic_status;
@property (nonatomic, retain) NSString * neurological_level;
@property (nonatomic, retain) NSString * neurologicallyintact;
@property (nonatomic, retain) NSString * patient_status;
@property (nonatomic, retain) NSString * plc;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * tlic_score;
@property (nonatomic, retain) NSString * translation;
@property (nonatomic, retain) NSString * trauma;
@property (nonatomic, retain) NSString * visit_type;
@property (nonatomic, retain) NSString * voluntary_anal_contraction;
@property (nonatomic, retain) NSString * z_motor_l;
@property (nonatomic, retain) NSString * z_motor_r;
@property (nonatomic, retain) NSString * z_sensory_l;
@property (nonatomic, retain) NSString * z_sensory_r;
@property (nonatomic, retain) NSString * zone_partial_preservation;
@property (nonatomic, retain) NSString * complete_or_incomplete;

@end
