//
//  View_02ViewController.h
//  View_02
//
//  Created by Preston Rohner on 2/9/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View_02ViewController : UIViewController <UIPopoverControllerDelegate> {
	UIPopoverController *flowPopover;
	UIToolbar *theToolbar;
}

@property (nonatomic, retain) IBOutlet UIToolbar *theToolbar;

- (IBAction)showPopoverCoverFlow:(id)sender;
- (void)flowItemSelected:(int)index;

@end

