//
//  View_02AppDelegate.h
//  View_02
//
//  Created by Preston Rohner on 2/9/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class View_02ViewController;

@interface View_02AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    View_02ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet View_02ViewController *viewController;

@end

