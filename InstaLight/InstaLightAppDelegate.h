//
//  InstaLightAppDelegate.h
//  InstaLight
//
//  Created by Jeremiah Dabney on 10/26/11.
//  Copyright 2011 Internet-Truck. All rights reserved.
//  BSD License
//

#import <UIKit/UIKit.h>

@interface InstaLightAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	UINavigationController *navigationController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;

@end

