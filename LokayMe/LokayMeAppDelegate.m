//
//  LokayMeAppDelegate.m
//  LokayMe
//
//  Created by Aaron Wolverton on 9/17/13.
//  Copyright (c) 2013 Aaron Wolverton. All rights reserved.
//

#import "LokayMeAppDelegate.h"
#import "DemoTableViewController.h"
#import "MyLogInViewController.h"

@implementation LokayMeAppDelegate


// ****************************************************************************

// HAD OVER 60 ERRORS WHEN MOVING CLASSES FROM TUTORIAL TO LokayMe.xcode. Problem was I didnt have #import "Parse/Parse.h" set in my LokayMe-Prefix.pch file. That for rid of ALL of the errors.

// ****************************************************************************


#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [Parse setApplicationId:@"Azm6tnB9aOn6JaJKQizXtzOQISOzWQATOJ8xhouO"
                  clientKey:@"6TocTztHVSwuBssDcG6fpN6Wmvu5MvpfdwE7QqFc"];
    
    [PFFacebookUtils initializeFacebook];
    [PFTwitterUtils initializeWithConsumerKey:@"cCsKjLCQaTItWaS6Hr2kfw" consumerSecret:@"ZecRAT3UourjY9P2ACeoHLG7L7AQGaSk5CkHld3Mq8s"];
    
    // Set default ACLs
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[DemoTableViewController alloc] init]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

// Facebook oauth callback
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [PFFacebookUtils handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Handle an interruption during the authorization flow, such as the user clicking the home button.
    [FBSession.activeSession handleDidBecomeActive];
}

@end