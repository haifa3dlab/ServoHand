
radius = 1.5;
dist = 10;
hight = 10;

$fn = 90;

module holes() {
    for (i = [1:4])
    {
        translate([(i%2)*dist/2, i*dist, 0])
        {
            for (j = [1:8]) 
            {
                translate([ dist*j, 0, 0 ])
                   cylinder(r = radius, h = 50);
            }
    
        }
    }
    
    //*/
    
  /*  
    color([1,0,0]) 
    for (j = [1:4]) 
    {
        translate([0.5*dist, (j-0.5)*dist*2, 0 ])
          cylinder(r = radius, h = 50);
    }
    //*/
}

h2 = 3;
w = 40;
l = 80;
rad = 1.5;

difference() 
{
    hull() {
    sphere(r=rad);
    translate([0,w,0])
       sphere(r=rad);
    translate([l,w,0])
       sphere(r=rad);
    translate([l,0,0])
       sphere(r=rad);
    }
    
    difference() {
        translate([-10,-5,-7])
            rotate([0,0,0])
               holes();
            translate([-7,0,-15])
           cube([10,50,60]);
    }
}
//*/
//cube([38,68,1]);