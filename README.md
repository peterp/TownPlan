TownPlan is an iOS UIView layout helper.

Laying out view in code is rather tedious. I hope that TownPlan improves
that experience.

Alignment Helper
----------------

Takes a combination of strings in order to align the view to its superview.
Valid strings are:

    - top
    - right
    - bottom
    - left
    - middle (Y axis)
    - center (X axis)

Settings fixed to true will make sure that the subview remains in position
when orientation is changed by settings the correct autoresizng masks.


Alignment Helper Example:
    
    UIView *myView = [[UIView alloc]] initWithFrame:CGRectMake(100, 100, 100, 100)];
    myView.backgroundColor = [UIColor brownColor];

    // The view must be a subview of another before you can align it. (It'll warn you.)
    [self.view addSubview:view];

    [myView align:@"top right" fixed:YES];


More to come.