
$fn = 180;
inner_radius = 1.7;
outer_radious = 2.2;
highet = 3;

hole_r = .5;
hole_h = outer_radious;

module slot() {
    rotate([90,0,0])
       cylinder(r=hole_r, h= hole_h);
}

module ring() {
    difference() {
        union() {
            cylinder(r=outer_radious, h= highet);
         }
         
       translate([0,0,-5])
          cylinder(r=inner_radius, h= highet+10);  
         
       slot();
       translate([0,0,highet])
         slot();
    }
}

ring();

