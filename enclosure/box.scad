// snap fit idea copied from
// http://www.thingiverse.com/thing:1215150

include <box_params.scad>;

// =============== program

use <MCAD/boxes.scad>;


// Generate the box
do_box=1; // [0:no,1:yes]

// Generate a lid
do_lid=1; // [0:no,1:yes]


size = [height, y_width, x_width ];
// outer shell

module outer_shell(size, radius) {
  outer_size = [height + 3*thickness , 
                y_width + 3*thickness , 
                x_width + 3*thickness];
  roundedBox(outer_size, radius, false);
}

module inner_shell(size, radius) {
  roundedBox(size, radius, false);
}

module inner_core(size, radius) {
    inner_size = [height - 2*thickness , 
                y_width - 2*thickness , 
                x_width - 2*thickness];
    roundedBox(inner_size, radius, false);
}

module external_box(size, radius) {
  tol_size = [height + 2*tol , 
                y_width + 2*tol , 
                x_width + 2*tol];
  difference() {
    outer_shell(size, radius);
    inner_shell(tol_size, 0);
  } 
}



module internal_box(size, radius) {
  difference() {
    inner_shell(size, radius);
    inner_core(size,0);
  } 
}

module card_holder() {
  difference() {
    internal_box(size, radius);
    translate([-height+1.5*thickness,0,0])
      cube(size, center=true);
    

    switch_hole();
    // hole for cables
    translate([main_hole_width/2-height/2, -y_width/2, 0])
      cube([main_hole_width+lid_thickness, thickness*3, main_hole_len], center=true);
  }
  teeth();
  

}

base_teeth_shift = -2.5;
module base_part() {
  cut_size = [height + 4*thickness , 
              y_width + 4*thickness , 
              x_width + 4*thickness];
  difference() {
    external_box(size, radius);
    translate([lid_thickness-2,0,0])
      cube(cut_size, center=true);
      translate([base_teeth_shift,0,0])
    teeth();
    translate([6,0,0])
      switch_hole();
  }
}

module switch_hole() {
    // switch hole
    //translate([2*thickness, y_width/2, 0])
      translate([switch_hole_width/2-height/2, y_width/2, 0])
      cube([switch_hole_width+lid_thickness, thickness*3, switch_hole_len], center=true);
}

module tooth(len) {
  points = [[-tooth_width/2,0],
            [0, tooth_height],
            [tooth_width/2, 0]];
  linear_extrude(height = len )
     polygon(points);
  
}

module teeth() {
 /* vertical back
  translate([-height/2+tooth_width+thickness,y_width/2,-tooth_thickness/2])
   tooth(tooth_thickness);
  */
    translate([-height/2+lid_thickness/2,tooth_thickness/2,x_width/2])
    rotate([90,0,0])
       tooth(tooth_thickness);
    translate([-height/2+lid_thickness/2,-tooth_thickness/2,-x_width/2])
    rotate([-90,0,0])
       tooth(tooth_thickness);
}

if (do_box) {
  translate([-x_width/2-3*thickness,0,height/2+thickness])
    rotate([0,-90,0])
    //%  translate([-base_teeth_shift,0,0])
        base_part();
}

if (do_lid) {
  translate([x_width/2+3*thickness,0,height/2])
    rotate([0,90,0])
   card_holder();
}


