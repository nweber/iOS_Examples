//
//  ViewController.m
//  Showcase_Example
//
//  Created by Nathan Weber on 2/6/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import "ViewController.h"
#import "SimpleRenderer.h"

@interface ViewController ()

@property (nonatomic, retain) NSMutableArray *items;

@end

@implementation ViewController

@synthesize showcase;
@synthesize items = _items;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSMutableArray *)items
{
    if (!_items)
    {
        _items = [[NSMutableArray alloc] init];
        [_items addObject:@"Event #1"];
        [_items addObject:@"Event #2"];
        [_items addObject:@"Event #3"];
    }
    
    return _items;
}

- (NSUInteger)numberOfItemsInShowcase:(UIShowcaseView *)showcase
{
    return [[self items] count];
}

- (UIView *)showcase:(UIShowcaseView *)showcase viewForItemAtIndex:(NSUInteger)index
{
    SimpleRenderer *renderer = [[SimpleRenderer alloc] init];
    [renderer setData:[[self items] objectAtIndex:index]];
    return renderer;
}

- (void)carouselCurrentItemIndexDidChange:(UIShowcaseView *)showcase
{
    NSLog(@"carouselCurrentItemIndexDidChange");
}

- (BOOL)showcase:(UIShowcaseView *)carousel shouldSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"shouldSelectItemAtIndex");
    return YES;
}

- (void)showcase:(UIShowcaseView *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"didSelectItemAtIndex");
}

@end
