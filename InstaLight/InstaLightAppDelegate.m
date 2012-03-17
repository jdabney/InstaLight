//
//  InstaLightAppDelegate.m
//  InstaLight
//
//  Created by Jeremiah Dabney on 10/26/11.
//  Copyright 2011 Internet-Truck. All rights reserved.
//  BSD License
//

#import "InstaLightAppDelegate.h"

// View Controllers
#import "TorchViewController.h"

@implementation InstaLightAppDelegate

@synthesize window;
@synthesize navigationController;

#pragma mark -
#pragma mark Application Lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after app launch
	// Create the window object
	UIWindow *localWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	// Assign the localWindow to the AppDelegate window, then release the local window
	self.window = localWindow;

	// Setup the first view controller
    TorchViewController *torchViewController = [[TorchViewController alloc] init];

	// Initialise the navigation controller with the first view controller as its root view controller
	navigationController = [[UINavigationController alloc] initWithRootViewController:torchViewController];

	// Hide the navigation controller
	[navigationController setNavigationBarHidden:YES];

	// Add the navigation controller as a subview of our window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];

	return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


@end

