
include<../utils.scad>;
include<../settings.scad>;

module first_arm_top() {
  difference() {
    union() {
      translate([0, 0, -2.5]) cube([arm_length, 32.5, 10], center = true);

      translate([-hle, 0, 0]) { //left end
        translate([0, 0, -2.5]) cylinder(r = 22, h = 10, center = true, $fn = 80);
        translate([0, 0, -2.5]) cylinder(r1 = 18, r2 = 13.9, h = 17.5, $fn = 80);        
      }

      translate([hle, 0, 0]) { //right end
        translate([0, 0, -2.5]) cylinder(r = 22, h = 10, center = true, $fn = 80);
        translate([0, 0, 2.5]) CreatePulley(1, pulley_teeth, 7);    
      }

      //ribs    
      sp = 2.9;
      le = arm_length-20;
      le2 = le*2;

      hull(){
        translate([-hle+10/2, 13.9-sp/2, 17.5/2 - 2.5]) cube([10, sp, 17.5], center = true);
        translate([-hle+le-10, 13.9-sp/2, 17.5/2 - 7]) cube([20, sp, 1], center = true);    
      }

      hull(){
        translate([-hle+10/2, -13.9+sp/2, 17.5/2 - 2.5]) cube([10, sp, 17.5], center = true);
        translate([-hle+le-10, -13.9+sp/2, 17.5/2 - 7]) cube([20, sp, 1], center = true);    
      }
    }
    
    //starting difference
    translate([-hle, 0, 0]) { //left end
      translate([0, 0, -4.5]) cylinder(r = r_608, h = 10, center = true, $fn = 80);
      translate([0, 0, 17.5 + 2.5 - 7]) cylinder(r = r_608, h = 10, center = true, $fn = 80);
      cylinder(r = 9, h = 60, center = true, $fn = 80);    
      translate([33, 0, 0]) cylinder(r = diam_M3/2, h = 60, center = true, $fn = 20);        
    }

    translate([hle, 0, 0]) { //right end
      cylinder(r = 12, h = 60, center = true, $fn = 80);
      translate([0, 0, -30 + 9.5 - 4]) cylinder(r = r_6022, h = 60, center = true, $fn = 80);
      translate([-27, 0, 0]) cylinder(r = diam_M3/2, h = 60, center = true, $fn = 20);
    }
  }
}

// first_arm_top();