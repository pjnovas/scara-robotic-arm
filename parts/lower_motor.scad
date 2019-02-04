
include<../utils.scad>;
include<../settings.scad>;

module lower_motor() {
  difference() {
    union() {  
      rotate([0, 0, 30]) cylinder(r = base_size+10.5, h = 10, $fn = 3);

      for(rotation  = columns_angle_range) {
        rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
          if(rotation == 0) {
            cylinder(r = 20, h = 10, $fn = 80);
            translate([0, 0, 9]) cylinder(r = 10, h = 2, $fn = 50);

          } else {
            cylinder(r = 12, h = 10, $fn = 80);
            translate([0, 0, 11]) difference() {
              cylinder(r = 12, h = 2, center = true, $fn = 80);
              cylinder(r = 11, h = 4, center = true, $fn = 80);
            }
          }
        }
      }

      translate([0, 47, 7.5]) cube([42, 48, 5], center = true); //NEMA17
    }
    
    //starting difference   
    for(rotation  = columns_angle_range) {
      rotate([0, 0, rotation]) translate([0, -base_size, 0]) {
        translate([0, 0, 8]) cylinder(r = r_LM8UU, h = 20, $fn = 80);    
        cylinder(r = r_rod, h = 40, center = true, $fn = 80);
      }
    }

    translate([0, 0, 3]) {
      cylinder(r = M8_nut/2, h = 10, $fn = 6);//M8 NUT
      cylinder(r = M8_pass_thru/2, h = 20, $fn = 40, center = true);//M8 thread pass thru    
    }

    //two holes for blocked nut    
    translate([12, 0, 5]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20);   
    translate([-12, 0, 5]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20);    

    //main screws    
    translate([0, -12, 5]) color([1, 0, 0]) cylinder(r = diam_M3/2, h = 20, $fn = 40, center = true); 
    rotate([0, 0, -60]) translate([0, base_size-17, -10]) color([1, 0, 0]) cylinder(r = diam_M3/2, h = 30, $fn = 30);
    rotate([0, 0, 60]) translate([0, base_size-17, -10]) color([1, 0, 0]) cylinder(r = diam_M3/2, h = 30, $fn = 30);

    //NEMA holes
    translate([0, 50, 7]) nemaHoles();
  }

}

// lower_motor();