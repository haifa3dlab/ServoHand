// http://www.thingiverse.com/thing:213934

// ================ variables
//use <write/Write.scad>
include <box_params.scad>;

// =============== program

// ---- The box
if(do_box==1) translate([-((x_width/2+1)*do_lid),0,0]) difference() {

union() {
minkowski() // main body
{
 cube([xadj,yadj,height-lid_height],center=true);
 cylinder(r=corner_radius,h=height-lid_height);
}

translate([0,0,(lid_height-thickness)*2]) minkowski() // main body overlap
{
 cube([xadj-thickness,yadj-thickness,height-(thickness*2)],center=true);
 cylinder(r=corner_radius,h=height);
}
}

translate([0,0,thickness*1]) minkowski() // inside area
{
 cube([xadj-((thickness+snugfit)*2),yadj-((thickness+snugfit)*2),height],center=true);
 cylinder(r=corner_radius,h=height);
}

};

// ---- The lid
if(do_lid==1) translate([(x_width/2+1)*do_box,0,lid_height/2]) {

#difference() {
	minkowski() // main body
	{
 		cube([xadj,yadj,lid_height],center=true);
 		cylinder(r=corner_radius,h=lid_height);
	}

	translate([0,0,thickness]) minkowski() // inside area
	{
 		cube([xadj-(thickness-snugfit),yadj-(thickness-snugfit),lid_height],center=true);
 		cylinder(r=corner_radius,h=lid_height);

	}
/*
   translate([0,0,-thickness+0.3])
   	writecube(text=text,
			  where=[y_width/2,
			  x_width/2-textSize/4,
			  lid_thickness],
			  size=[l,w,h],
			  face="top",
			  t=textThickness,
			  h=textSize);
*/
}


	

};