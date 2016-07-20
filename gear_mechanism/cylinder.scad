$fn=90;
rad = 27.5;
ext_rad = rad +2;
h1 = 6;  // the hight of the hole
h2 = 55; // the hight of hole cylinder
h3 = h2 - 10; // the hight of external cylinder



module basic_shape(raduis, highet, shift) {
    translate(shift)
    rotate([0,90,0]) {
        cylinder(r=raduis, h=highet);
        sphere(r=raduis,center=true);
    }
}
module hole() {
    
    basic_shape(rad, h2, [-4,0.5,rad+h1]);
}

module ext_cylinder() {
    basic_shape(rad+2, h3, [-4,0.5,rad+h1]);
    
}

difference() {
    ext_cylinder();
   // cube([2*h2,2*ext_rad, 2*h1-0.01],center=true);
   // rotate([0,5,0])
    translate([4,0.5,2*rad+8])
           cube([3*ext_rad,2*ext_rad, 2*ext_rad],center=true);

    hole();
}


