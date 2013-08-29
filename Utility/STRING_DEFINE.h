//
//  STRING_DEFINE.h
//  mopia
//
//  Created by Jungwon Jin on 12. 1. 29..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "Preference.h"

#ifndef mopia_STRING_DEFINE_h
#define mopia_STRING_DEFINE_h

//--- toktok
#if Version == Version_TokTok
//friends
#define df_noFriends @"톡톡 친구가 등록되지 않았습니다."
#define df_noFriends2 @"톡톡은 휴대폰에 있는 연락처를 자동으로 서버에 저장하거나 보관하지 않습니다. \n단, 통신을 위해 친구로 등록 완료된 연락처만 보관하고 있습니다. \n\n따라서, 친구등록이 자동으로 연결되지 않으며, 직접 초대를 하셔야 합니다. 초대 메뉴에서 친구 신청을 통해 같이 대화도 하시고 광고 적립금도 받아가세요.";
#define df_adfollow @" \"애드팔로워등록하기\" 기능을 이용하시면, 휴대폰 연락처를 톡톡 애드팔로워로 한번에 등록하실 수 있습니다. (이미등록된 연락처 또는 다른 회원이 먼저 추가 하신 연락처는 중복되거나 추가 등록되지 않습니다.) \n톡톡에서는 등록된 친구들의 이름과 전화번호에 대하여, 해당 당사자의 회원가입 전에는 일체의 활용도 하지 않으며, 어떠한 광고나 전화도 요청하지 않습니다. \n\n그리고, 등록된 애드팔로워가 톡톡 회원가입 또는 모바일앱을 설치하시면, 팔로워 관계가 자동으로 성립됩니다."

//chatting
#define df_defaultBanner @"b4_1.png"

//invite
//#define df_noInvite @"친구초대를 통해 친구에게 초대신청을 보내세요. \n톡톡은 휴대폰에 있는 연락처를 자동으로 서버에 저장하거나 보관하지 않습니다. \n따라서, 친구등록이 자동으로 연결되지 않으며, 직접 초대를 하셔야 합니다. \n친구 신청을 통해 무료 채팅도 하시고 광고 적립금도 받아가세요."
#define df_noInvite @"Try a new invited message to your friends. \nNeochat DO NOT save personal information into the device or server. \nSo, connecting friends service is not performed automatically. You can do it yourself. Try Free Invited Service, and you can take a advertise point."

//save
#define df_logo @"neochat_logo_t1.png"
#define df_noBg @"톡톡의 배경화면을 광고화면으로 변경하시면 적립금이 쌓여요!"
#define df_noPc @"톡톡은 안드로이드폰 및 아이폰에서 무료료 1:1 및 그룹 채팅을 할 수 있는 모바일 채팅앱 입니다. \n\n또한 앱을 사용하시는 동안 지속적인 광고수익금을 적립해주는 신개념 모바일 앱 광고 시스템을 제공하고 있습니다."

//preference
#define df_version @"ver.png"


//--- neochat & localhost
#else
//friends
#define df_noFriends @"네오챗 친구가 등록되지 않았습니다."
#define df_noFriends2 @"네오챗은 휴대폰에 있는 연락처를 자동으로 서버에 저장하거나 보관하지 않습니다. \n단, 통신을 위해 친구로 등록 완료된 연락처만 보관하고 있습니다. \n\n따라서, 친구등록이 자동으로 연결되지 않으며, 직접 초대를 하셔야 합니다. 초대 메뉴에서 친구 신청을 통해 같이 대화도 하시고 광고 적립금도 받아가세요.";
#define df_adfollow @" \"애드팔로워등록하기\" 기능을 이용하시면, 휴대폰 연락처를 네오 애드팔로워로 한번에 등록하실 수 있습니다. (이미등록된 연락처 또는 다른 회원이 먼저 추가 하신 연락처는 중복되거나 추가 등록되지 않습니다.) \n네오챗에서는 등록된 친구들의 이름과 전화번호에 대하여, 해당 당사자의 회원가입 전에는 일체의 활용도 하지 않으며, 어떠한 광고나 전화도 요청하지 않습니다. \n\n그리고, 등록된 애드팔로워가 네오챗 회원가입 또는 모바일앱을 설치하시면, 팔로워 관계가 자동으로 성립됩니다."

//chatting
#define df_defaultBanner @"b4_1.png"

//invite
#define df_noInvite @"Try a new invited message to your friends. \nNeochat DO NOT save personal information into the device or server. \nSo, connecting friends service is not performed automatically. You can do it yourself. Try Free Invited Service, and you can take a advertise point."

//save
#define df_logo @"neochat_logo_t1.png"
//#define df_noBg @"네오쳇의 배경화면을 광고화면으로 변경하시면 적립금이 쌓여요!"
#define df_noBg @"Try background advertise. You can get a point every time."
//#define df_noPc @"네오쳇은 안드로이드폰 및 아이폰에서 무료료 1:1 및 그룹 채팅을 할 수 있는 모바일 채팅앱 입니다. \n\n또한 앱을 사용하시는 동안 지속적인 광고수익금을 적립해주는 신개념 모바일 앱 광고 시스템을 제공하고 있습니다. \n                                     * 광고문의 : 070-4366-1919"
#define df_noPc @"Neochat is a free chatting service in the mobile environment. \n\nAnd you can get a advertise money point during use this application \n                                     * tel : 070-4366-1919"

//preference
#define df_version @"ver.png"



#endif



#endif
