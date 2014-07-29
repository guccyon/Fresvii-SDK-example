//
//  FGCPush.m
//  AGEphoneOnFresvii
//
//  Created by tetsu@ageet.com on 2014/05/13.
//  Copyright (c) 2014年 tetsu@ageet.com. All rights reserved.
//

#import "FGCPush.h"
#import <Fresvii/FGCNotification.h>

@implementation FGCPush

+ (void)handleDidFinishLaunchingWithOptionsForRemoteNotification:(NSDictionary *)launchOptions
{
    if (launchOptions) {
        NSDictionary *userInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
        if (userInfo) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [FGCNotification handleDidReceiveRemoteNotification:userInfo];
            });
        }
    }
}

@end
