//
//  ConnectionToAppDelegate.m
//  PruebaUnity
//
//  Created by Diego Farfán on 3/20/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//

#import "ConnectionToAppDelegate.h"

@implementation ConnectionToAppDelegate

- (UIView *) getVista {
    NSLog(@"test");
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIView *view = [delegate getUnityView];
    return view;
}
@end
