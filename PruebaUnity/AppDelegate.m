//
//  AppDelegate.m
//  PruebaUnity
//
//  Created by Diego Farfán on 3/11/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) UINavigationController *navVC;

@end

@implementation AppDelegate

- (void)showUnityWindow {
    
    [self.unityWindow makeKeyAndVisible];
}

- (void)hideUnityWindow {
    [self.window makeKeyAndVisible];
}

- (UIView *)getUnityView {
    
    return UnityGetMainWindow().rootViewController.view;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //self.window.backgroundColor = [UIColor redColor];
    
    //ViewController *viewController = [[ViewController alloc] initWithNibName:nil bundle:nil];
    
    //self.navVC = [[UINavigationController alloc] initWithRootViewController:viewController];
    //self.window.rootViewController = self.navVC;
    
    self.unityController = [[UnityAppController alloc] init];
    [self.unityController application:application didFinishLaunchingWithOptions:launchOptions];
    
    //[self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    [self.unityController applicationWillResignActive:application];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [self.unityController applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    [self.unityController applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [self.unityController applicationDidBecomeActive: application];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    [self.unityController applicationWillTerminate: application];
}


@end
