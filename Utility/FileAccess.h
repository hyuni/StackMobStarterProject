//
//  FileAccess.h
//  mopia
//
//  Created by kakadais on 11. 11. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileAccess : NSObject {
    
}

+(id)getFile:(NSString *)_fileName;
+(void)setFile:(NSString *)_fileName object:(id)_object;

@end
