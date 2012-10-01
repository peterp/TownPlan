//
//  TownPlan.h
//
//  Created by Peter Pistorius on 2012/09/26.
//  Copyright (c) 2012 Praekelt Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>



enum {
  TPAlignTop    = 1 << 0,
  TPAlignRight  = 1 << 1,
  TPAlignBottom = 1 << 2,
  TPAlignLeft   = 1 << 3,
  TPAlignMiddle = 1 << 4,
  TPAlignCenter = 1 << 5
};
typedef NSUInteger TPAlign;

// Because I think the latter are too verbose.
enum {
  TPResizeNone      = UIViewAutoresizingNone,
  TPResizeGapLeft   = UIViewAutoresizingFlexibleLeftMargin,
  TPResizeWidth     = UIViewAutoresizingFlexibleWidth,
  TPResizeGapRight  = UIViewAutoresizingFlexibleRightMargin,
  TPResizeGapTop    = UIViewAutoresizingFlexibleTopMargin,
  TPResizeHeight    = UIViewAutoresizingFlexibleHeight,
  TPResizeGapBottom = UIViewAutoresizingFlexibleBottomMargin
};
typedef NSUInteger TPResize;

// Same here, but don't use them if you don't want too.
enum {
  TPOrientationLandscape     = UIInterfaceOrientationLandscapeLeft,
  TPOrientationLandscapeFlip = UIInterfaceOrientationLandscapeRight,
  TPOrientationPortrait      = UIInterfaceOrientationPortrait,
  TPOrientationPortraitFlip  = UIInterfaceOrientationPortraitUpsideDown
};
typedef NSUInteger TPOrientation;






@interface UIView (TownPlan)

- (void)align:(TPAlign)align fixed:(BOOL)fixed;

@end




@interface UIViewController (TownPlan)

@property (nonatomic, retain) id townPlanLayouts;


- (void)layoutView:(UIView *)view forOrientation:(UIInterfaceOrientation)orientation toPosition:(CGPoint)position;
- (void)layoutForOrientation:(UIInterfaceOrientation)orientation;

- (NSMutableArray *)getLayoutsForOrientation:(UIInterfaceOrientation)orientation;
- (void)setLayouts:(NSArray *)layouts forOrientation:(UIInterfaceOrientation)orientation;

@end

