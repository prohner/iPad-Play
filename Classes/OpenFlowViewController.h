//
//  OpenFlowViewController.h
//  View_02
//
//  Created by Preston Rohner on 2/9/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFOpenFlowView.h"
#import "View_02ViewController.h"

@interface OpenFlowViewController : UIViewController <AFOpenFlowViewDataSource, AFOpenFlowViewDelegate> {
	View_02ViewController *mainView;
}

@property (nonatomic, retain) View_02ViewController *mainView;

- (void)setupViewSizeAndImages;



@end
