module spacer(height, r_ext, r_int) {
	translate([0, 0, height / 2]) difference() {
    cylinder(r = r_ext, h = height, center = true, $fn = 80);
    cylinder(r = r_int, h = height + 2, center = true, $fn = 80);   
  }
}