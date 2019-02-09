include<../utils.scad>;
include<../settings.scad>;

module thsl_hole() {
  cylinder(r = diam_M3/2, h = 20, $fn = 40, center = true);
}

module motor_platform (height = 6) {
  difference() {
    union() {
      rotate([0, 0, 30]) cylinder(r = base_size+6, h = height, $fn = 60);

      for(rotation = columns_angle_range) {
        rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
          if(rotation == 0) {
            cylinder(r = 20, h = height, $fn = 80);

            // Old Upper
            // translate([0, 0, -5]) cylinder(r = 10, h = 5, $fn = 50);
            // translate([0, base_size-12, -2.5]) cube([9, 9, 5], center = true);

            // Common (old lower)
            translate([0, 0, height]) cylinder(r = 10, h = 2, $fn = 50);

          } else {
            cylinder(r = 12, h = height, $fn = 80);
            translate([0, 0, height + 1]) difference() {
              cylinder(r = 12, h = 2, center = true, $fn = 80);
              cylinder(r = 11, h = 4, center = true, $fn = 80);
            }
          }
        }
      }

      translate([0, 55, height/2]) cube([42, 60, height], center = true); //NEMA17
    }

    //starting difference
    for(rotation = columns_angle_range) {
      rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
        translate([0, 0, height - 2]) cylinder(r = r_LM8UU, h = 10, $fn = 80);
        cylinder(r = r_rod, h = height*2, center = true, $fn = 80);
      }
    }

    // THSL Thread screw
    cylinder(r = THSL_M8_threadnut_thru/2, h = 20, $fn = 40, center = true); // pass thru

    // THSL Nut screws
    THSL_nut_length = 7.5;
    translate([0, -THSL_nut_length, 0]) thsl_hole();
    translate([-THSL_nut_length, 0, 0]) thsl_hole();
    rotate([0, 0, 180]) {
      translate([0, -THSL_nut_length, 0]) thsl_hole();
      translate([-THSL_nut_length, 0, 0]) thsl_hole();
    }

    // Motor Mount holes
    translate([0, 60, 0.1]) nemaHoles(height*2); // original Y = 50
  }
}
