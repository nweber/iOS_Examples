//
//  UIShowcaseView.m
//  Showcase_Example
//
//  Created by Nathan Weber on 2/6/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import "UIShowcaseView.h"

@interface UIShowcaseView ()

@property (nonatomic, strong) UIScrollView *contentView;
@property (nonatomic, strong) NSMutableDictionary *itemViews;

@end

@implementation UIShowcaseView

@synthesize dataSource = _dataSource;
@synthesize delegate = _delegate;
@synthesize numberOfItems = _numberOfItems;
@synthesize currentItemIndex = _currentItemIndex;

- (void)setDataSource:(id<ShowcaseDataSource>)dataSource
{
    if (_dataSource != dataSource)
    {
        _dataSource = dataSource;
        if (_dataSource)
        {
            [self reloadData];
        }
    }
}

- (void)setDelegate:(id<ShowcaseDelegate>)delegate
{
    if (_delegate != delegate)
    {
        _delegate = delegate;
        if (_delegate && _dataSource)
        {
            [self setNeedsLayout];
        }        
    }
}

- (UIView *)itemViewAtIndex:(NSInteger)index
{
    return [_dataSource showcase:self viewForItemAtIndex:index];
}

- (void)scrollToItemAtIndex:(NSInteger)index animated:(BOOL)animated
{
    CGRect position = [self frame];
    position.origin.x = (position.size.width * index);
    [_contentView scrollRectToVisible:position animated:animated];
}

- (void)reloadData
{
    //bail out if not set up yet
    if (!_dataSource || !_contentView)
    {
        return;
    }
    
    //remove old views
    for (UIView *view in [_itemViews allValues])
    {
        [view.superview removeFromSuperview];
    }
    
    _numberOfItems = [_dataSource numberOfItemsInShowcase:self];
    
    CGRect size = [self frame];
    for (NSInteger i = 0; i < _numberOfItems; i++)
    {
        size.origin.x = (size.size.width * i);
        UIView *view = [self itemViewAtIndex:i];
        [view setFrame:size];
        [_contentView addSubview:view];
    }
    
    CGRect scrollSize = [self frame];
    scrollSize.size.width = (scrollSize.size.width * _numberOfItems);
    [_contentView setContentSize:scrollSize.size];
}

- (void)setCurrentItemIndex:(NSInteger)value
{
    _currentItemIndex = value;
    [self scrollToItemAtIndex:_currentItemIndex animated:YES];
}

- (NSInteger)currentItemIndex
{
    return _currentItemIndex;
}

- (void) doSetUp
{
    CGRect size = [self frame];
    
    if (size.size.height == 0)
    {
        return;
    }
    
    _contentView = [[UIScrollView alloc] initWithFrame:size];
    [_contentView setPagingEnabled:YES];
    [self addSubview:_contentView];
    
    [self reloadData];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self doSetUp];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

@end
