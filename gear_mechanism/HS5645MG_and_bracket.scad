$fn=60;

use <servo_mockup.scad>;

//
// List of servos I have.
//
// include <futaba.scad> will make these variables available

//
// HS5645MG: metal-gear servo
//
hs5645mg__servo_width = 19.8;
hs5645mg__servo_length = 40.6;
hs5645mg__servo_height = 37.8;
hs5645mg__frame_length = 53.4;
hs5645mg__frame_thickness = 2.45;
hs5645mg__frame_v_offset = 27;
hs5645mg__mounting_hole_diameter = 4;
hs5645mg__mounting_hole_slot = 2;
hs5645mg__mounting_hole_center_x_offset = hs5645mg__servo_width/4;
hs5645mg__mounting_hole_center_y_offset = 0 + hs5645mg__mounting_hole_diameter / 2 ;
hs5645mg__axle_diameter = 4;
hs5645mg__axle_height = 3;
hs5645mg__axle_screw_diameter = 2;
hs5645mg__turret_diameter = 12+7;
hs5645mg__turret_x_margin = (hs5645mg__servo_width - hs5645mg__turret_diameter) / 2;
hs5645mg__turret_y_margin = hs5645mg__servo_length - hs5645mg__turret_diameter;
hs5645mg__turret_height = 1.2;
hs5645mg_slot_height = 2;
hs5645mg_slot_thickness = 2;


bracket_size = (hs5645mg__servo_length - hs5645mg__frame_length)/2;

bracket_thickness = 3;
bracket_width = hs5645mg__servo_width + 10;
bracket_length_delta = 3;
x_offset = -hs5645mg__turret_diameter/2+bracket_size;
holes_base_x = x_offset+hs5645mg__mounting_hole_diameter/2;
hs5645mg_slot_height = 2;
hs5645mg_slot_thickness = 2;


module hs5645mg(centered=true) {
  servo_mockup(
    servo_width = hs5645mg__servo_width,
    servo_length = hs5645mg__servo_length,
    servo_height = hs5645mg__servo_height,
    frame_length = hs5645mg__frame_length,
    frame_thickness = hs5645mg__frame_thickness,
    frame_v_offset = hs5645mg__frame_v_offset,
    mounting_hole_diameter = hs5645mg__mounting_hole_diameter,
    mounting_hole_center_x_offset = hs5645mg__mounting_hole_center_x_offset,
    mounting_hole_center_y_offset = hs5645mg__mounting_hole_center_y_offset,
    mounting_hole_slot = hs5645mg__mounting_hole_slot,
    axle_diameter = hs5645mg__axle_diameter,
    axle_height = hs5645mg__axle_height,
    axle_is_round = true,
    turret_diameter = hs5645mg__turret_diameter,
    turret_x_margin = hs5645mg__turret_x_margin,
    turret_y_margin = hs5645mg__turret_y_margin,
    turret_height = hs5645mg__turret_height,
    centered=centered);
}


// The motor
/*
rotate([0,0,90])
hs5645mg();
*/

//The bracket

// set remove_top to zero for full frame
remove_top = 1;
difference() 
{
// bracket body
translate([bracket_x_offset,
           -bracket_width/2,
           -hs5645mg__servo_height+hs5645mg__frame_v_offset+hs5645mg__frame_thickness])
      cube([hs5645mg__frame_length+bracket_length_delta ,bracket_width,5]);


translate([holes_base_x-2,
     -1,
    -16])

cube([hs5645mg__servo_length+11,
      2,
      10]);


bracket_x_offset = x_offset-bracket_length_delta /2;
// Servo body emulator
tolerance = 0.1;
translate([-hs5645mg__turret_diameter/2-tolerance,
           -hs5645mg__servo_width/2-tolerance,
           -hs5645mg__servo_height])
cube([hs5645mg__servo_length + tolerance*2,
      hs5645mg__servo_width+tolerance*2+10*remove_top,
      hs5645mg__servo_height+tolerance*2]);




// holes
translate([holes_base_x,hs5645mg__mounting_hole_center_x_offset,-hs5645mg__servo_height])
cylinder(d=hs5645mg__mounting_hole_diameter , h=hs5645mg__servo_height);

translate([holes_base_x,-hs5645mg__mounting_hole_center_x_offset,-hs5645mg__servo_height])
cylinder(d=hs5645mg__mounting_hole_diameter , h=hs5645mg__servo_height);


//hs5645mg__mounting_hole_diameter/2
//hs5645mg__turret_diameter/2
//hs5645mg__mounting_hole_diameter/2



mr = hs5645mg__mounting_hole_diameter;

translate([holes_base_x+hs5645mg__frame_length-hs5645mg__mounting_hole_diameter,
     hs5645mg__mounting_hole_center_x_offset,
    -hs5645mg__servo_height])
cylinder(d=hs5645mg__mounting_hole_diameter , h=hs5645mg__servo_height);

translate([holes_base_x+hs5645mg__frame_length-hs5645mg__mounting_hole_diameter,-hs5645mg__mounting_hole_center_x_offset,-hs5645mg__servo_height])
cylinder(d=hs5645mg__mounting_hole_diameter , h=hs5645mg__servo_height);
}


//translate([holes_base_x+hs5645mg__frame_length-hs5645mg__mounting_hole_diameter,
   //  hs5645mg__mounting_hole_center_x_offset,
     //0,0])
//cube([-bracket_size, hs5645mg_slot_thickness, hs5645mg_slot_height]);
