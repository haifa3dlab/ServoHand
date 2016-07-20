

include <chen_params.scad>;

$fn = 30;
screw_diameter = 3;
external_distance = 12.35;
center_difference = external_distance - screw_diameter;


difference() {

    //scale([0.5,0.5,0.25])
    scale([gear_scale,gear_scale,0.8])
    import("Gear.stl", convexity = 5);
    
    translate([0,0,-10])
    cylinder(d=screw_diameter*2, h=20);
    translate([-center_difference/2,-center_difference/2,-10])
    for (x = [0,1]) {
       for (y = [0,1]) {
         translate([x*center_difference,y*center_difference,0]) 
           cylinder(d=screw_diameter, h=20);
       }
}
}