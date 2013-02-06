//
//  SimpleRenderer.h
//  Showcase_Example
//
//  Created by Nathan Weber on 2/6/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleRenderer : UIView

@property (nonatomic, retain) IBOutlet UILabel *text;
@property (nonatomic, retain) IBOutlet UIImageView *display;

- (void)setData:(NSString *)value;

@end
