    //
//  OpenFlowViewController.m
//  View_02
//
//  Created by Preston Rohner on 2/9/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "OpenFlowViewController.h"


@implementation OpenFlowViewController

@synthesize mainView;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupViewSizeAndImages];
}
*/

- (void)viewDidAppear:(BOOL)animated {
//	[self.view setFrame:CGRectMake(0, 0, 480, 320)];
	[super viewDidAppear:animated];
	NSLog(@"In viewDidAppear");
	[self setupViewSizeAndImages];
}

- (void)setupViewSizeAndImages {
	NSString *imageName;
	NSLog(@"In setupViewSizeAndImages");
	AFOpenFlowView *v = (AFOpenFlowView *)self.view;
	[v setNumberOfImages: 6];
	
	for (int i=0; i < 6; i++) {
		imageName = [[NSString alloc] initWithFormat:@"%d.jpg", i];
		[v setImage:[UIImage imageNamed:imageName] forIndex:i];
		[imageName release];
	}

	[self.view setFrame:CGRectMake(0, 0, 480, 320)];
}

- (CGSize)contentSizeForViewInPopoverView {
	return CGSizeMake(480.0, 320.0);
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

- (void)openFlowView:(AFOpenFlowView *)openFlowView requestImageForIndex:(int)index {
//	AFGetImageOperation *getImageOperation = [[AFGetImageOperation alloc] initWithIndex:index viewController:self];
//	
//	[loadImagesOperationQueue addOperation:getImageOperation];
//	[getImageOperation release];
}

- (void)openFlowView:(AFOpenFlowView *)openFlowView selectionDidChange:(int)index {
	NSLog(@"Cover Flow selectionDidChange to %d", index);
}

- (void)openFlowView:(AFOpenFlowView *)openFlowView selectionWasSelected:(int)index {
	NSLog(@"Cover Flow selectionWasSelected to %d", index);
	[mainView flowItemSelected:index];
}

- (UIImage *)defaultImage {
	return [UIImage imageNamed:@"Desk.png"];
}


@end
