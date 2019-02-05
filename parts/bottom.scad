
include<../utils.scad>;
include<../settings.scad>;

module bottom() {
	difference() {
		union(){
			cylinder(r2 = base_size+10, r1 = base_size+28, h = 20, $fn = 100);

			for(rotation = columns_angle_range) {
				rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
					cylinder(r = 12, h = 25, $fn = 80);
				}

				rotate([0, 0, rotation + 60]) translate([0, -base_size-20, 0]) {
					cylinder(r = 5, h = 15, $fn = 80);
				}
			}
		}

		for(rotation = columns_angle_range) {
			rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
				translate([0, 0, 4]) cylinder(r = diam_8mm_rod/2, h = 40, $fn = 40);
				translate([0, -7, 23]) cube([M3_blocked_nut, M3_blocked_nut_height, 15], center = true);
				translate([0, -8, 21]) rotate([90, 0, 0]) cylinder(r = diam_M3/2, h = 10, center = true, $fn = 20);
			}

			rotate([0, 0, rotation + 60]) translate([0, -base_size-20, 0]) {
				cylinder(r = diam_M5/2, h = 50, $fn = 80, center = true);
			}
		}

		cylinder(r = 29, h = 80, $fn = 40, center = true);
	}
}

// bottom();
