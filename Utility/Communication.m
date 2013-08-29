//
//  Communication.m
//  MobileOffice2.0
//
//  Created by nicejin on 11. 2. 23..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Communication.h"
#import "Base64.h"

#define debugmode 1

@implementation Communication
@synthesize delegate, str_url, arr_input, str_header, finalData, urlConnection, login_process, timer;

- (void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten 
totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    if([protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        return YES;
    }
    else if([protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodHTTPBasic])
    {
        return YES;
    }
    
    return NO;
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge: (NSURLAuthenticationChallenge *)challenge {
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
        [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
		
    }
    else if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodHTTPBasic])
    {
        NSURLCredential *credential = [[NSURLCredential alloc] initWithUser:@"user" password:@"pass" persistence:NSURLCredentialPersistenceForSession];
        [[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
//        [credential release];
    }
}


#pragma mark -
#pragma mark NSURLConnection delegate method

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[self.finalData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.timer invalidate];	
    
	NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	NSDictionary *fields = [httpResponse allHeaderFields];
	NSString *cookie = nil;
	cookie = [fields valueForKey:@"Set-Cookie"];
	
	if(cookie != nil) {
		Clipboard *clip = [Clipboard sharedClipboard];
		[clip clipValue:cookie clipKey:@"kakadais_cookie"];			
	}
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	// Do whatever you want here
	
	SBJSON *jsonParser = [SBJSON new];

	NSString *tmpStrData = [[NSString alloc] initWithData:self.finalData encoding:NSUTF8StringEncoding];
	
	
	id tmpID = [jsonParser objectWithString:tmpStrData error:NULL];
	NSDictionary *tmpDic = (NSDictionary *)tmpID;
//	[tmpStrData release];
//	[jsonParser release];
	
#ifdef debugmode
	NSLog(@"### Communication Receive data : %@", tmpDic);
#endif
    
	[delegate performSelector:@selector(didEndCommunication:requestDictionary:) withObject:tmpDic withObject:self.arr_input];
}

- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response {
	
	[delegate performSelector:@selector(willStartCommunication:requestDictionary:) withObject:nil withObject:self.arr_input];
	
	return request;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[delegate performSelector:@selector(didErrorCommunication:requestDictionary:) withObject:error withObject:self.arr_input];
}

// for URI encode
- (NSString *)component:(NSString *)component {   
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)component, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));

    //--- Correct because of the deprecated error. NOT TESTED. ---//
//    return (NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)component, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8);

}



- (BOOL)stringWithUrl:(NSURL *)url
{
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url
															  cachePolicy:NSURLRequestReturnCacheDataElseLoad
														  timeoutInterval:30];
	
	[urlRequest setHTTPMethod:@"POST"];
	
	
	//	[urlRequest setValue:self.str_header forHTTPHeaderField:@"MobileKate"];
	
	//	NSDictionary *bodyObject = [NSDictionary dictionaryWithObjectsAndKeys:@"eye",@"name",@"http://theeye.pe.kr", @"home", nil];
	
	
	//--- make string ---//
	NSMutableString *_bodyString = [[NSMutableString alloc] init];
	
	NSMutableDictionary *tmpDic = self.arr_input;
	
	NSArray *keyArr = [self.arr_input allKeys];
	
	int arr_count = [keyArr count];
	
	for(int i = 0; i < arr_count; i++) {
		
		//--- file path mode 일 때는 URI 인코딩 하지 않는다.
		[_bodyString appendFormat:@"%@=%@", [self component:[keyArr objectAtIndex:i]], [self component:[tmpDic objectForKey:[keyArr objectAtIndex:i]]]];
		//--- except last & char
		if((i + 1) < arr_count)
			[_bodyString appendString:@"&"];			
		
	}
	
#ifdef debugmode
	NSLog(@"######### Send String Data : %@", _bodyString);
#endif	
	
	//--- set cookie ---//
	Clipboard *clip = [Clipboard sharedClipboard];
	NSString *cookieFromClip = [clip clipKey:@"kakadais_cookie"];
	if(cookieFromClip != nil) {
		[urlRequest addValue:cookieFromClip forHTTPHeaderField:@"Cookie"];
		[urlRequest addValue:self.str_header forHTTPHeaderField:@"MobileKate"];
	}
	
	[urlRequest setHTTPBody:[_bodyString dataUsingEncoding:NSUTF8StringEncoding]];
//	[_bodyString release];
#ifdef debugmode
	NSLog(@"######### Send NSRequest Data : %@", urlRequest);
#endif	
	
	self.finalData = nil;
//	self.finalData = [[[NSMutableData alloc] init] autorelease];
//    xhReq.setRequestHeader("Content-length", params.length);
    [urlRequest addValue:@"10000000" forHTTPHeaderField:@"Content-length"];
	self.urlConnection = [NSURLConnection connectionWithRequest:urlRequest delegate:self];
	if(self.urlConnection == nil) {
		return NO;
	}
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(timeout:) userInfo:nil repeats:NO];
    
	return YES;
}

- (void)timeout:(NSTimer *)aTimer {
    if(self.urlConnection != nil)
        [self.urlConnection cancel];
    [self connection:nil didFailWithError:nil];
    [self.timer invalidate];
}

- (void)cancelCommunication {
    [self.timer invalidate];
    if(self.urlConnection != nil)
        [self.urlConnection cancel];
}

- (void)goCommunication:(NSMutableURLRequest *)_request {
	
	NSURLResponse *urlResponse = nil;
	NSError *error = nil;
	NSData *responseData = nil;
	
	responseData = [NSURLConnection sendSynchronousRequest:_request returningResponse:&urlResponse error:&error];
	if(responseData) {
		NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)urlResponse;
		NSDictionary *fields = [httpResponse allHeaderFields];
		NSString *cookie = nil;
		cookie = [fields valueForKey:@"Set-Cookie"];
		
		if(cookie != nil) {
			Clipboard *clip = [Clipboard sharedClipboard];
			[clip clipValue:cookie clipKey:@"kakadais_cookie"];			
		}		
	}
	else {
		if (error) {
			//			[self didErrorMainTread:error];
		}		
	}	
}

- (NSString *)getHeaderString {
	//--- make header string  ---//
	NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
	
	NSMutableString *mStr_header = [[NSMutableString alloc] init];
	NSString *tmpString;
	
	NSString *encryptString = [userDefault objectForKey:@"login_id"];
	NSData *tmpID = [Base64 decode:encryptString];
	NSString *str_ID = [[NSString alloc] initWithData:tmpID encoding:NSUTF8StringEncoding];
	
	
	tmpString = str_ID;
	if([tmpString length] > 0)
		[mStr_header appendFormat:@"%@|", tmpString];
	
	tmpString = [userDefault objectForKey:@"device_os"];
	if([tmpString length] > 0)
		[mStr_header appendFormat:@"%@|", tmpString];
	
	tmpString = [userDefault objectForKey:@"device_os_version"];
	if([tmpString length] > 0)
		[mStr_header appendFormat:@"%@|", tmpString];
	
	tmpString = [userDefault objectForKey:@"device_mac_address"];
	if([tmpString length] > 0)
		[mStr_header appendFormat:@"%@", tmpString];
	
	return (NSString *)mStr_header;
//	[mStr_header release];
//	[str_ID release];
}

- (BOOL) callWithArray:(NSMutableDictionary *)_arr serviceUrl:(NSString *)_url {
	
	self.str_header = [self getHeaderString];
#ifdef debugmode
	NSLog(@"########## Head String : %@", self.str_header);
#endif
	self.arr_input = _arr;
	
	BOOL rslt = [self stringWithUrl:[NSURL URLWithString:_url]];
	
	return rslt;
}
-(void)dealloc{
    
//	[str_url release];
//	[arr_input release];
//	[str_header release];
//	[finalData release]; 
//	[urlConnection release];
//[login_process release];
	
//	[super dealloc];
}


@end
