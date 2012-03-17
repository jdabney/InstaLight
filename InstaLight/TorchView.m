//
//  TorchView.m
//  InstaLight
//
//  Created by Jeremiah Dabney on 10/26/11.
//  Copyright 2011 Jeremiah Dabney. All rights reserved.
//  BSD License
//

#import "TorchView.h"
#import "TorchViewController.h"

// Private Methods
@interface TorchView()
- (void)loadInfoLabel;
@end

@implementation TorchView

@synthesize torchSession;

- (id)initWithParentViewController:(TorchViewController *)parent {
	if ((self = [super init])) {
		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lightTorch) name:UIApplicationDidBecomeActiveNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopTorch) name:UIApplicationDidEnterBackgroundNotification object:nil];
		self.userInteractionEnabled = YES;

		singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
		singleFingerTap.numberOfTapsRequired = 1;
		[self addGestureRecognizer:singleFingerTap];
		
		[self setFrame:CGRectMake(0, 0, 320, 480)];
		refParentViewController = parent;
		[self setBackgroundColor:[UIColor blackColor]];
		[self loadInfoLabel];
	}
	return self;
}

- (IBAction)handleSingleTap:(UIGestureRecognizer *)sender 
{
	if (light == NO)
	{
		[infoLabel setText:@"Tap screen to turn light off"];
		[self lightTorch];
	}
	else
	{
		[self stopTorch];
		[infoLabel setText:@"Tap screen to turn light on"];
	}
}

- (void)loadInfoLabel {
	infoLabel = [[UILabel alloc] init];
	[infoLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
	[infoLabel setText:@"Tap screen to turn light off"];
	[infoLabel setTextColor:[UIColor whiteColor]];
	[infoLabel setBackgroundColor:[UIColor clearColor]];
	[infoLabel setTextAlignment:UITextAlignmentLeft];
	[infoLabel setLineBreakMode:UILineBreakModeTailTruncation];
	[infoLabel setNumberOfLines:1];
	[infoLabel setFrame:CGRectMake(65, 11.5, 190, 96)];
	[self addSubview:infoLabel];
}

- (void)changeTorch:(id)sender
{
	UISwitch *lightswitch = (UISwitch *)sender;
	
	if (lightswitch.on)
		[self lightTorch];
	else
		[self stopTorch];
}

- (void)lightTorch
{
	BOOL success;
	
	backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
	if ( [backCamera isTorchAvailable] && [backCamera isTorchModeSupported:AVCaptureTorchModeOn]  )
	{
		success = [backCamera lockForConfiguration:nil];
		if ( success )
		{
			[backCamera setTorchMode:AVCaptureTorchModeOn];
			[backCamera unlockForConfiguration];
		}
	}
	
	light = YES;
}

- (void)stopTorch
{	
	BOOL success;
	
	success = [backCamera lockForConfiguration:nil];
	if ( success )
	{
		[backCamera setTorchMode:AVCaptureTorchModeOff];
		[backCamera unlockForConfiguration];
	}
	
	light = NO;
}

@end
