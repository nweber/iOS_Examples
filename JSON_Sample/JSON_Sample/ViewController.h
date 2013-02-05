//
//  ViewController.h
//  JSON_Sample
//
//  Created by Nathan Weber on 2/5/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextView *jsonOutput;
    IBOutlet UITextView *readableOutput;
}

-(IBAction)doLoad:(id)sender;

@end
