include<../utils.scad>;
include<../settings.scad>;

module lower_motor() {
  difference() {
    translate([0, 0, 10]) rotate([0, 180, 0]) motor_platform();

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
