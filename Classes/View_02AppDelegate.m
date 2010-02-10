//
//  View_02AppDelegate.m
//  View_02
//
//  Created by Preston Rohner on 2/9/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "View_02AppDelegate.h"
#import "View_02ViewController.h"

@implementation View_02AppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
