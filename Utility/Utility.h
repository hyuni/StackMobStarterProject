//
//  Utility.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (NSString *)dateToString:(NSDate *)date;
+ (NSString *)dateTimeToStringWithFormatHHmm:(NSDate *)date;
+ (NSString *)dateTimeToStringWithFormatHHmmss:(NSDate *)date;
+ (NSMutableArray *)getArrayDataFromStrong:(NSString *)str_data;
@end
