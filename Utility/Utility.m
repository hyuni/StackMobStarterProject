//
//  Utility.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (NSString *)dateToString:(NSDate *)date {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm:ss"];
    
    NSString *theDate = [dateFormat stringFromDate:date];
    //    NSString *theTime = [timeFormat stringFromDate:now];
    return theDate;
}

@end
