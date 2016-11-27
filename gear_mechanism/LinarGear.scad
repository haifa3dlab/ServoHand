
// Using
// version 1.1
// by Leemon Baird, 2011, Leemon@Leemon.com
//http://www.thingiverse.com/thing:5505
//
include <chen_params.scad>;
use <Gears1.scad>;
use <moreShapes.scad>;
//example gear train.  
//Try it with OpenSCAD View/Animate command with 20 steps and 24 FPS.
//The gears will continue to be rotated to mesh correctly if you change the number of teeth.


thickness    = rack_thickness;
hole         = 0;
rack_height       = 8;
thickness_offset = 7;


d1 =pitch_radius(mm_per_tooth,n1);
echo("d1 is ", d1);

r_out = outer_radius(mm_per_tooth,n1);
echo("r_out is ", r_out);
rack_len = n5*mm_per_tooth*1.6;

prism_scale = 0.90;
a = prism_scale * prism_a* (1/gear_scale);
b = prism_scale * prism_b* (1/gear_scale);  
h = prism_h* (1/gear_scale);


//translate([ 0,    0, 0]) rotate([0,0, $t*360/n1])                 //color([1.00,0.75,0.75]) 
  //    gear(mm_per_tooth,n1,thickness,hole);


difference() 
{
  union() {   
    translate([0, -0, .5]) 
         rack(mm_per_tooth,n5,thickness+thickness_offset,rack_height+2);

    color("red")
    translate([-8, -mm_per_tooth/2-2.5,0]) 
        cube([tensioner_union_len,mm_per_tooth+1.8,thickness+thickness_offset+.9],center=true);
  }
  
/*
 difference()
{
    color("blue")
      translate([-rack_len/2-tensioner_union_len,-2-8-h/2,-b])
        cube([rack_len+tensioner_union_len*2,100+h,2*b]);
    
    color("green")
      rotate([0,-90,0])
      trapezoidPrism(b, a, h,a-b,(2*rack_len)+tensioner_union_len,true);
}
*/
    color("blue")
    translate([-30,-10,-8])
    rotate([-prism_angle,0,0])
        cube([rack_len+tensioner_union_len*2,h,2*b]);
}



  
