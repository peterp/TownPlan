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



enum {
  TPOrientationPortrait = UIInterfaceOrientationMaskPortrait,
  TPOrientationLandscape = UIInterfaceOrientationMaskLandscape
};
typedef NSUInteger TPOrientation;



@interface UIView (TownPlan)

- (void)align:(TPAlign)align fixed:(BOOL)fixed;

@end

@interface UIViewController (TownPlan)

@property (nonatomic, retain) id TPLayouts;

- (void)layoutView:(UIView *)view withPosition:(CGPoint)position forOrientation:(TPOrientation)orientation;
- (void)layoutForOrientation:(TPOrientation)orientation;

- (NSMutableArray *)getLayoutsForOrientation:(TPOrientation)orientation;



@end

