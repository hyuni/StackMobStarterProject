//
//  Dashboard.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/17/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "Dashboard.h"


@implementation Dashboard

@dynamic adj_imaging;
@dynamic adj_imaging_ct_3d;
@dynamic adj_imaging_fluroscopy;
@dynamic adj_imaging_none;
@dynamic adj_imaging_x_ray;
@dynamic adj_monitoring;
@dynamic adj_monitoring_emg;
@dynamic adj_monitoring_motor;
@dynamic adj_monitoring_non;
@dynamic adj_monitoring_sensory;
@dynamic adj_navigation;
@dynamic adjunctive_procedures;
@dynamic admission_date;
@dynamic admit_to_hospital;
@dynamic admitted;
@dynamic anal_sensation;
@dynamic asia_lighttouch_l;
@dynamic asia_lighttouch_l_subtotal;
@dynamic asia_lighttouch_r;
@dynamic asia_lighttouch_r_subtotal;
@dynamic asia_lighttouch_total;
@dynamic asia_motor_l;
@dynamic asia_motor_l_subtotal;
@dynamic asia_motor_r;
@dynamic asia_motor_r_subtotal;
@dynamic asia_motor_total;
@dynamic asia_pinpric_l;
@dynamic asia_pinpric_l_subtotal;
@dynamic asia_pinpric_r;
@dynamic asia_pinpric_r_subtotal;
@dynamic asia_pinpric_total;
@dynamic asia_score;
@dynamic aso_score;
@dynamic aug_kyp;
@dynamic aug_kyp_detail;
@dynamic aug_vert;
@dynamic aug_vert_detail;
@dynamic augmentation;
@dynamic billingcode;
@dynamic brace_required;
@dynamic complete_or_incomplete;
@dynamic createddate;
@dynamic dashboard_id;
@dynamic date_of_birth;
@dynamic date_of_surgery;
@dynamic decom_foraminotomy;
@dynamic decom_foraminotomy_detail;
@dynamic decom_laminectomy;
@dynamic decom_laminectomy_detail;
@dynamic decom_laminoplasty;
@dynamic decom_laminoplasty_detail;
@dynamic decom_laminotomy;
@dynamic decom_laminotomy_detail;
@dynamic decompression;
@dynamic degree_kyphosis;
@dynamic diagnosis_details;
@dynamic discharge_date;
@dynamic end_time_date_of_surgery;
@dynamic estimated_blood_loss;
@dynamic event_0;
@dynamic event_1;
@dynamic event_2;
@dynamic event_3;
@dynamic event_4;
@dynamic event_5;
@dynamic event_6;
@dynamic event_7;
@dynamic event_8;
@dynamic event_9;
@dynamic event_10;
@dynamic event_11;
@dynamic event_12;
@dynamic event_13;
@dynamic event_14;
@dynamic event_15;
@dynamic event_16;
@dynamic event_16_0;
@dynamic event_16_1;
@dynamic event_16_2;
@dynamic event_16_3;
@dynamic event_17;
@dynamic event_18;
@dynamic event_19;
@dynamic event_19_0;
@dynamic event_19_1;
@dynamic event_19_2;
@dynamic event_20;
@dynamic event_21;
@dynamic event_22;
@dynamic event_22_0;
@dynamic event_22_1;
@dynamic event_23;
@dynamic event_23_0;
@dynamic event_23_1;
@dynamic event_24;
@dynamic event_days;
@dynamic excision;
@dynamic excision_discectomy;
@dynamic excision_discectomy_detail;
@dynamic excision_removal_of_spinal;
@dynamic excision_removal_of_spinal_deta;
@dynamic excision_tumour;
@dynamic excision_tumour_int;
@dynamic excision_tumour_wide;
@dynamic exicsion_tumour_mar;
@dynamic flxation_arth;
@dynamic flxation_arth_detail;
@dynamic flxation_bone_graft;
@dynamic flxation_bone_graft_bool;
@dynamic flxation_bone_graft_other;
@dynamic flxation_cannulated;
@dynamic flxation_cannulated_detail;
@dynamic flxation_device_used;
@dynamic flxation_device_used_detail;
@dynamic flxation_fusion;
@dynamic flxation_fusion_detail;
@dynamic flxation_interbody;
@dynamic flxation_interbody_detail;
@dynamic flxation_interspinous;
@dynamic flxation_interspinous_detail;
@dynamic flxation_non;
@dynamic flxation_non_detail;
@dynamic flxation_other;
@dynamic flxation_other_detail;
@dynamic flxation_plate;
@dynamic flxation_plate_detail;
@dynamic flxation_rod;
@dynamic flxation_rod_detail;
@dynamic flxation_synthetic;
@dynamic flxation_synthetic_detail;
@dynamic follow_up_required;
@dynamic fracture_morphology_type;
@dynamic fracturetype;
@dynamic hangman;
@dynamic healthcard_number;
@dynamic height_loss;
@dynamic i_and_d;
@dynamic i_and_d_i_and_d;
@dynamic i_and_d_i_and_d_detail;
@dynamic injurylevel;
@dynamic injurytype;
@dynamic intra_0;
@dynamic intra_1;
@dynamic intra_2;
@dynamic intra_3;
@dynamic intra_4;
@dynamic intra_5;
@dynamic intra_6;
@dynamic intra_7;
@dynamic intra_8;
@dynamic intra_9;
@dynamic intra_10;
@dynamic intra_11;
@dynamic intra_12;
@dynamic intra_13;
@dynamic intra_14;
@dynamic intra_15;
@dynamic intra_bool_0;
@dynamic intra_bool_1;
@dynamic intra_bool_2;
@dynamic intra_bool_3;
@dynamic intra_bool_4;
@dynamic intra_bool_5;
@dynamic intra_bool_6;
@dynamic intra_bool_7;
@dynamic intra_bool_8;
@dynamic intra_bool_9;
@dynamic intra_bool_10;
@dynamic intra_bool_11;
@dynamic intra_bool_12;
@dynamic intra_bool_13;
@dynamic intra_bool_14;
@dynamic intra_bool_15;
@dynamic intra_operative_adverse_events;
@dynamic lastmoddate;
@dynamic n_motor_l;
@dynamic n_motor_r;
@dynamic n_sensory_l;
@dynamic n_sensory_r;
@dynamic neurologic_status;
@dynamic neurological_level;
@dynamic neurologicallyintact;
@dynamic occur_date;
@dynamic option2;
@dynamic ost_corp;
@dynamic ost_corp_detail;
@dynamic ost_ped;
@dynamic ost_ped_detail;
@dynamic ost_smith;
@dynamic ost_smith_detail;
@dynamic ost_vcr;
@dynamic ost_vcr_detail;
@dynamic osteotomy;
@dynamic oth_cord;
@dynamic oth_cord_drez;
@dynamic oth_cord_exploration;
@dynamic oth_cord_not;
@dynamic oth_cord_release;
@dynamic oth_cord_repair;
@dynamic oth_cord_rhizotomy;
@dynamic oth_drainage;
@dynamic oth_drainage_lumboperitoneal;
@dynamic oth_drainage_not;
@dynamic oth_drainage_syringoperitoneal;
@dynamic oth_pumps;
@dynamic oth_pumps_not;
@dynamic oth_pumps_replacement;
@dynamic oth_pumps_spinal;
@dynamic other_surgery;
@dynamic patient_admitted_to_icu;
@dynamic patient_discharged_to;
@dynamic patient_received_allogenic_blood;
@dynamic patient_status;
@dynamic patient_with_sci;
@dynamic plc;
@dynamic requires_step_down_bed;
@dynamic site_id;
@dynamic start_time_date_of_surgery;
@dynamic status;
@dynamic surgery_required;
@dynamic surgical_billing_code;
@dynamic time_from_spinal_cord_injury;
@dynamic tlic_score;
@dynamic tlic_score_total;
@dynamic translation;
@dynamic trauma;
@dynamic vertebral_surgery;
@dynamic visit_type;
@dynamic voluntary_anal_contraction;
@dynamic z_motor_l;
@dynamic z_motor_r;
@dynamic z_sensory_l;
@dynamic z_sensory_r;
@dynamic zone_partial_preservation;
@dynamic patient_discharged_to_other;

@end
