
module nemaHoles() {
  cylinder(r = 15, h = 20, center = true, $fn = 80);    
  
  hull() {    
    translate([31/2, 31/2 - 1, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20); 
    translate([31/2, 31/2 + 1, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20);    
  }    
  hull() {
    translate([-31/2, 31/2 - 1, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20); 
    translate([-31/2, 31/2 + 1, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20);
  }  
  hull() {
    translate([-31/2, -31/2 - 1, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20); 
    translate([-31/2, -31/2 + 1, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20);    
  }    
  hull() {
    translate([31/2, -31/2 - 1, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20); 
    translate([31/2, -31/2 + 1, 0]) cylinder(r = diam_M3/2, h = 20, center = true, $fn = 20);    
  }
}