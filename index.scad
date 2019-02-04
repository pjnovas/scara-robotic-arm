/*************************************************************************
 * 
 * [PENDING FOR MY INFO]
 * 
 * This work is a fork of:
 * Parametrized SCARA robotic arm. Customizable (http://www.thingiverse.com/thing:3207936) by Kalium
 * Creative Commons - Attribution license. http://creativecommons.org/licenses/by/3.0/
 * 
 * Which is a remix of:
 * Scara robotic arm (http://www.thingiverse.com/thing:1241491) by Idegraaf 
 * Creative Commons - Attribution - Share Alike license. http://creativecommons.org/licenses/by-sa/3.0/
 * 
 */

include <utils.scad>;

// Parts
include <parts/bottom.scad>;
include <parts/base_spacer.scad>;
include <parts/motor_mount_z.scad>;
include <parts/base_rod_blocker.scad>;
include <parts/lower_motor.scad>;
include <parts/nut_blocker.scad>;
include <parts/arms_spacer.scad>;
include <parts/608_cap.scad>;
include <parts/first_arm_bottom.scad>;
include <parts/first_arm_bot_spacer.scad>;
include <parts/arm_pulley.scad>;
include <parts/second_arm.scad>;
include <parts/first_arm_top_spacer.scad>;
include <parts/first_arm_top.scad>;
include <parts/upper_motor.scad>;
include <parts/top.scad>;

// Update following file parameters to change settings
include <settings.scad>;

// View settings

assembly = false; // Order pieces toghether

////////////////////////////////////////////
// Rendering ------------------------------

zPositions = assembly 
	? [ 0, 25, 48, 60, 100, 110, 123, 110, 155, 164, 200] 
	: [ 0, 30, 60, 80, 100, 120, 130, 130, 190, 210, 230];

zPositionsArms = assembly ? [ 0, 0, -2, -6, 0, 20] : [ 0, 25.5, 10, 10, 0, 40];

if (assembly) {
	for (angle = columns_angle_range){
		rotate([0, 0, angle]) {
			translate([0, -base_size, zPositions[1]]) #cylinder(r = 4, h = 180, $fn = 80);	
		}  
	}
	translate([0, 0, zPositions[2]]) #cylinder(r = 4, h = 180, $fn = 80);	
}

translate([0, 0, zPositions[0]]) bottom();

for (angle = columns_angle_range){
	rotate([0, 0, angle]) {
		translate([0, -base_size, zPositions[1]]) base_spacer();
	}  
}

translate([0, 0, zPositions[2]]) motor_mount_z();

for (angle = columns_angle_range){
	rotate([0, 0, angle]) {
		translate([0, -base_size, zPositions[3]]) base_rod_blocker();
	}  
}

translate([0, 0, zPositions[4]]) lower_motor();
translate([0, 0, zPositions[5]]) nut_blocker();

// Arms
translate([0, -base_size-hle, zPositions[6]]) rotate([0, 0, 90]) {
	translate([0, 0, zPositionsArms[0]]) first_arm_bottom();
	
  translate([hle, 0, zPositionsArms[1]]) first_arm_bot_spacer();

  translate([hle, 0, zPositionsArms[2]]) arm_pulley();

	translate([-hle, 0, zPositionsArms[3]]) second_arm();
	
  translate([hle, 0, zPositionsArms[4]]) first_arm_top_spacer();

	translate([0, 0, zPositionsArms[5]]) first_arm_top();
}

// Belt Messages
translate([0, -hle*6, 0]) rotate([90, 0, 90]) color([1, 0, 0]) beltSizes();

rotate([0, 0, 60]) translate([0, base_size, zPositions[7]]) arms_spacer();
rotate([0, 0, -60]) translate([0, base_size, zPositions[7]]) arms_spacer();

translate([0, 0, zPositions[8]]) upper_motor();
translate([0, 0, zPositions[9]]) 608_cap();

translate([0, 0, zPositions[10]]) top();
