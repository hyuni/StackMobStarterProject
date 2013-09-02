//
//  Dashboard.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/2/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Dashboard : NSManagedObject

@property (nonatomic, retain) NSString * admission_date;
@property (nonatomic, retain) NSString * admit_to_hospital;
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
@property (nonatomic, retain) NSString * brace_required;
@property (nonatomic, retain) NSString * complete_or_incomplete;
@property (nonatomic, retain) NSDate * createddate;
@property (nonatomic, retain) NSString * dashboard_id;
@property (nonatomic, retain) NSString * date_of_birth;
@property (nonatomic, retain) NSString * date_of_surgery;
@property (nonatomic, retain) NSString * degree_kyphosis;
@property (nonatomic, retain) NSString * diagnosis_details;
@property (nonatomic, retain) NSString * discharge_date;
@property (nonatomic, retain) NSString * event_0;
@property (nonatomic, retain) NSString * event_1;
@property (nonatomic, retain) NSString * event_2;
@property (nonatomic, retain) NSString * event_3;
@property (nonatomic, retain) NSString * event_4;
@property (nonatomic, retain) NSString * event_5;
@property (nonatomic, retain) NSString * event_6;
@property (nonatomic, retain) NSString * event_7;
@property (nonatomic, retain) NSString * event_8;
@property (nonatomic, retain) NSString * event_9;
@property (nonatomic, retain) NSString * event_10;
@property (nonatomic, retain) NSString * event_11;
@property (nonatomic, retain) NSString * event_12;
@property (nonatomic, retain) NSString * event_13;
@property (nonatomic, retain) NSString * event_14;
@property (nonatomic, retain) NSString * event_15;
@property (nonatomic, retain) NSString * event_16;
@property (nonatomic, retain) NSString * event_17;
@property (nonatomic, retain) NSString * event_18;
@property (nonatomic, retain) NSString * event_19;
@property (nonatomic, retain) NSString * event_20;
@property (nonatomic, retain) NSString * event_21;
@property (nonatomic, retain) NSString * event_22;
@property (nonatomic, retain) NSString * event_23;
@property (nonatomic, retain) NSString * event_24;
@property (nonatomic, retain) NSString * event_days;
@property (nonatomic, retain) NSString * follow_up_required;
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
@property (nonatomic, retain) NSString * occur_date;
@property (nonatomic, retain) NSString * option2;
@property (nonatomic, retain) NSString * patient_admitted_to_icu;
@property (nonatomic, retain) NSString * patient_discharged_to;
@property (nonatomic, retain) NSString * patient_received_allogenic_blood;
@property (nonatomic, retain) NSString * patient_status;
@property (nonatomic, retain) NSString * plc;
@property (nonatomic, retain) NSString * requires_step_down_bed;
@property (nonatomic, retain) NSString * site_id;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * surgery_required;
@property (nonatomic, retain) NSString * surgical_billing_code;
@property (nonatomic, retain) NSString * tlic_score;
@property (nonatomic, retain) NSString * tlic_score_total;
@property (nonatomic, retain) NSString * translation;
@property (nonatomic, retain) NSString * trauma;
@property (nonatomic, retain) NSString * visit_type;
@property (nonatomic, retain) NSString * voluntary_anal_contraction;
@property (nonatomic, retain) NSString * z_motor_l;
@property (nonatomic, retain) NSString * z_motor_r;
@property (nonatomic, retain) NSString * z_sensory_l;
@property (nonatomic, retain) NSString * z_sensory_r;
@property (nonatomic, retain) NSString * zone_partial_preservation;
@property (nonatomic, retain) NSString * event_16_0;
@property (nonatomic, retain) NSString * event_16_1;
@property (nonatomic, retain) NSString * event_16_2;
@property (nonatomic, retain) NSString * event_16_3;
@property (nonatomic, retain) NSString * event_19_0;
@property (nonatomic, retain) NSString * event_19_1;
@property (nonatomic, retain) NSString * event_19_2;
@property (nonatomic, retain) NSString * event_22_0;
@property (nonatomic, retain) NSString * event_22_1;
@property (nonatomic, retain) NSString * event_23_0;
@property (nonatomic, retain) NSString * event_23_1;

@end
