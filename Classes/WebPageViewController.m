    //
//  WebPageViewController.m
//  View
//
//  Created by Preston Rohner on 2/7/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "WebPageViewController.h"


@implementation WebPageViewController

@synthesize webView;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
	}
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	

	self.view.backgroundColor = [UIColor whiteColor];
	self.view.opaque = YES;
	[[self.view layer] setValue:@"movable_view" forKeyPath:@"kind"];
	
	
	webView.bounds = self.view.bounds;
	
	UIView *v = [[UIView alloc] init];
	v.backgroundColor = [UIColor clearColor];
	v.bounds = self.view.bounds;
	[self.view addSubview:v];


	[self createGestureRecognizersToView:self.view];
	[self createGestureRecognizersToView:webView];
}

- (void)mySetFrame:(CGRect)rect {
	[self.view setFrame:rect];
	currentImageFrame = self.view.frame;
}

- (void)createGestureRecognizersToView:(UIView *)targetView {
	
//    UITapGestureRecognizer *singleFingerDTap = [[UITapGestureRecognizer alloc]
//												initWithTarget:self action:@selector(handleSingleDoubleTap:)];
//    singleFingerDTap.numberOfTapsRequired = 2;
//    [targetView addGestureRecognizer:singleFingerDTap];
//    [singleFingerDTap release];
	
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
										  initWithTarget:self action:@selector(handlePanGesture:)];
    [targetView addGestureRecognizer:panGesture];
    [panGesture release];
	
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]
											  initWithTarget:self action:@selector(handlePinchGesture:)];
    [targetView addGestureRecognizer:pinchGesture];
    [pinchGesture release];
}

- (IBAction)handlePinchGesture:(UIGestureRecognizer *)sender {
    CGFloat factor = [(UIPinchGestureRecognizer *)sender scale];
    self.view.transform = CGAffineTransformMakeScale(factor, factor);
	currentImageFrame = self.view.frame;
}

- (IBAction)handlePanGesture:(UIPanGestureRecognizer *)sender {
    CGPoint translate = [sender translationInView:[sender view]];

    CGRect newFrame = currentImageFrame;
//    CGRect newFrame = sender.view.frame;
    newFrame.origin.x += translate.x;
    newFrame.origin.y += translate.y;
	
	NSLog(@"Going from (%.2f, %.2f)x(%.2f, %.2f) to (%.2f, %.2f)x(%.2f, %.2f)"
		  , currentImageFrame.origin.x, currentImageFrame.origin.y, currentImageFrame.size.width, currentImageFrame.size.height
		  , newFrame.origin.x, newFrame.origin.y, newFrame.size.width, newFrame.size.height);
    sender.view.frame = newFrame;
	
    if (sender.state == UIGestureRecognizerStateEnded)
        currentImageFrame = newFrame;
}

- (IBAction)handleSingleDoubleTap:(UIGestureRecognizer *)sender {
    CGPoint tapPoint = [sender locationInView:sender.view.superview];
    [UIView beginAnimations:nil context:NULL];
    sender.view.center = tapPoint;
    [UIView commitAnimations];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (void)setUrl:(NSString *)urlAddress {
	NSURL *url = [NSURL URLWithString:urlAddress];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	[webView loadRequest:requestObj];
	
}
@end
