
radius = 1.5;
dist = 10;
hight = 15;

$fn = 90;


for (i = [1:9])
{
    translate([(i%2)*dist/2, i*dist, 0])
    {
        for (j = [1:4]) 
        {
            translate([ dist*j, 0, 0 ])
               cylinder(r = radius, h = 50);
        }

    }
}

//*/

color([1,0,0]) 
for (j = [1:5]) 
{
    translate([0.5*dist, (j-0.5)*dist*2, 0 ])
      cylinder(r = radius, h = 50);
}

//*/
//cube([38,68,1]);