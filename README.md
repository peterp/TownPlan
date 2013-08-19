This project is now defunct, use autolayout instead!

TownPlan is an iOS UIView layout helper.

Laying out views in code is rather tedious. I hope that TownPlan improves
that experience.


Layout Views with Orientation Changes
-------------------------------------

Adds a bunch of functionality to a view controller which allows you to specify
a views position and the orientation change that it should respond to.

### Usage

    [self layoutView:view forOrientation:UIInterfaceOrientationPortrait 
          toPosition:CGPointMake(0, 0)];

    [self layoutView:view forOrientation:UIInterfaceOrientationLandscapeLeft 
          toPosition:CGPointMake(100, 100)];

And then add this your view controller!

    - (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
                                    duration:(NSTimeInterval)duration {
      [self layoutForOrientation:orientation];
    }


Now `view` will change position when your device changes orientation.

Alignment
---------

    [view align:TPAlignRight | TP AlignBottom fixed:YES];

Takes a combination of alignment bitmasks to align a view to its superview, 
settings `fixed` to YES will set the correct `autoresizingMask` to keep its 
position fixed during orientation changes.

Valid arguments are:

    - TPAlignTop
    - TPAlignRight
    - TPAlignBottom
    - TPAlignLeft
    - TPAlignMiddle (Y axis)
    - TPAlignCenter (X axis)

### Usage

    UIView *pewView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    pewView.backgroundColor = [UIColor brownColor];

    // The view must be part of a superview to use `align`
    [self.view addSubview:pewView];
    [pewView align:TPAlignBottom | TPAlignCenter fixed:YES];


More to come.
