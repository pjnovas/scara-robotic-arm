
module nemaHoles(height = 20) {
  diam_motor = 23;
  r_motor = diam_motor/2;

  // cylinder(r = 12, h = 20, center = true, $fn = 80);

  hull() {
    translate([0, -5, 0]) cylinder(r = r_motor, h = height, center = true, $fn = 80);
    translate([0, 25, 0]) cylinder(r = r_motor, h = height, center = true, $fn = 80);
  }

  hole_sep = 5; // 1

  hull() {
    translate([31/2, 31/2 - hole_sep, 0]) cylinder(r = diam_M3/2, h = height, center = true, $fn = 20);
    translate([31/2, 31/2 + hole_sep, 0]) cylinder(r = diam_M3/2, h = height, center = true, $fn = 20);
  }
  hull() {
    translate([-31/2, 31/2 - hole_sep, 0]) cylinder(r = diam_M3/2, h = height, center = true, $fn = 20);
    translate([-31/2, 31/2 + hole_sep, 0]) cylinder(r = diam_M3/2, h = height, center = true, $fn = 20);
  }
  hull() {
    translate([-31/2, -31/2 - hole_sep, 0]) cylinder(r = diam_M3/2, h = height, center = true, $fn = 20);
    translate([-31/2, -31/2 + hole_sep, 0]) cylinder(r = diam_M3/2, h = height, center = true, $fn = 20);
  }
  hull() {
    translate([31/2, -31/2 - hole_sep, 0]) cylinder(r = diam_M3/2, h = height, center = true, $fn = 20);
    translate([31/2, -31/2 + hole_sep, 0]) cylinder(r = diam_M3/2, h = height, center = true, $fn = 20);
  }
}
