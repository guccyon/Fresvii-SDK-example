//
//  AppDelegate+Fresvii.m
//  AGEphoneOnFresvii
//
//  Created by tetsu@fresvii.com on 18/4/14.
//  Copyright (c) 2014 tetsu@ageet.com. All rights reserved.
//

#import "AppDelegate+Fresvii.h"
#import <Fresvii/FGCNotification.h>
#import <Fresvii/FGCAccount.h>
#import "FGCPush.h"

@implementation AppDelegate (Fresvii)

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [Fresvii handleDidBecomeActive];
    
    [FGCAutoLogin loginIfNeeded];
    
    [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge|
                                                     UIRemoteNotificationTypeSound|
                                                     UIRemoteNotificationTypeAlert)];
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [FGCNotification addDeviceToken:deviceToken completion:nil];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [FGCNotification handleDidReceiveRemoteNotification:userInfo];
}

@end

