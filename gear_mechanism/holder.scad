include <chen_params.scad>;
use <moreShapes.scad>;

holder_h = servo_offset;
x_offset = servo_higeht+8;
prism_len = n5*mm_per_tooth*1.6;
$fn = 20;



difference()
{
    cube([main_board_width, main_board_len-rack_movement_length+8, holder_h]);
 
  difference() {
  
    color("red")
    translate([servo_higeht-2,-.1,prism_h])
      rotate([-90,0,0]) 
        trapezoidPrism(prism_a,prism_b,prism_h,0,prism_len,false);
    


  }
  
  // holes for zip ties
  translate([x_offset/6,-1,4.5])
    rotate([-90,0,0]) 
      cylinder(r=2, h=main_board_len+2.5);
 
 translate([2.3*x_offset/6,-1,4.5])
   rotate([-90,0,0]) 
    cylinder(r=2, h=main_board_len+2.5);
 
 }

 
    translate([servo_higeht-12+0.13,0   ,0])
        color("green")
            cube([10,main_board_len-rack_movement_length+8,holder_h]);
   
