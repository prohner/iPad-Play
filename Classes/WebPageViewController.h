//
//  WebPageViewController.h
//  View
//
//  Created by Preston Rohner on 2/7/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebPageViewController : UIViewController <UIGestureRecognizerDelegate>{
	UIWebView *webView;
	CGRect currentImageFrame;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

- (void)setUrl:(NSString *)urlAddress;
- (void)createGestureRecognizersToView:(UIView *)targetView;
- (void)mySetFrame:(CGRect)rect;

- (IBAction)handlePanGesture:(UIPanGestureRecognizer *)sender;
- (IBAction)handlePinchGesture:(UIGestureRecognizer *)sender;
- (IBAction)handleSingleDoubleTap:(UIGestureRecognizer *)sender;

@end
