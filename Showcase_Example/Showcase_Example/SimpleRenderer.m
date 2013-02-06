//
//  SimpleRenderer.m
//  Showcase_Example
//
//  Created by Nathan Weber on 2/6/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import "SimpleRenderer.h"

@interface SimpleRenderer ()

@property (nonatomic, strong) NSString *data;

@end

@implementation SimpleRenderer

@synthesize text;
@synthesize display;
@synthesize data;

- (void)setData:(NSString *)value
{
    data = value;
    [text setText:data];
}

- (void)doSetUp
{
    CGRect size = [self frame];
    
    if (size.size.height == 0)
    {
        return;
    }
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    self.backgroundColor = color;
    
    text = [[UILabel alloc] initWithFrame:self.bounds];
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = NSTextAlignmentCenter;
    
    [text setText:data];
    [self addSubview:text];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self doSetUp];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self doSetUp];
    }
    return self;
}

@end
