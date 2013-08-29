//
//  User.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/21/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SMUserManagedObject.h"


@interface User : SMUserManagedObject

@property (nonatomic, retain) NSDate * createddate;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSDate * lastmoddate;
@property (nonatomic, retain) NSString * origin_name;
@property (nonatomic, retain) NSString * usernameId;
@property (nonatomic, retain) NSString * username_id;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * userId;
@property (nonatomic, retain) NSString * user_id;

- (id)initNewUserInContext:(NSManagedObjectContext *)context;

@end
