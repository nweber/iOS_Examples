//
//  UIShowcaseView.h
//  Showcase_Example
//
//  Created by Nathan Weber on 2/6/13.
//  Copyright (c) 2013 Nathan Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Availability.h>
#undef weak_delegate
#undef __weak_delegate
#if __has_feature(objc_arc_weak) && \
(!(defined __MAC_OS_X_VERSION_MIN_REQUIRED) || \
__MAC_OS_X_VERSION_MIN_REQUIRED >= __MAC_10_8)
#define weak_delegate weak
#define __weak_delegate __weak
#else
#define weak_delegate unsafe_unretained
#define __weak_delegate __unsafe_unretained
#endif

@protocol ShowcaseDataSource, ShowcaseDelegate;

@interface UIShowcaseView : UIView

@property (nonatomic, weak_delegate) IBOutlet id<ShowcaseDataSource> dataSource;
@property (nonatomic, weak_delegate) IBOutlet id<ShowcaseDelegate> delegate;
@property (nonatomic, assign) NSInteger currentItemIndex;
@property (nonatomic, readonly) NSInteger numberOfItems;

- (UIView *)itemViewAtIndex:(NSInteger)index;
- (void)scrollToItemAtIndex:(NSInteger)index animated:(BOOL)animated;

- (void)reloadData;

@end

// Actually a factory..  And the data isn't in here either.
// It's weird and 'inspired' from another project.
// This should be cleaned up.  DataSource should only provide data.
// Make a factory to generate the views.
// IE, make this into a specilized List component......!
// Is there another way to do that?  Something with UICollectionView?
@protocol ShowcaseDataSource <NSObject>

- (NSUInteger)numberOfItemsInShowcase:(UIShowcaseView *)showcase;
- (UIView *)showcase:(UIShowcaseView *)showcase viewForItemAtIndex:(NSUInteger)index;

@end


// NOT IMPLEMENTED
@protocol ShowcaseDelegate <NSObject>
@optional

- (void)carouselCurrentItemIndexDidChange:(UIShowcaseView *)showcase;

- (BOOL)showcase:(UIShowcaseView *)carousel shouldSelectItemAtIndex:(NSInteger)index;
- (void)showcase:(UIShowcaseView *)carousel didSelectItemAtIndex:(NSInteger)index;

@end