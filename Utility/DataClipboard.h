//
//  DataClipboard.h
//  mopia
//
//  Created by kakadais on 11. 11. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataClipboard : NSObject<NSCoding> {

    NSMutableDictionary *dic;

}

+ (DataClipboard *)sharedClipboard;
- (void)clipValue:(id)_value clipKey:(NSString *)_key;
- (id)clipKey:(NSString *)_key;

@property (nonatomic, retain) NSMutableDictionary *dic;



@end
