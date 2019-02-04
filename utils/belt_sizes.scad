
arm_length = 89;

module beltSizes() {
  text(str("BELT 1 length: ", tooth_spacing (2, 0.254, pulley_teeth)*3.14+arm_length*2, " mm"));
  C = 50+base_size;
  d1 = tooth_spacing(2, 0.254, pulley_teeth);
  d2 = diam_GT2_20T;
  translate([0, -20, 0]) text(str("BELT 2 length: ", 2*C+1.57*(d1+d2)+((d1-d2)*(d1-d2))/(4*C), " mm"));
}
