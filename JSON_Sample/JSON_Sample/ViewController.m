//
//  ViewController.m
//  JSON_Sample
//
//  Created by Nathan Weber on 2/5/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableData *responseData;

@end

@implementation ViewController

@synthesize responseData;

- (void)showError:(NSURLConnection *)connection
{
    NSLog(@"Error loading data...!");
}

- (void)printJson:(NSDictionary *)json
{
    for (id key in json)
    {
        id value = [json objectForKey:key];
        
        if ([value isKindOfClass:[NSString class]])
        {
            NSString *keyAsString = (NSString *)key;
            NSString *valueAsString = (NSString *)value;
            
            NSLog(@"key: %@", keyAsString);
            NSLog(@"value: %@", valueAsString);
            
            NSString *newText = [readableOutput text];
            newText = [newText stringByAppendingString:@"\n"];
            newText = [newText stringByAppendingString:keyAsString];
            newText = [newText stringByAppendingString:@" = "];
            newText = [newText stringByAppendingString:valueAsString];
            
            [readableOutput setText:newText];
        }
        else if ([value isKindOfClass:[NSDictionary class]])
        {
            [self printJson:value];
        }
    }
}

- (IBAction)doLoad:(id)sender
{
    NSString *json = @"http://digitalprimates.net/clients/nbc/configuration.json";
    NSLog(@"Start load: %@", json);
    NSURL *url = [NSURL URLWithString:json];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection)
    {
        responseData = [NSMutableData data];
    }
    else
    {
        [self showError:connection];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Finished loading.");
    NSLog(@"Start parsing.");
    
    NSError *parseError = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableLeaves error:&parseError];
    
    [self printJson:result];
    
    NSString *stringData = [[NSString alloc] initWithData:self.responseData encoding:NSASCIIStringEncoding];
    [jsonOutput setText:stringData];
    
    NSLog(@"Done parsing!");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self showError:connection];
}

@end
