//
//  ViewController.m
//  Timer_Sample
//
//  Created by Nathan Weber on 2/6/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

NSTimer *timer;
int count = 0;

@implementation ViewController

- (void)repeatedFunction
{
    NSLog(@"Do repeated function.");
    NSString *dateString = [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterFullStyle];
    NSLog(@"%@",dateString);
    [outputLabel setText:dateString];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	 timer = [NSTimer scheduledTimerWithTimeInterval:1
                                              target:self
                                            selector:@selector(repeatedFunction)
                                            userInfo:nil
                                             repeats:YES];
}

@end
