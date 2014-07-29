//
//  FGCAutoLogin.m
//  AGEphoneOnFresvii
//
//  Created by tetsu@ageet.com on 2014/04/18.
//  Copyright (c) 2014年 tetsu@ageet.com. All rights reserved.
//

#import "FGCAutoLogin.h"

#import <Fresvii/FGCAccount.h>

NSString* const kFGCLoginCompleted = @"kFGCLoginCompleted";

@implementation FGCAutoLogin

+(void) loginIfNeeded
{
    if (![FGCAccount currentLoggedInUser].isSignedUp) {
        [[self new] signup];
    } else if([FGCAccount currentLoggedInUser].isExpiredSession) {
        [[self new] login];
    }
}

-(void) signup
{
    [FGCAccount signUpUserWithName:[NSString stringWithFormat:@"Anonymous%u", (unsigned)[[NSDate date] timeIntervalSince1970]]
                        completion:^(FGCLoginUser *loginUser, NSError *error){
        if (error) {
            NSLog(@"%@", error);
        } else {
            [self login];
        }
    }];
}

-(void) login
{
    [FGCAccount loginUserWithCompletion:^(FGCLoginUser *loginUser, NSError *error){
        if (error) {
            NSLog(@"%@", error);
        } else {
            [[NSNotificationCenter defaultCenter] postNotificationName:kFGCLoginCompleted object:nil];
        }
    }];
}
@end
