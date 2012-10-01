//
//  TownPlan.h
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


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




@interface UIView (TownPlan)

- (void)align:(TPAlign)align fixed:(BOOL)fixed;

@end

