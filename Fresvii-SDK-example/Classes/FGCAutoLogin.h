//
//  FGCAutoLogin.h
//  AGEphoneOnFresvii
//
//  Created by tetsu@ageet.com on 2014/04/18.
//  Copyright (c) 2014年 tetsu@ageet.com. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const kFGCLoginCompleted;

@interface FGCAutoLogin : NSObject

+(void) loginIfNeeded;

@end
