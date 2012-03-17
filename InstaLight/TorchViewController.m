//
//  TorchViewController.m
//  InstaLight
//
//  Created by Jeremiah Dabney on 10/26/11.
//  Copyright 2011 Internet-Truck. All rights reserved.
//  BSD License
//

#import "TorchViewController.h"
#import "TorchView.h"

@implementation TorchViewController


- (id)init {
	self = [super init];
	if (self) {
		// Link this view controller to our Dapp generated view
		UIView *torchView = [[TorchView alloc] initWithParentViewController:self];
		self.view = torchView;
	}
	return self;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
	
@end

