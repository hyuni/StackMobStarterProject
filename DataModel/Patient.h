//
//  Patient.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/23/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Patient : NSManagedObject

@property (nonatomic, retain) NSString * patient_id;
@property (nonatomic, retain) NSString * etc1;
@property (nonatomic, retain) NSString * etc2;
@property (nonatomic, retain) NSString * etc3;
@property (nonatomic, retain) NSString * etc4;
@property (nonatomic, retain) NSDate * createddate;
@property (nonatomic, retain) NSDate * lastmoddate;

@end
