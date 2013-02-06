//
//  ViewController.h
//  Showcase_Example
//
//  Created by Nathan Weber on 2/6/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIShowcaseView.h"

@interface ViewController : UIViewController <ShowcaseDataSource, ShowcaseDelegate>

@property (nonatomic, retain) IBOutlet UIShowcaseView *showcase;

@end
