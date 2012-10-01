//
//  TownPlan.n
//
//  Created by Peter Pistorius on 2012/09/26.
//  Copyright (c) 2012 Praekelt Consulting. All rights reserved.
//

#import "TownPlan.h"


@implementation UIView (TownPlan)

- (void)align:(TPAlign)align fixed:(BOOL)fixed
{
  
  float subviewX = self.frame.origin.x;
  float subviewY = self.frame.origin.y;
  float subviewW = self.frame.size.width;
  float subviewH = self.frame.size.height;
  
  if (align & TPAlignTop) {
    subviewY = 0;
    if (fixed) self.autoresizingMask |= TPResizeGapBottom;
  }
  
  if (align & TPAlignRight) {
    subviewX = self.superview.frame.size.width - subviewW;
    if (fixed) self.autoresizingMask |= TPResizeGapLeft;
  }
  
  if (align & TPAlignBottom) {
    subviewY = self.superview.frame.size.height - subviewH;
    if (fixed) self.autoresizingMask |= TPResizeGapTop;
  }
  
  if (align & TPAlignCenter) {
    subviewX = self.superview.center.x - (subviewW / 2);
    if (fixed) self.autoresizingMask |= TPResizeGapLeft | TPResizeGapRight;
  }
  
  if (align & TPAlignMiddle) {
    subviewY = self.superview.center.y - (subviewH / 2);
    if (fixed) self.autoresizingMask |= TPResizeGapTop | TPResizeGapBottom;
  }
  
  self.frame = CGRectMake(subviewX, subviewY, subviewW, subviewH);
}

@end



static char const * const TPLayoutsKey = "TPLayoutsKey";

@implementation UIViewController (TownPlan)

// faking instance variables with Associative References
@dynamic TPLayouts;

- (id)TPLayouts {
  return objc_getAssociatedObject(self, TPLayoutsKey);
}

- (void)setTPLayouts:(id)newTPLayouts {
  objc_setAssociatedObject(self, TPLayoutsKey, newTPLayouts, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)getLayoutsForOrientation:(TPOrientation)orientation {
  
  if (self.TPLayouts == nil) {
    self.TPLayouts = [NSMutableDictionary dictionary];
  }
  
  NSMutableArray *layouts = [self.TPLayouts objectForKey:[NSNumber numberWithInt:orientation]];
  if (layouts == nil) {
    layouts = [NSMutableArray array];
    [self.TPLayouts setObject:layouts forKey:[NSNumber numberWithInt:orientation]];
  }
  
  return layouts;
}



- (void)layoutView:(UIView *)view withPosition:(CGPoint)position forOrientation:(TPOrientation)orientation {
  // at some stage we should accept size as well.
  // we would never need to accept masks in this mode.
  
  NSMutableArray *layouts = [self getLayoutsForOrientation:orientation];
  
  // should probably use a predicate here to delete the old object.
  for (NSDictionary *layout in layouts) {
    if (layout[@"view"] == view) {
      [layouts removeObject:layout];
      break;
    }
  }
  
  [layouts addObject:@{@"view": view, @"position":[NSValue valueWithCGPoint:position]}];
}

- (void)layoutForOrientation:(TPOrientation)orientation {
  
  for (NSDictionary *layout in [self getLayoutsForOrientation:orientation]) {
    UIView *view = (UIView *)layout[@"view"];
    CGPoint position = [layout[@"position"] CGPointValue];
    view.frame = CGRectMake(position.x, position.y, view.frame.size.width, view.frame.size.height);
  }
  
}


@end