//
//  TorchView.h
//  InstaLight
//
//  Created by Jeremiah Dabney on 10/26/11.
//  Copyright 2011 Jeremiah Dabney. All rights reserved.
//  BSD License
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

// Parent View Controller
@class TorchViewController;

@interface TorchView : UIView {
	TorchViewController *refParentViewController;
	AVCaptureSession *torchSession;
	BOOL light;
	UITapGestureRecognizer *singleFingerTap;
	UILabel *infoLabel;
	AVCaptureDevice *backCamera;
}

@property (nonatomic, retain) AVCaptureSession *torchSession;

- (id)initWithParentViewController:(TorchViewController *)parent;
- (IBAction)handleSingleTap:(UIGestureRecognizer *)sender;
- (void)lightTorch;
- (void)stopTorch;
- (void)changeTorch:(id)sender;

@end
