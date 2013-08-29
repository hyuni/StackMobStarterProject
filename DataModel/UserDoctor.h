//
//  UserDoctor.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/21/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserDoctor : NSManagedObject

@property (nonatomic, retain) NSDate * createddate;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * userid;
@property (nonatomic, retain) NSDate * lastmoddate;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * userdoctorId;

@end
