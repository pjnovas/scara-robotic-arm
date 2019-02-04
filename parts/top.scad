include<../utils.scad>;
include<../settings.scad>;

module top() {
  difference() {
    union() {
      rotate([0, 0, 30])  cylinder(r = base_size+10.5, h = 15, $fn = 3);
      for(rotation  = columns_angle_range) {
        rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
          cylinder(r = 12, h = 15, $fn = 80);
        }
      }
    }

    //starting difference
    for(rotation  = columns_angle_range) {
      rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
        translate([0, 0, -1]) cylinder(r = diam_8mm_rod/2, h = 13, $fn = 80);
        translate([0, -7, 3]) cube([M3_blocked_nut, M3_blocked_nut_height, 16], center = true);
        translate([0, -8, 6]) rotate([90, 0, 0]) cylinder(r = diam_M3/2, h = 10, center = true, $fn = 20);
      }
    }

    for(rotation  =  [60:120:360]) {
      rotate([0, 0, rotation]) translate([0, base_size/2, 7]) cylinder(r = 5, h = 30, $fn = 6, center = true);
    }

    translate([0, 0, 7]) {
      cylinder(r = M8_pass_thru/2, h = 20, $fn = 40, center = true); //M8 thread pass thru    
    }
  }
}

//top();