//
//  FGCPush.h
//  AGEphoneOnFresvii
//
//  Created by tetsu@ageet.com on 2014/05/13.
//  Copyright (c) 2014年 tetsu@ageet.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGCPush : NSObject

+ (void)handleDidFinishLaunchingWithOptionsForRemoteNotification:(NSDictionary *)launchOptions;

@end
