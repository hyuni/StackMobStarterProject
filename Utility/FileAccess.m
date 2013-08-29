//
//  FileAccess.m
//  mopia
//
//  Created by kakadais on 11. 11. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FileAccess.h"

@implementation FileAccess

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+(id)getFile:(NSString *)_fileName {
    //--- chat_data file name set
    //clipboard 에 올린다. (화면이 접힐 때 마다 파일에 저장해서 유지한다.)
    NSArray* path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentDirectory = [path objectAtIndex:0];
    NSString* fileName = [documentDirectory stringByAppendingFormat:@"/%@",_fileName];

    NSData* read_data = [[NSMutableData alloc] initWithContentsOfFile:fileName];
    if(read_data == nil) {
        NSMutableArray *arrTmp = [[NSMutableArray alloc] init];
        return arrTmp;
    }
        
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:read_data];
    
    id tmpId = [unarchiver decodeObjectForKey:_fileName];
    [unarchiver finishDecoding];
    
    return tmpId;
}

+(void)setFile:(NSString *)_fileName object:(id)_object {
    NSArray* path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentDirectory = [path objectAtIndex:0];
    NSString* fileName = [documentDirectory stringByAppendingFormat:@"/%@",_fileName];
    
    NSMutableData *data = [[NSMutableData alloc] init];
    
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:_object forKey:_fileName];
    [archiver finishEncoding];
    
    BOOL result = [data writeToFile:fileName atomically:YES];
    if(result != YES) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"알림" message:@"데이터 저장에 실패하였습니다. 고객센터에 문의해주세요."
                                                       delegate:self cancelButtonTitle:nil otherButtonTitles:@"확인", nil];
        
        [alert show];	
//        [alert release];
    }

//    //--- 없으면 만들고 로드 해서 clipboard에 올린다.
//    if([[NSMutableData alloc] initWithContentsOfFile:fileName] == nil) {
//        NSMutableData *data = [[NSMutableData alloc] init];
//        
//        
//        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//        
//        [archiver encodeObject:_object forKey:_fileName];
//        [archiver finishEncoding];
//        
//        [data writeToFile:fileName atomically:YES];
//        
//    }
}

@end
