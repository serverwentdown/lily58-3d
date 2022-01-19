// Original version by Greg Frost https://www.thingiverse.com/thing:135408
// Modified to support bottom bevels

//bevel_extrude_example();

module bevel_extrude_example()
{
	bevel_extrude(height=10,bevel_depth=2,bottom=true,$fn=16) 
	example_shape();
}

module example_shape()
{
	union()
	{
		square([8,30],true);
		rotate(30)
		square([35,8],true);
	
		translate([0,15])
		square([30,8],true);
	}
}

module bevel_border(size=1)
{
	difference()
	{
		minkowski()
		{
			children();
			square(size,true);
		}
		children();
	}
}

module bevel_cutaway(bevel_depth=5,bottom=false)
{
    translate([0,0,-bevel_depth])
    minkowski()
    {
        linear_extrude(height=bevel_depth,convexity=5)
        bevel_border(1)
        children();
        if (bottom) {
            cylinder(h=bevel_depth+1,r2=0,r1=bevel_depth*sqrt(2));
        } else {
            cylinder(h=bevel_depth+1,r1=0,r2=bevel_depth*sqrt(2));
        }
    }
}

module bevel_extrude(height=20,bevel_depth=1,bottom=false)
{
	difference()
	{
		linear_extrude(height=height,convexity=5)
		children();
        if (bottom) {
            translate([0,0,0])
            bevel_cutaway(bevel_depth,bottom)
            children();
        } else {
            translate([0,0,height])
            bevel_cutaway(bevel_depth,bottom)
            children();
        }
	}	
}
