include <box_params.scad>;

//rotate([0,90,0])
//translate([-x_width/2,-y_width/2,-height/2])
     //translate([x_width/2,y_width/2,height/2])
        //rotate([0,-90,0])
union() {
difference() 
{
import("pbox.stl", convexity = 5);
        

    
// hole for USB Power
color("blue")
        translate([24,14,7])
          cube([15,18,16]);

// hole for sensor connection
color("red")
    translate([-30,17,7])
          cube([13,13,13]);

/*
// hole for switch
color("green")
        translate([x_width/2,-height,0])
    rotate([0,0,90])
    translate([-1,37,7])
          cube([20,12,17]);



// hole for servo
color("orange")
    translate([33.2,0,4])
    // translate([5,-1,5])
          cube([5,5,5]);

*/
    }

}
    