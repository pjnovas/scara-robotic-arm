
include<../utils.scad>;
include<../settings.scad>;

module second_arm() {
  difference() {
    union() {
      hull() {
        translate([0, 0, 2.5]) cylinder(r = 22, h = 15, center = true, $fn = 80);
        translate([-arm_length, 0, 0]) cylinder(r = 8, h = 10, center = true, $fn = 80);        
      }

      translate([-hle*2, 0, -5]) cylinder(r = 18, h = 15, $fn = 60);
      translate([0, 0, 10]) CreatePulley(1, pulley_teeth, 7);  
    }

    //starting difference
    cylinder(r = diam_M8/2, h = 60, center = true, $fn = 20);
    translate([-hle*2, 0, -10]) cylinder(r = 8, h = 60, center = true, $fn = 40);

    hull() {
      translate([-40, 0, 2.5]) cylinder(r = 11, h = 50, center = true, $fn = 80);
      translate([-arm_length+40, 0, 0]) cylinder(r = 8, h = 50, center = true, $fn = 80);      
    }

    translate([0, 0, -10 + 9]) cylinder(r = diam_M8_nut/2, h = 10, $fn = 6, center = true);
    translate([-hle*2, 0, 0]) cube([0.5, 100, 100], center = true);    
    translate([-hle*2, 8 + 5, 2]) rotate([0, 90, 0]) cylinder(r = diam_M3/2, h = 30, center = true, $fn = 15);    
    translate([-hle*2, -8 - 5, 2]) rotate([0, 90, 0]) cylinder(r = diam_M3/2, h = 30, center = true, $fn = 15);        
  }
}

// second_arm();