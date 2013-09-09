//
//  AsiaSendData.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/3/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsiaSendData : NSObject

@property (strong, nonatomic) NSMutableArray *arr_toEmail;
@property (strong, nonatomic) NSMutableArray *arr_ccEmail;
@property (strong, nonatomic) NSString *str_subject;
@property (strong, nonatomic) NSString *str_message;
@property (nonatomic) NSString *__strong *str_test;

@end
