include<../utils.scad>;
include<../settings.scad>;

module top() {
  top_height = 8;
  cup_height = 2;

  union() {
    difference() {
      union() {
        rotate([0, 0, 30]) translate([0, 0, top_height/2 + cup_height])
          cylinder(r = base_size+10, h = top_height/2, $fn = 3);

        for(rotation  = columns_angle_range) {
          rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
            cylinder(r = 10, h = top_height + cup_height, $fn = 80);
          }
        }
      }

      for(rotation  = columns_angle_range) {
        rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
          translate([0, 0, -1]) cylinder(r = diam_8mm_rod/2, h = 13, $fn = 80);
          translate([0, -6.5, 1]) cube([M3_blocked_nut, M3_blocked_nut_height, 16], center = true);
          translate([0, -8, top_height/2]) rotate([90, 0, 0]) cylinder(r = diam_M3/2, h = 10, center = true, $fn = 20);
        }
      }

      translate([0, 0, top_height]) {
        cylinder(r = THSL_M8_threadnut_thru, h = top_height, $fn = 40, center = true); //M8 thread pass thru
      }
    }
  }
}

// top();
