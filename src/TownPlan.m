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
  NSAssert([self superview], @"view should be a subview to call align.");

  float subviewX = self.frame.origin.x;
  float subviewY = self.frame.origin.y;
  float subviewW = self.frame.size.width;
  float subviewH = self.frame.size.height;
  
  // reset the autoresizing mask only when required.
  if (fixed) { self.autoresizingMask = TPResizeNone; }
  
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



static char const * const townPlanLayoutsKey = "townPlanLayouts";

@implementation UIViewController (TownPlan)

// faking instance variables with Associative References
@dynamic townPlanLayouts;

- (id)townPlanLayouts
{
  return objc_getAssociatedObject(self, townPlanLayoutsKey);
}

- (void)setTownPlanLayouts:(id)newTownPlanLayouts
{
  objc_setAssociatedObject(self, townPlanLayoutsKey, newTownPlanLayouts,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)getLayoutsForOrientation:(UIInterfaceOrientation)orientation
{  
  if (self.townPlanLayouts == nil) {
    self.townPlanLayouts = [NSMutableDictionary dictionary];
  }
  
  NSString *orientationKey = @"portrait";
  if (UIInterfaceOrientationIsLandscape(orientation)) {
    orientationKey = @"landscape";
  }
  
  NSMutableArray *layouts = [self.townPlanLayouts objectForKey:orientationKey];
  if (layouts == nil) {
    layouts = [NSMutableArray array];
  }
  
  return layouts;
}

- (void)setLayouts:(NSArray *)layouts
    forOrientation:(UIInterfaceOrientation)orientation
{  
  NSString *orientationKey = @"portrait";
  if (UIInterfaceOrientationIsLandscape(orientation)) {
    orientationKey = @"landscape";
  }
  
  [self.townPlanLayouts setObject:layouts forKey:orientationKey];
}

- (void)layoutView:(UIView *)view
    forOrientation:(UIInterfaceOrientation)orientation
        toPosition:(CGPoint)position
{
  
  NSMutableArray *layouts = [self getLayoutsForOrientation:orientation];
  // TODO: Change this to a predicate.
  for (NSDictionary *layout in layouts) {
    if ([layout objectForKey:@"view"] == view) {
      [layouts removeObject:layout];
      break;
    }
  }

  [layouts addObject:@{@"view": view, @"position": [NSValue valueWithCGPoint:position]}];
  [self setLayouts:layouts forOrientation:orientation];
}

- (void)layoutForOrientation:(UIInterfaceOrientation)orientation
{
  NSArray *layouts = [self getLayoutsForOrientation:orientation];
  for (NSDictionary *layout in layouts) {
    //UIView *view = (UIView *)layout[@"view"];
    UIView *view = (UIView *)[layout objectForKey:@"view"];
    CGPoint position = [[layout objectForKey:@"position"] CGPointValue];
    view.frame = CGRectMake(position.x, position.y, view.frame.size.width, view.frame.size.height);
  }
}

@end