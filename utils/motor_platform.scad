include<../utils.scad>;
include<../settings.scad>;

module motor_platform () {
  difference() {
    union() {
      rotate([0, 0, 30]) cylinder(r = base_size+6, h = 10, $fn = 12);

      for(rotation = columns_angle_range) {
        rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
          if(rotation == 0) {
            cylinder(r = 20, h = 10, $fn = 80);

            // Old Upper
            // translate([0, 0, -5]) cylinder(r = 10, h = 5, $fn = 50);
            // translate([0, base_size-12, -2.5]) cube([9, 9, 5], center = true);

            // Common (old lower)
            translate([0, 0,  -1]) cylinder(r = 10, h = 2, $fn = 50);

          } else {
            cylinder(r = 12, h = 10, $fn = 80);
            translate([0, 0, -1]) difference() {
              cylinder(r = 12, h = 2, center = true, $fn = 80);
              cylinder(r = 11, h = 4, center = true, $fn = 80);
            }
          }
        }
      }

      translate([0, 47, 5]) cube([42, 60, 10], center = true); //NEMA17
    }

    //starting difference
    for(rotation = columns_angle_range) {
      rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
        translate([0, 0, -10 + 2]) cylinder(r = r_LM8UU, h = 10, $fn = 80);
        cylinder(r = r_rod, h = 40, center = true, $fn = 80);
      }
    }
  }
}
