//CUSTOMIZER VARIABLES

// Wall thickness in mm
thickness=2.5; // [1:10]
// in mm
x_width=45;

// in mm
y_width=75;

// in mm
height=18/2;


// Corner roundover in mm (0=sharp corner)
radius=2; // [0:50]

// Generate the box
do_box=1; // [0:no,1:yes]

// Generate a lid
do_lid=0; // [0:no,1:yes]

// height in mm
lid_thickness=6;

//CUSTOMIZER VARIABLES END

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