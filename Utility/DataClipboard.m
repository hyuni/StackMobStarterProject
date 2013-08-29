//
//  DataClipboard.m
//  mopia
//
//  Created by kakadais on 11. 11. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DataClipboard.h"

@implementation DataClipboard

@synthesize dic;	

+ (DataClipboard *)sharedClipboard {
	static DataClipboard *clipboard;
	
	@synchronized(self) {
		if(!clipboard) {
//            //--- chat_data file name set
//            NSArray* path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//            NSString* documentDirectory = [path objectAtIndex:0];
//            NSString* fileName = [documentDirectory stringByAppendingFormat:@"DataClipboard"];
//            //--- 없으면 만들어서 저장한다.
//            if([[NSMutableData alloc] initWithContentsOfFile:fileName] == nil) {
//                NSMutableArray *tmp_chat_data = [[NSMutableArray alloc] init];    
//                
//                NSMutableData *data = [[NSMutableData alloc] init];
//                
//                
//                NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//                
//                [archiver encodeObject:tmp_chat_data forKey:@"chat_data"];
//                [archiver finishEncoding];
//                
//                [data writeToFile:fileName atomically:YES];
//                
//            }
//            //clipboard 에 올린다. (화면이 접힐 때 마다 파일에 저장해서 유지한다.)
//            NSData* read_data = [[NSMutableData alloc] initWithContentsOfFile:fileName];
//            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:read_data];
//            
//            NSMutableArray *tmp_arr_chat = [unarchiver decodeObjectForKey:@"chat_data"];
//            [unarchiver finishDecoding];
//            
//            Clipboard *clipboard = [Clipboard sharedClipboard];
//            [clipboard clipValue:tmp_arr_chat clipKey:@"chat_data"];
//
            
			clipboard = [[DataClipboard alloc] init];
		}
	}
	return clipboard;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if(self=[super init]) {
        self.dic = [aDecoder decodeObjectForKey:@"dic"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.dic forKey:@"dic"];
}


- (void)clipValue:(id)_value clipKey:(NSString *)_key {
	[self.dic setObject:_value forKey:_key];	
}

- (id)clipKey:(NSString *)_key {
	return [self.dic objectForKey:_key];
}

- (id)init {
//	[super init];
	self.dic = [[NSMutableDictionary alloc] init];
	return self;
}	


@end
