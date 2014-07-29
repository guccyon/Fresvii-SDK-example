//
//  ViewController.m
//  Fresvii-SDK-example
//
//  Created by tetsu@fresvii.com on 29/7/14.
//  Copyright (c) 2014 tetsu@fresvii.com. All rights reserved.
//

#import "ViewController.h"
#import <Fresvii/FGCViewComponents.h>
#import <Fresvii/FGCAccount.h>
#import "FGCAutoLogin.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (![FGCAccount currentLoggedInUser].isExpiredSession) {
        [self showFresviiView];
    } else {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(showFresviiView)
                                                     name:kFGCLoginCompleted
                                                   object:nil];
    }
}

- (void) showFresviiView
{
    for (UIView *view in self.view.subviews) { [view removeFromSuperview]; }
    [FGCViewComponents presentTabBarControllerWithTarget:self animated:NO];
    
}

@end
