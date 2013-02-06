//
//  ViewController.m
//  Preferences_Sample
//
//  Created by Nathan Weber on 2/5/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

NSString * const PreferencesSampleAlertTimeKey = @"PreferencesSampleAlertTimeKey";
NSString * const PreferencesSampleMVPDKey = @"PreferencesSampleMVPDKey";
NSString * const PreferencesSampleFacebookKey = @"PreferencesSampleFacebookKey";
NSString * const PreferencesSampleTwitterKey = @"PreferencesSampleTwitterKey";

@implementation ViewController

- (void)showAlert:(NSString *)text
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                    message:text
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

+ (void)initialize
{
    [super initialize];
    
    NSArray *items = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],
                                               [NSNumber numberWithBool:NO],
                                               [NSNumber numberWithBool:NO],
                                               [NSNumber numberWithBool:NO], nil];
    
    NSArray *keys = [NSArray arrayWithObjects:PreferencesSampleAlertTimeKey,
                                              PreferencesSampleMVPDKey,
                                              PreferencesSampleFacebookKey,
                                              PreferencesSampleTwitterKey, nil];

    NSDictionary *defaults = [NSDictionary dictionaryWithObjects:items forKeys:keys];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
}

- (void)updateAlertTimeFromPreferences
{
    NSInteger alertTimeValue = [[NSUserDefaults standardUserDefaults] integerForKey:PreferencesSampleAlertTimeKey];
    [alertTimeSelector setSelectedSegmentIndex:alertTimeValue];
}

- (void)updateMVPDFromPreferences
{
    BOOL mvpdValue = [[NSUserDefaults standardUserDefaults] boolForKey:PreferencesSampleMVPDKey];
    if (mvpdValue)
    {
        [mvpdSignIn setTitle:@"Sign Out" forState:UIControlStateNormal];
    }
    else
    {
        [mvpdSignIn setTitle:@"Sign In" forState:UIControlStateNormal];
    }
}

- (void)updateFacebookFromPreferences
{
    BOOL facebookValue = [[NSUserDefaults standardUserDefaults] boolForKey:PreferencesSampleFacebookKey];
    if (facebookValue)
    {
        [facebookSignIn setTitle:@"Sign Out of Facebook" forState:UIControlStateNormal];
    }
    else
    {
        [facebookSignIn setTitle:@"Sign In to Facebook" forState:UIControlStateNormal];
    }
}

- (void)updateTwitterFromPreferences
{
    BOOL twitterValue = [[NSUserDefaults standardUserDefaults] boolForKey:PreferencesSampleTwitterKey];
    if (twitterValue)
    {
        [twitterSignIn setTitle:@"Sign Out of Twitter" forState:UIControlStateNormal];
    }
    else
    {
        [twitterSignIn setTitle:@"Sign In to Twitter" forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateAlertTimeFromPreferences];
    [self updateMVPDFromPreferences];
    [self updateFacebookFromPreferences];
    [self updateTwitterFromPreferences];
}

- (IBAction)updateAlertTime:(id)sender
{
    NSInteger value = [alertTimeSelector selectedSegmentIndex];
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:PreferencesSampleAlertTimeKey];
    [self updateAlertTimeFromPreferences];
}

- (IBAction)doMVPDSignIn:(id)sender
{
    BOOL value = [[NSUserDefaults standardUserDefaults] boolForKey:PreferencesSampleMVPDKey];
    value = !value;
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:PreferencesSampleMVPDKey];
    [self updateMVPDFromPreferences];
}

- (IBAction)doFacebookSignIn:(id)sender
{
    BOOL value = [[NSUserDefaults standardUserDefaults] boolForKey:PreferencesSampleFacebookKey];
    value = !value;
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:PreferencesSampleFacebookKey];
    [self updateFacebookFromPreferences];
}

- (IBAction)doTwitterSignIn:(id)sender
{
    BOOL value = [[NSUserDefaults standardUserDefaults] boolForKey:PreferencesSampleTwitterKey];
    value = !value;
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:PreferencesSampleTwitterKey];
    [self updateTwitterFromPreferences];
}

@end
