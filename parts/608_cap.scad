include<../settings.scad>;

module 608_cap() {
  difference(){
		hull() {
			cylinder(r = r_608 + 2 - 0.3, h = 2, $fn = 40, center = true); 
			translate([r_608 + 4, 0, 0]) cylinder(r = 4 - 0.3, h = 2, $fn = 40, center = true);      
			translate([-r_608 - 4, 0, 0]) cylinder(r = 4 - 0.3, h = 2, $fn = 40, center = true);          
			translate([0, -12, 0]) cylinder(r = 5 - 0.3, h = 2, $fn = 40, center = true);     
		}

		//starting difference
		cylinder(r = 12.5/2, h =  10, $fn = 40, center = true);

		translate([r_608 + 4, 0, 0]) cylinder(r = diam_M3/2, h = 10, $fn = 40, center = true);
		translate([-r_608 - 4, 0, 0]) cylinder(r = diam_M3/2, h = 10, $fn = 40, center = true);
	}
}

// 608_cap();