
include<../utils.scad>;
include<../settings.scad>;

module bottom() {
	difference() {
    cylinder(r2 = base_size+10, r1 = base_size+20, h = 25, $fn = 100);

		for(rotation = columns_angle_range) {
      rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
				translate([0, 0, 2]) cylinder(r = diam_8mm_rod/2, h = 40, $fn = 40);
			}

			rotate([0, 0, rotation + 60]) {
        translate([0, -base_size-2, 0]) {
				  cylinder(r = diam_M5/2, h = 50, $fn = 80, center = true);
        }

        translate([0, -base_size-12, 20]) rotate([0, 0, 64]) {
          cylinder(r = 40, h = 20, $fn = 7, center = true);
        }
			}
		}

		cylinder(r = 29, h = 80, $fn = 40, center = true);
	}
}

// bottom();
