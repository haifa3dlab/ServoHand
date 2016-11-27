include <chen_params.scad>;
use <moreShapes.scad>;


difference() { 
    translate([39.5,29,0])
    rotate([0,-50,-90])
       import("chen_gauntlet_turned_screws.stl", convexity = 5);
       
    color("blue")
       main_holes();
    
    color("red")
       side_holes();
       
    translate([60,0, 0])
    color("red")
       side_holes();
}

module main_holes() {
ydist = 60;
xdist = 40; 
for (i = [0:1])
{
    translate([10+xdist*i,0, -1])
    {
        for (j = [0:1]) 
        {
            translate([ 0, 5+ydist*j, -1 ])
               cylinder(r = 1.7, h = 50, $fn=10);
        }

    }
}

}


module side_holes() {
ydist = 10;

        for (j = [0:6]) 
        {
            translate([ 0, 9+ydist*j, -1 ])
               cylinder(r = 1.7, h = 50, $fn=10);
        }



}