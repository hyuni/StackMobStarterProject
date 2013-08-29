//
//  CommonUtils.h
//  mopia
//
//  Created by jungwon jin kakadais on 12. 3. 26..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtils : NSObject
+ (NSMutableDictionary *)getFriendsInfoByManageId:(NSString *)str_manageId;
+ (UIButton *)profileImageSetting:(UIButton *)_btn_profile avata_key:(NSString *)_str_avataKey;
+ (void)setBackgroundImage:(UIView *)_view;
+ (CGSize)getLabelSize:(NSString *)_text targetWidth:(float)_width;
+ (NSString*) produceImageReference: (NSString*) imgFileName
                           withType: (NSString*) imgType;
+ (NSString *)makeHtmlString:(NSString *)_str_body;
+ (NSString *)changeEmoticonString:(NSString *) _str_input;
+ (NSString *)changeEmoticonImgString:(NSString *) _str_input;
+ (NSString *)changeToSpace:(NSString *) _str_input;

@end
