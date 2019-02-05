include<../utils.scad>;
include<../settings.scad>;

module motor_mount_z() {
  plate_height = 6;

  difference(){
    union(){
      difference(){
        rotate([0, 0, 30]) cylinder(r = base_size, h = plate_height, $fn = 66);
        translate([0, 48, 3.5]) cube([base_size*2, 45, 50], center = true);
      }

      for(rotation  = columns_angle_range) {
        rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
          cylinder(r = 12, h = plate_height, $fn = 80);
        }
      }

    }

    for(rotation  = columns_angle_range) {
      rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
        translate([0, 0, -1]) cylinder(r = diam_8mm_rod/2, h = 12, $fn = 80);
      }
    }

    //NEMA holes
    translate([0, 0, 2]) {
      cylinder(r = 15, h = 20, center = true, $fn = 80);
      translate([31/2, 31/2, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20);
      translate([-31/2, 31/2, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20);
      translate([-31/2, -31/2, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20);
      translate([31/2, -31/2, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20);
    }

  }
}

// motor_mount_z();
