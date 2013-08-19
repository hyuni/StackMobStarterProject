//
//  TestObject.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/14/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TestObject : NSManagedObject

@property (nonatomic, retain) NSDate * createddate;
@property (nonatomic, retain) NSDate * lastmoddate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * testobjectId;

@end
