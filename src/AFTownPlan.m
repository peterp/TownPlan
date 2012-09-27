//
//  AFTownPlan.m
//


#import "AFTownPlan.h"

@implementation UIView (AFTownPlan)

- (void)align:(NSString *)position fixed:(BOOL)fixed
{
  // We need to align against a superview.
  if (self.superview == nil) {
    @throw([NSException exceptionWithName:@"TownPlan.align requires superview." reason:@"align requires the view to have a superview." userInfo:nil]);
  }

  float subviewX = self.frame.origin.x;
  float subviewY = self.frame.origin.y;
  float subviewW = self.frame.size.width;
  float subviewH = self.frame.size.height;
  
  
  if ([position rangeOfString:@"top"].location != NSNotFound) {
    subviewY = 0;
    if (fixed) { self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin; }
  }
  
  if ([position rangeOfString:@"right"].location != NSNotFound) {
    subviewX = self.superview.frame.size.width - subviewW;
    if (fixed) { self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin; }
  }
  
  if ([position rangeOfString:@"bottom"].location != NSNotFound) {
    subviewY = self.superview.frame.size.height - subviewH;
    if (fixed) { self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin; }
  }
  
  if ([position rangeOfString:@"left"].location != NSNotFound) {
    subviewX = 0;
    if (fixed) { self.autoresizingMask = UIViewAutoresizingFlexibleRightMargin; }
  }
  
  if ([position rangeOfString:@"center"].location != NSNotFound) {
    subviewX = self.superview.center.x - (subviewW / 2);
    if (fixed) {
      self.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
    }
  }
  
  if ([position rangeOfString:@"middle"].location != NSNotFound) {
    subviewY = self.superview.center.y - (subviewH / 2);
    if (fixed) {
      self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    }
  }

  self.frame = CGRectMake(subviewX, subviewY, subviewW, subviewH);
}


@end
