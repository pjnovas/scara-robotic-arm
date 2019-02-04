include<../utils.scad>;
include<../settings.scad>;

module nut_blocker() {
  difference() {
		hull(){
			translate([12, 0, 0]) cylinder(r = 5, h = 3, $fn = 20);            
			cylinder(r = 9, h = 3, $fn = 50);         
			translate([-12, 0, 0]) cylinder(r = 5, h = 3, $fn = 20);
		}   

		//starting difference
		cylinder(r = M8_pass_thru/2, h = 30, $fn = 40, center = true); //M8 thread pass thru    

		translate([12, 0, 0]) cylinder(r = diam_M3/2, h = 10, center = true, $fn = 20);   
		translate([-12, 0, 0]) cylinder(r = diam_M3/2, h = 10, center = true, $fn = 20);            
	}
}

// nut_blocker();