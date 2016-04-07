
union() {
    difference() {
        translate([30,40,0])  // bring to origin
           import("box.stl", convexity = 5);
       
    
// hole for USB Power
color("blue")
        translate([5,-1,7])
          cube([10,20,30]);

// hole for switch
color("green")
    translate([-1,35,5])
          cube([20,11,17]);

// hole for servo and sensor connection
color("red")

    translate([30,-1,6])
          cube([25,15,17]);


// hole for servo
color("orange")
    translate([25,75,5])
          cube([15,15,17]);
    
    }

}
    
