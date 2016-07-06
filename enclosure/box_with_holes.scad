
union() {
    difference() 
    {
        translate([65,40,0])  // bring to origin
           import("box.stl", convexity = 5);
       
    
// hole for USB Power
color("blue")
        translate([5,-1,5])
          cube([6,20,30]);

// hole for servo and sensor connection
color("red")

    translate([16,-1,5])
          cube([21,15,17]);


// hole for switch
color("green")
    translate([-1,37,7])
          cube([20,12,17]);



// hole for servo
color("orange")
    translate([12,65,5])
          cube([15,13,17]);
    
    }

}
    
