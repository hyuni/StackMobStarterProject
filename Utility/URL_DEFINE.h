//
//  URL_DEFINE.h
//  mopia
//
//  Created by kakadais on 11. 11. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Preference.h"

#ifndef mopia_URL_DEFINE_h
#define mopia_URL_DEFINE_h


//--- neochat
#if Version == Version_NeoChat
#define URL_Head @"http://1.234.82.89:8080" //2번서버
#define URL_WebRegister @"http://www.neochat.co.kr/mobile/app_join.php/"
#define URL_SavePointCheck @"http://www.neochat.co.kr/mobile/myinfo.php/"
#define URL_AdvertisePHP @"mobile/ad_view.php"
#define URL_ProfileImageOriginal URL_Head"/mgapps/profile_original/"
#define URL_ProfileImageThumnail URL_Head"/mgapps/profile_thumnail/"

//--- toktok
#elif Version == Version_TokTok
#define URL_Head @"http://1.234.2.238:8080" //3번서버
#define URL_WebRegister @"http://www.mopia.co.kr/mobile/app_join.php/"
#define URL_SavePointCheck @"http://www.mopia.co.kr/mobile/myinfo.php/"

//--- localhost
#elif Version == Version_LocalHost
#define URL_Head @"http://localhost:8080" //localhost
//#define URL_Head @"http://192.168.0.6:8080" //localhost
//#define URL_Head @"http://10.225.130.140:8080" //localhost
//#define URL_Head @"http://192.168.1.5:8080" //localhost
#define URL_WebRegister @"http://www.neochat.co.kr/mobile/app_join.php/"
#define URL_SavePointCheck @"http://www.neochat.co.kr/mobile/myinfo.php/"
#define URL_AdvertisePHP @"mobile/ad_view.php"
#define URL_ProfileImageOriginal URL_Head"/MOPIA/mgapps/profile_original/"
#define URL_ProfileImageThumnail URL_Head"/MOPIA/mgapps/profile_thumnail/"


//--- test server
#elif Version == Version_TestServer
#define URL_Head @"http://114.207.244.28:8080" //1번서버
#define URL_WebRegister @"http://www.neochat.co.kr/mobile/app_join.php/"
#define URL_SavePointCheck @"http://www.neochat.co.kr/mobile/myinfo.php/"
#define URL_AdvertisePHP @"mobile/ad_view.php"
#define URL_ProfileImageOriginal URL_Head"/mgapps/profile_original/"
#define URL_ProfileImageThumnail URL_Head"/mgapps/profile_thumnail/"


#endif

#define URL_MobileAdPaper @"http://neochat.co.kr/mobile/ad_main.php"    //모바일 전단지 (+ / id / pw)


//--- 세부 url은 서버가 동일하게 간다.
// chat
#define URL_ChatSendMessage             URL_Head"/MOPIA/chat/ChatController/ChatSendMessage.do"
#define URL_ChatCreate                  URL_Head"/MOPIA/chat/ChatController/ChatCreate.do"
#define URL_ChatReceiveMessage          URL_Head"/MOPIA/chat/ChatController/ChatReceiveMessage.do"
#define URL_ChatAddUser                 URL_Head"/MOPIA/chat/ChatController/ChatAddUser.do"
#define URL_ChatExitUser                URL_Head"/MOPIA/chat/ChatController/ChatExitUser.do"

// user
#define URL_UserFriendsList             URL_Head"/MOPIA/user/UserController/UserFriendsList.do"
#define URL_UserLoginAgree              URL_Head"/MOPIA/user/UserController/UserLoginAgree.do"
#define URL_UserLoginExistPhoneNum      URL_Head"/MOPIA/user/UserController/UserLoginExistPhoneNumber.do"
#define URL_UserIdPwLogin               URL_Head"/MOPIA/user/UserController/UserIdPwLogin.do"
#define URL_UserLoginRequest            URL_Head"/MOPIA/user/UserController/UserLoginRequest.do"
#define URL_UserAddFriends              URL_Head"/MOPIA/user/UserController/UserAddFriends.do"
#define URL_UserConfirmAddUser          URL_Head"/MOPIA/user/UserController/UserConfirmAddUser.do"
#define URL_UserUpdateMacAddress        URL_Head"/MOPIA/user/UserController/UserUpdateMacAddress.do"
#define URL_UserCertificateRequest      URL_Head"/MOPIA/user/UserController/UserCertificateRequest.do"
#define URL_UserAddBanFriends           URL_Head"/MOPIA/user/UserController/UserAddBanFriends.do"
#define URL_UserRemoveBanFriends        URL_Head"/MOPIA/user/UserController/UserRemoveBanFriends.do"
#define URL_UserFriendsNickNameChange   URL_Head"/MOPIA/user/UserController/UserFriendsNickNameChange.do"
#define URL_UserInfoChange              URL_Head"/MOPIA/user/UserController/UserInfoChange.do"
#define URL_UserUpdateAppId             URL_Head"/MOPIA/user/UserController/UserUpdateAppId.do"

#define URL_SendAdFollowerList          URL_Head"/MOPIA/user/UserController/SendAdFollowerList.do"
#define URL_GetVersion                  URL_Head"/MOPIA/user/UserController/GetVersion.do"

#define URL_SmsMessage                  URL_Head"/MOPIA/user/UserController/SmsMessage.do"
#define URL_QnaBoard                    URL_Head"/MOPIA/user/UserController/QnaBoard.do"
#define URL_NoticeBoard                 URL_Head"/MOPIA/user/UserController/NoticeBoard.do"

#define URL_SendProfileImage            URL_Head"/MOPIA/user/UserController/SendProfileImage.do"
#define URL_RemoveProfileImage          URL_Head"/MOPIA/user/UserController/RemoveProfileImage.do"
// advertisement
#define URL_AdBlList                    URL_Head"/MOPIA/advertise/AdvertiseController/AdBlList.do"
#define URL_AdBlInfo                    URL_Head"/MOPIA/advertise/AdvertiseController/AdBlInfo.do"
#define URL_AdBlSelect                  URL_Head"/MOPIA/advertise/AdvertiseController/AdBlSelect.do"
#define URL_AdBgSelect                  URL_Head"/MOPIA/advertise/AdvertiseController/AdBgSelect.do"

#define URL_AdBgList                    URL_Head"/MOPIA/advertise/AdvertiseController/AdBgList.do"
#define URL_AdBgLogUpdate           	URL_Head"/MOPIA/advertise/AdvertiseController/AdBgLogUpdate.do"

#define URL_AdPcSellerList              URL_Head"/MOPIA/advertise/AdvertiseController/AdPcSellerList.do"
#define URL_AdPcUserCount               URL_Head"/MOPIA/advertise/AdvertiseController/AdPcUserCount.do"
#define URL_AdPcRequest                 URL_Head"/MOPIA/advertise/AdvertiseController/AdPcRequest.do"
#define URL_AdPcClicked                 URL_Head"/MOPIA/advertise/AdvertiseController/AdPcClicked.do"
#define URL_AdPcSellerChat              URL_Head"/MOPIA/advertise/AdvertiseController/AdPcSellerChat.do"

#define URL_AdSavePoint                 URL_Head"/MOPIA/advertise/AdvertiseController/AdCurrentSavePoint.do"


#endif
