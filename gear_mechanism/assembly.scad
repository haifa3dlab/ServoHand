include <chen_params.scad>;
use <moreShapes.scad>;
include <../enclosure/box_params.scad>;

 dist = 7;

// Main Part
difference() {
  union() {
      
    //bottm cube
    translate([0,0,-0.1])
    cube([main_board_width+2.5, main_board_len, main_board_thinkness+0.1]);
       

        
     color("green")
     translate([0,0,main_board_thinkness-0.1])
        import("holder.stl", convexity = 5);
    
      
    color ("purple")
      translate([33,14,22]) 
       rotate ([90,0,90])
         scale([1,1,1.7])
           import("bracket.stl", convexity = 5);
      
    // servo bracket support  
    translate([servo_higeht-11.1,0.1,7.3])
      rotate([-90,0,-90])
       trapezoidPrism(0, 3.6, 7.3,0,8.5,false);
       
   }
   main_ball_holes();
   holes();
   

//   cube([servo_higeht+18,3*main_board_width,100],center=true);
//   translate([60,0,0])
//      cube([servo_higeht+20,3*main_board_width,100],center=true);
//   translate([20,-10,10])
//   cube([servo_higeht+20,3*main_board_width,100]);
//   
//   translate([20,-150,-1])
//   cube([servo_higeht+20,3*main_board_width,100]);
//   
//      translate([20,40,-1])
//   cube([servo_higeht+20,3*main_board_width,100]);
   
   
 }
        {  
        /* color ("red")   
           translate([main_board_width+10,0,0])
              rotate([0,-90,0]) 
                 cube([x_width-10, main_board_len, height*2+3]);   
            */
          color("blue")
            //translate([main_board_width+30,main_board_len/2,0])
             translate([main_board_width-14,main_board_len/2-7.5,41])
             rotate([-90,0,-90])
             import("../enclosure/box_with_holes2.stl", convexity = 5);
             //import("../enclosure/pbox.stl", convexity = 5);
       }     
 

  


//-----------------------------------------------------------------------
//*/

/*// Rack Part;

difference() {
translate([35,44.6,8.3+2*bearing_rad-bearing_depth])  
rotate ([90,0,-90])
scale([gear_scale,gear_scale,gear_scale])
   import("rack.stl", convexity = 5);
    
    
//      translate([20,-142,-1])
//   cube([servo_higeht+20,3*main_board_width,100]);
//     cube([servo_higeht+4,main_board_width/2+10,30]);
//      translate([20,39,-1])
//   cube([servo_higeht+20,4*main_board_width,100]);


      rack_ball_holes();  
    
    
}
//color("red")
//      rack_ball_holes();  
    

    color ("blue")
translate([35,main_board_len+5,2.7]) 
   rotate ([0,0,-90])
   import("tensioner.stl", convexity = 5);
   
// */
   

/*
color("green")
translate([38,35,21])  
rotate ([0,90,0])
   import("gear_with_holes.stl", convexity = 5);


color ("red")
translate([-5,-40,217])   
rotate ([0,90,0])
   import("HS5645MG_grabcad_fixed.stl", convexity = 5);
// */

module rack_ball_holes() {
           my_d = 10; 

  translate([bearing_rad-bearing_depth+servo_higeht,0,8])
    rotate([0, prism_angle, 0])
        
      union()
      {
        //cube([my_d, main_board_len, my_d]);    
        for (j = [0:7]) 
        {
            translate([ my_d/2, dist*j, my_d - bearing_depth/2])
               sphere(r = bearing_rad, $fn=20,center=false);
        }
      }

    
}

module main_ball_holes() {
       union()
    {
        // Holes on "floor"
        for (i = [0:1])
            {
                translate([servo_higeht + 0.4 + i*dist , 0,main_board_thinkness+ bearing_rad -bearing_depth-0.45])
                {
                    for (j = [1:8]) 
                    {
    
                        translate([ 0, dist*j, 0 ])
                           sphere(r = bearing_rad, $fn=20,center=false);
                    }
            
                }
            }
            
        for (j = [1:8]) 
        {
            translate([ servo_higeht-0.8-bearing_depth, dist*j, dist ])
               sphere(r = bearing_rad, $fn=20,center=false);
        }

    }
    
}
module holes() {
ydist = 60;
xdist = 40; 
for (i = [0:1])
{
    translate([10+xdist*i,0, -1])
    {
        for (j = [0:1]) 
        {
            translate([ 0, 5+ydist*j, -1 ])
               cylinder(r = 1.7, h = 50, $fn=10);
        }

    }
}

            translate([ 10, 5, 9.3 ])
               cylinder(r = 3.4, h = 50, $fn=10);


}