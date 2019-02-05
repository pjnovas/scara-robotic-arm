module beltSizes() {
  text(str("BELT 1 length: ", tooth_spacing (2, 0.254, pulley_teeth)*3.14+arm_length*2, " mm"));

  // C = 50 + base_size; > original: belt 260 mm

  center_arm_motor_shaft = 62; // > check motor_platform.nemaHoles translate Y
  C = center_arm_motor_shaft + base_size;
  d1 = tooth_spacing(2, 0.254, pulley_teeth);
  d2 = diam_GT2_20T;

  translate([0, -20, 0]) text(str("BELT 2 length: ", 2*C+1.57*(d1+d2)+((d1-d2)*(d1-d2))/(4*C), " mm"));
}
