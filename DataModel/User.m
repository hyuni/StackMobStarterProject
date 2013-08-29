//
//  User.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/21/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "User.h"


@implementation User

@dynamic createddate;
@dynamic email;
@dynamic lastmoddate;
@dynamic origin_name;
@dynamic usernameId;
@dynamic username_id;
@dynamic username;
@dynamic userId;
@dynamic user_id;

- (id)initNewUserInContext:(NSManagedObjectContext *)context {
    
    self = [super initWithEntityName:@"User" insertIntoManagedObjectContext:context];
    
    if (self) {
        // assign local variables, etc.
    }
    
    return self;
}

@end
