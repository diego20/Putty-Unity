//
//  AppDelegate.h
//  PruebaUnity
//
//  Created by Diego Farfán on 3/11/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIWindow *unityWindow;

@property (strong, nonatomic) UnityAppController *unityController;

- (void)showUnityWindow;
- (void)hideUnityWindow;
- (UIView *)getUnityView;

@end

