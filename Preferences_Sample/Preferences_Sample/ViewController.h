//
//  ViewController.h
//  Preferences_Sample
//
//  Created by Nathan Weber on 2/5/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UISegmentedControl *alertTimeSelector;
    IBOutlet UIButton *mvpdSignIn;
    IBOutlet UIButton *facebookSignIn;
    IBOutlet UIButton *twitterSignIn;
}

- (IBAction)updateAlertTime:(id)sender;
- (IBAction)doMVPDSignIn:(id)sender;
- (IBAction)doFacebookSignIn:(id)sender;
- (IBAction)doTwitterSignIn:(id)sender;

@end
