

include <chen_params.scad>;

$fn = 30;
screw_diameter = 3;
external_distance = 12.35;
center_difference = external_distance - screw_diameter;



difference() {
color("blue") 
translate([0,0,-3.25])
       cylinder(d=screw_diameter*3, h=3);

color("blue") 
translate([0,0,-3.25])
       cylinder(d=screw_diameter*1.1, h=3);
}     
 

difference() {

    //scale([0.5,0.5,0.25])
    scale([gear_scale,gear_scale,1.3])
    import("Gear.stl", convexity = 5);
        translate([0,0,-10])
    cylinder(d=screw_diameter*2.3, h=20);
}   

difference() 
{
 color("red")
      translate([0,0,-2.75])
    scale([1,1,2])
   
    import("servo_horn_mm.stl", convexity = 5);
    
    difference()  {
translate([0,0,3.25])
color("magenta")
   cylinder(d=23.05, h=1.6,$fn=30);
    
translate([0,0,3.25])
color("magenta")
   cylinder(d=9.9, h=20, $fn=66);
}
}   
    /*
    translate([0,0,-10])
    cylinder(d=screw_diameter*2, h=20);
    translate([-center_difference/2,-center_difference/2,-10])
    for (x = [0,1]) {
       for (y = [0,1]) {
         translate([x*center_difference,y*center_difference,0]) 
           cylinder(d=screw_diameter, h=20);
       }
       
}*/
//}