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
  
  if (align & TPAlignCenter) {
    subviewY = self.superview.center.y - (subviewH / 2);
    if (fixed) self.autoresizingMask |= TPResizeGapTop | TPResizeGapBottom;
  }
  
  self.frame = CGRectMake(subviewX, subviewY, subviewW, subviewH);
}

@end



