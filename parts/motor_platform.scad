include<../utils.scad>;
include<../settings.scad>;

module thsl_hole() {
  cylinder(r = diam_M3/2, h = 20, $fn = 40, center = true);
}

module pressHole(height, rotation, length) {
  rotate([0, 0, rotation]) translate([0, length, height/2]) {
    cylinder(r = diam_M6/2, h = height+2, center = true, $fn = 80);
  }
}

module rounded_cube(w, h, d, rdim, offset) {
  hull() {
    translate([(w-rdim)/2, (h-rdim)/2, -d/2]) cylinder(r=rdim, h=d, $fn=80);
    translate([-(w-rdim)/2, (h-rdim)/2, -d/2]) cylinder(r=rdim, h=d, $fn=80);

    translate([-(w-rdim)/2-offset, -(h-rdim)/2-offset, -d/2]) cylinder(r=rdim, h=d, $fn=80);
    translate([(w-rdim)/2+offset, -(h-rdim)/2-offset, -d/2]) cylinder(r=rdim, h=d, $fn=80);
  }
}

module motor_platform (height = 6) {
  difference() {
    union() {
      cylinder(r = base_size+6, h = height, $fn = 60);

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
            cylinder(r = 13, h = height, $fn = 80);
            translate([0, 0, height + 1]) difference() {
              cylinder(r = 13, h = 2, center = true, $fn = 80);
              cylinder(r = 11, h = 4, center = true, $fn = 80);
            }
          }
        }
      }

      translate([0, 58, height/2]) rounded_cube(40, 50, height, 5, 17);
    }

    //starting difference
    for(rotation = columns_angle_range) {
      rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
        translate([0, 0, height - 2]) cylinder(r = r_LM8UU, h = 10, $fn = 80);
        cylinder(r = r_rod, h = height*2, center = true, $fn = 80);
      }

      if (rotation == 120) { // Back hole (nema17)
        pressHole(height, rotation + 60, -base_size + 15);
      }
      else if (rotation == 0) {
        pressHole(height, rotation + 70, -base_size + 3);
      }
      else {
        pressHole(height, rotation + 50, -base_size + 3);
      }
    }

    // THSL Thread screw
    cylinder(r = THSL_M8_threadnut_thru/2, h = 20, $fn = 40, center = true); // pass thru

    // THSL Nut screws
    THSL_nut_length = 8;
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
