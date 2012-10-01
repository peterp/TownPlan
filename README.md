TownPlan is an iOS UIView layout helper.

Laying out views in code is rather tedious. I hope that TownPlan improves
that experience.


Layout Views
------------

You can set a bunch of points against orientation.


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

### Example

    UIView *pewView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    pewView.backgroundColor = [UIColor brownColor];

    // The view must be part of a superview to use `align`
    [self.view addSubview:pewView];
    [pewView align:TPAlignBottom | TPAlignCenter fixed:YES];


More to come.