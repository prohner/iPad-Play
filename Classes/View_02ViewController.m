//
//  View_02ViewController.m
//  View_02
//
//  Created by Preston Rohner on 2/9/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "View_02ViewController.h"
#import "OpenFlowViewController.h"
#import "WebPageViewController.h"

@implementation View_02ViewController

@synthesize theToolbar;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.view.autoresizesSubviews = YES;
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//	if (interfaceOrientation == UIInterfaceOrientationPortrait) {
//		theToolbar.transform = CGAffineTransformMakeRotation(M_PI / 2);
//	} else {
//		theToolbar.transform = CGAffineTransformMakeRotation(0);
//	}

    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction)showPopoverCoverFlow:(id)sender {
	NSLog(@"Connection made");
	OpenFlowViewController* content = [[OpenFlowViewController alloc] init];
	content.mainView = self;
	
    flowPopover = [[UIPopoverController alloc] initWithContentViewController:content];
    flowPopover.delegate = self;
	
    [flowPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    [content release];
}

- (void)flowItemSelected:(int)index {
	[flowPopover dismissPopoverAnimated:YES];

	WebPageViewController *v;
	NSString *u = nil;
	CGRect r;
	
	switch (index) {
		case 0:
			r = CGRectMake(80, 520, 620, 420);
			u = @"http://www.mscnet.com/Prohner/ipad/sales_by_dept.html";
			break;
		case 1:
			r = CGRectMake(50, 220, 320, 220);
			u = @"http://www.mscnet.com/Prohner/ipad/total_counts.html";
			break;
		case 2:
			r = CGRectMake(430, 220, 320, 220);
			u = @"http://www.mscnet.com/Prohner/ipad/mailable_counts.html";
			break;
		case 3:
			r = CGRectMake(430, 220, 320, 280);
			u = @"http://www.mscnet.com/Prohner/ipad/customer_recency.html";
			break;
		case 4:
			r = CGRectMake(330, 320, 380, 160);
			u = @"http://www.mscnet.com/Prohner/ipad/preferred_customers.html";
			break;
		case 5:
			r = CGRectMake(130, 120, 440, 360);
			u = @"http://www.mscnet.com/Prohner/ipad/segmentation_breakdown.html";
			break;
		default:
			break;
	}
	
	if (u) {
		v = [[WebPageViewController alloc] init];
		[((WebPageViewController*)v) mySetFrame:r];
		[v setUrl:u];
		[self.view addSubview:v.view];
	}
	
}

@end
