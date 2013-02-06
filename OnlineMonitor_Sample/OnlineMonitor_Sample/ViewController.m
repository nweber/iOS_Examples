//
//  ViewController.m
//  OnlineMonitor_Sample
//
//  Created by Nathan Weber on 2/5/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@end

// Reachability - https://github.com/tonymillion/Reachability
// See REACHABILITY_README.md

@implementation ViewController

- (void)reachabilityChanged:(NSNotification*)note
{
    Reachability *reach = [note object];
    
    UIImage *image = nil;
    
    if([reach isReachable])
    {
        NSLog(@"Internet is available.");
        [outputLabel setText:@"Available!"];
        image = [UIImage imageNamed:@"OK.png"];
    }
    else
    {
        NSLog(@"Internet is NOT available.");
        [outputLabel setText:@"NOT available."];
        image = [UIImage imageNamed:@"Close.png"];
    }
    
    [outputImage setImage:image];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *host = @"www.digitalprimates.net";
	Reachability *reach = [Reachability reachabilityWithHostname:host];
    
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(reachabilityChanged:)
												 name:kReachabilityChangedNotification
											   object:nil];
    
	[reach startNotifier];
}

@end
