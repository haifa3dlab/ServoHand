//CUSTOMIZER VARIABLES

// Wall thickness in mm
thickness=1.4; // [1:10]
// in mm
x_width=35;

// in mm
y_width=55;

// in mm
height=17;

// toleranse 
tol = 0.5;


// Corner roundover in mm (0=sharp corner)
radius=1; // [0:50]


// height in mm
lid_thickness=10;

tooth_angle = 104;
tooth_height = 1.5;
tooth_thickness = 12.4;
tooth_width = 2* tooth_height*tan(tooth_angle/2);

switch_hole_width = 7;
switch_hole_len = 11; // if switch in box
switch_len = 20.5;

main_hole_width = 7;
main_hole_len = 15; // if switch in box
//-----

// Screw pilot hole size
screw_pilot=1.125*1;

// Screw hole size
screw_hole=2.5*1;

// Whether you want the screw countersunk
screw_countersink=0*1;

text="";
textSize=14;
textThickness=2;

// =============== calculated variables
lid_height=height/4+min(height/4,lid_thickness);
corner_radius=min(radius,x_width/2,y_width/2);
xadj=x_width-(corner_radius*2);
yadj=y_width-(corner_radius*2);
snugfit=0.5/2;