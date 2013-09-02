//
//  CommonUtils.m
//  mopia
//
//  Created by jungwon jin kakadais on 12. 3. 26..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "CommonUtils.h"
#import "URL_DEFINE.h"
#import "Clipboard.h"

@implementation CommonUtils

+ (NSMutableDictionary *)getFriendsInfoByManageId:(NSString *)str_manageId {
    NSMutableArray *arr_tmpFriends = [[Clipboard sharedClipboard] clipKey:@"Friend"];
    
    for(int i = 0; i < [arr_tmpFriends count]; i++) {
        NSMutableDictionary *dic_friends = [arr_tmpFriends objectAtIndex:i];
        NSString *str_tmpManageId = [dic_friends objectForKey:@"user_friends_manage_id"];
        if([str_tmpManageId isEqualToString:str_manageId])
            return dic_friends;
    }
    return nil;
}

//+ (UIButton *)profileImageSetting:(UIButton *)_btn_profile avata_key:(NSString *)_str_avataKey {
//    
//    //--- profile image
//    NSString *str_avataKey = _str_avataKey;
//    if(str_avataKey != nil && [str_avataKey length] > 0) {
//        // 프로파일 이미지 이름이 있으면 이미지가 저장됏는지 확인
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) ;
//        NSString *imagePath = [paths objectAtIndex:0];
//        NSString *filepath = [NSString stringWithFormat:@"%@/%@", imagePath, str_avataKey];
//        
//        NSData *tmpData = [NSData dataWithContentsOfFile:filepath];
//        if(tmpData != nil && [tmpData length] > 0) {
//            // 저장돼 있으면 바로 꺼내서 보여줌
//            [_btn_profile setBackgroundImage:[UIImage imageWithData:tmpData] forState:UIControlStateNormal];
//            //            btn_profile_image.imageView.image = [UIImage imageWithData:tmpData];            
//        }
//        else {
//            // 없으면 다운로드 하고 보여줌
//            NSString *imagePath = [paths objectAtIndex:0];
//            NSString *filepath = [NSString stringWithFormat:@"%@/%@", imagePath, str_avataKey];
//            
//            NSString *urlString = [NSString stringWithFormat:@"%@%@", URL_ProfileImageThumnail, str_avataKey];
//            NSData *imageData = [[NSData alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]]];
//            
//            if(imageData.length > 200) {
//                //200byte 이하는 에러로 본다.
//                BOOL result = [imageData writeToFile:filepath atomically:YES];
//                if(result) {
//                    [_btn_profile setBackgroundImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
//                    //                btn_profile_image.imageView.image = nil;
//                    //                btn_profile_image.imageView.image = [UIImage imageWithData:tmpData]; 
//                }
//                else {
//                    //file 저장 실패. 디폴트 이미지.
//                    [_btn_profile setBackgroundImage:[UIImage imageNamed:@"i_box.png"] forState:UIControlStateNormal];
//                }
//            }
//            else {
//                //이미지 다운로드 실패. 디폴트 이미지. 
//                [_btn_profile setBackgroundImage:[UIImage imageNamed:@"i_box.png"] forState:UIControlStateNormal];
//            }
//        }
//    }
//    else {
//        //프로파일 이미지 이름이 없음. 디폴트 이미지.
//        [_btn_profile setBackgroundImage:[UIImage imageNamed:@"i_box.png"] forState:UIControlStateNormal];
//    }
//    
//    return _btn_profile;
//}

+ (NSString *)changeToSpace:(NSString *) _str_input {
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[01]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[02]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[03]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[04]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[05]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[06]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[07]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[08]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[09]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[10]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[11]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[12]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[13]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[14]" withString:@"__"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"[15]" withString:@"__"];
    
    return _str_input;
}

+ (NSString *) produceImageReference: (NSString*) imgFileName
                           withType: (NSString*) imgType
{
    NSMutableString* returnString = [[NSMutableString alloc] initWithCapacity: 100];
    NSString* filePath = [[NSBundle mainBundle] pathForResource: imgFileName ofType: imgType];
    
    if (filePath) {
        [returnString appendString: @"<img src=\"file://"];
        [returnString appendString: filePath];
        [returnString appendString: @"\" ALT=\""];
        [returnString appendString: imgFileName];
        [returnString appendString: @"\" width=19 height=18>"];
        return returnString;
    }
    
    else return @"";
}

+ (NSString *)makeHtmlString:(NSString *)_str_body {
    return [NSString stringWithFormat:@"<html> \n"
            "<head> \n"
            "<style type=\"text/css\"> \n"
            "body {font-family: \"%@\"; font-size: %@;}\n"
            "</style> \n"
            "</head> \n"
            "<body><div style=\"line-height:%@em\">%@</div></body> \n"
            "</html>"
            , @"Helvetica"
            , [NSNumber numberWithInt:15]
            , [NSNumber numberWithFloat:1.5]
            , _str_body];
}

//--- change chat emoticon message string
+ (NSString *)changeEmoticonString:(NSString *) _str_input {
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<웃음>" withString:@"[01]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<크하하>" withString:@"[02]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<삐질삐질>" withString:@"[03]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<메롱>" withString:@"[04]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<졸림>" withString:@"[05]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<아잉>" withString:@"[06]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<이리왓>" withString:@"[07]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<디졌어>" withString:@"[08]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<히잉>" withString:@"[09]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<오홋>" withString:@"[10]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<헬렐레>" withString:@"[11]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<오잉>" withString:@"[12]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<허걱>" withString:@"[13]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<부끄>" withString:@"[14]"];
    _str_input = [_str_input stringByReplacingOccurrencesOfString:@"<글썽>" withString:@"[15]"];    
    
    return _str_input;
}

+ (NSString *)changeEmoticonImgString:(NSString *) _str_input {
    NSString *str_before;
    NSString *str_after;

    for(int i = 1; i <= 15; i++) {
        str_before = [NSString stringWithFormat:@"[%.2d]", i];
        str_after = [NSString stringWithFormat:@"i%d", i];
        
        _str_input = [_str_input stringByReplacingOccurrencesOfString:str_before withString:[CommonUtils produceImageReference:str_after withType:@"png"]];
    }
    
    _str_input = [CommonUtils makeHtmlString:_str_input];
    
    return _str_input;
}

+ (CGSize)getLabelSize:(NSString *)_text targetWidth:(float)_width {
    CGSize returnSize;
    returnSize = [_text sizeWithFont:[UIFont fontWithName:@"Helvetica" size:17] constrainedToSize:CGSizeMake(_width, FLT_MAX) lineBreakMode:UILineBreakModeTailTruncation];
    
//    returnSize.height -= 20;    //fix height
    
    return returnSize;
}

+ (void)setBackgroundImage:(UIView *)_view {
    UIImageView *iv_background = (UIImageView *)[_view viewWithTag:1119];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dic_adBgInfo = [userDefaults objectForKey:@"my_adBgInfo"];
    
    //--- image load
    if(dic_adBgInfo != nil && [dic_adBgInfo count] > 0 && [[dic_adBgInfo objectForKey:@"ad_key"] length] > 0) {
        //--- exist
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) ;
        NSString *imagePath = [paths objectAtIndex:0] ;
        NSString *filename = [dic_adBgInfo objectForKey:@"ad_key"];
        NSString *filepath = [NSString stringWithFormat:@"%@/%@", imagePath, filename];
        
        NSData *tmpData = [NSData dataWithContentsOfFile:filepath];
        iv_background.image = [UIImage imageWithData:tmpData];        
    }
    else {
        //--- default
        iv_background.image = [UIImage imageNamed:@"back_bg.png"];
    }
    
}

@end
