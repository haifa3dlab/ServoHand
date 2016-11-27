include <box_params.scad>;

switch_len = 23.5;
cutout_box = [7,25,12];
external_size = [200,200,200];

/* get only part of main to save when printing
difference() {
    translate([x_width/2-9,-12.5,-8.4])
       cube(cutout_box);

    difference() 
    {
       cube(external_size, center=true);
       main();
       
    }

}
//*/

main();

module main()
{
    difference() 
    {
        union() 
        {
            rotate([0,-90,0])
               import("plid.stl", convexity = 5);
            
         translate([x_width/2-7.3,0,-6])
           cube([3,switch_len,5], center=true);

        }
        
        // the slot hole
        translate([x_width/2-7.3,0,-5])
           cube([1,switch_len-3,5], center=true);

        // the exterior hole
        translate([9,0,-2.5])
           cube([30,8,9], center=true);
        
        // the inside gap/hole
        translate([10,0,-4])
           cube([10,11,7], center=true);
        //
    }
}
    