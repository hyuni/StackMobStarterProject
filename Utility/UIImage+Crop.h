//
//  UIImage+Crop.h
//  mopia
//
//  Created by jungwon jin kakadais on 12. 4. 27..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (Crop) 
    


- (UIImage *)crop:(CGRect)rect;
- (UIImage *)fixOrientation;

@end
