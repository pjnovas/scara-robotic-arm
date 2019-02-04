
include<../utils.scad>;
include<../settings.scad>;

module first_arm_bottom() {
  difference() {
    hull(){
      translate([hle, 0, 0]) { //right end
        cylinder(r = 22, h = 25, center = true, $fn = 80);
        translate([-hle*2 + 33, 0, 0]) cylinder(r = 6, h = 25, center = true, $fn = 20);
      }
    }

    translate([0, 0, 6.5])
    difference() {
      cube([200, 200, 18], center = true);    

      m = 8;

      hull() {
        translate([4+m, 0, -30]) cylinder(r = hle-27-m, h = 70);
        translate([-hle, 0, -30]) cylinder(r = hle-27-m, h = 70);    
      }
    }

    //starting difference
    translate([hle-27, 0, 0]) cylinder(r = diam_M3/2, h = 60, center = true, $fn = 20);
    translate([-hle+33, 0, 0]) cylinder(r = diam_M3/2, h = 60, center = true, $fn = 20);  

    translate([hle, 0, 0]) { //right end
      cylinder(r = 12, h = 60, center = true, $fn = 80);
      translate([0, 0, -23/2 + 5 - 2]) cylinder(r = r_6022, h = 10, center = true, $fn = 80);   
    }
  }
}

// first_arm_bottom();