//
//  Utility.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (NSMutableArray *)getArrayDataFromStrong:(NSString *)str_data {
    
    NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
    NSRange range = NSRangeFromString(str_data);
    for (int i = 0; i < 12; i++) {
        range.location = i;
        range.length = 1;
        [arr_tmp addObject:[str_data substringWithRange:range]];
    }
    
    range.location = 12;
    range.length = 3;
    [arr_tmp addObject:[str_data substringWithRange:range]];
    
    range.location = 15;
    range.length = 3;
    [arr_tmp addObject:[str_data substringWithRange:range]];
    
    return arr_tmp;
}


+ (NSString *)dateToString:(NSDate *)date {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm:ss"];

    NSString *theDate = [dateFormat stringFromDate:date];

    return theDate;
}

+ (NSString *)dateTimeToStringWithFormatHHmmss:(NSDate *)date {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *theDate = [dateFormat stringFromDate:date];
    
    return theDate;
}

+ (NSString *)dateTimeToStringWithFormatHHmm:(NSDate *)date {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSString *theDate = [dateFormat stringFromDate:date];
    
    return theDate;
}

@end
