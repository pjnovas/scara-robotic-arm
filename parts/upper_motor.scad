include<../utils.scad>;
include<../settings.scad>;

module upper_motor() {
  difference() {
    union() {
      rotate([0, 0, 30]) cylinder(r = base_size+10.5, h = 10, $fn = 3);

      for(rotation  = columns_angle_range) {
        rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
          if(rotation == 0) {
            cylinder(r = 20, h = 10, $fn = 80);
            translate([0, 0, -5]) cylinder(r = 10, h = 5, $fn = 50);  
            translate([0, base_size-12, -2.5]) cube([9, 9, 5], center = true);
          } else {
            cylinder(r = 12, h = 10, $fn = 80);
            translate([0, 0, -1]) difference() {
              cylinder(r = 12, h = 2, center = true, $fn = 80);
              cylinder(r = 11, h = 4, center = true, $fn = 80);
            }
          }
        }
      }

      translate([0, 47, 5]) cube([42, 48, 10], center = true); //NEMA17
    }

    //starting difference  
    for(rotation  = columns_angle_range) {
      rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
        translate([0, 0, -10 + 2]) cylinder(r = r_LM8UU, h = 10, $fn = 80);    
        cylinder(r = r_rod, h = 40, center = true, $fn = 80);    
      }
    }

    translate([0, 0, 4]) cylinder(r = 12.5/2, h = 20, $fn = 40, center = true); //M8 pass inside bearing
    translate([0, 0, -5 + 11]) cylinder(r = r_608, h = 10, $fn = 40, center = true); //bearing  
    
    //608zz cap,  hole for
    translate([0, 0, 10]) {
      hull() {
        cylinder(r = r_608 + 2, h = 4, $fn = 40, center = true);   
        translate([r_608 + 4, 0, 0]) cylinder(r = 4, h = 4, $fn = 40, center = true);      
        translate([-r_608 - 4, 0, 0]) cylinder(r = 4, h = 4, $fn = 40, center = true);    
        translate([0, -12, 0]) cylinder(r = 5, h = 4, $fn = 40, center = true);    
      }
    }

    translate([0, -12, -3]) cylinder(r = M3_nut/2, h = 12, $fn = 30);

    //main screws
    translate([0, -12, -10]) color([1, 0, 0]) cylinder(r = diam_M3/2, h = 40, $fn = 30);
    rotate([0, 0, -60]) translate([0, base_size-17, -10]) color([1, 0, 0]) cylinder(r = diam_M3/2, h = 30, $fn = 30);
    rotate([0, 0, 60]) translate([0, base_size-17, -10]) color([1, 0, 0]) cylinder(r = diam_M3/2, h = 30, $fn = 30);
    translate([r_608 + 4, 0, 10]) cylinder(r = diam_M3/2, h = 20, $fn = 40, center = true);          
    translate([-r_608 - 4, 0, 10]) cylinder(r = diam_M3/2, h = 20, $fn = 40, center = true);     

    //end of 608zz cap,  hole for
    //NEMA holes
    translate([0, 50, 7]) nemaHoles();
  }
}

// upper_motor();