
include<../utils.scad>;
include<../settings.scad>;

module arm_pulley() {
  difference() {
    CreatePulley(12*2, pulley_teeth, 13); 
    translate([0, 0, 13/2 - 2]) cylinder(r = r_6022, h = 13, center = true, $fn = 80);    
  }
}

// arm_pulley();