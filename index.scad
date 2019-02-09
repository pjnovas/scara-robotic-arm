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
include <parts/motor_platform.scad>;
include <parts/bottom.scad>;
include <parts/base_spacer.scad>;
include <parts/motor_mount_z.scad>;
include <parts/base_rod_blocker.scad>;;
include <parts/arms_spacer.scad>;
include <parts/first_arm_bottom.scad>;
include <parts/first_arm_mid_spacer.scad>;
include <parts/arm_pulley.scad>;
include <parts/second_arm.scad>;
include <parts/first_arm_bot_spacer.scad>;
include <parts/first_arm_top_spacer.scad>;
include <parts/first_arm_top.scad>;
include <parts/top.scad>;

// Update following file parameters to change settings
include <settings.scad>;

// View settings

assembly = false; // Order pieces toghether

////////////////////////////////////////////
// Rendering ------------------------------

zPositions = assembly
	? [ 0, 25, 48, 58, 104, 110, 123, 110, 160, 164, 200]
	: [ 0, 30, 60, 80, 100, 120, 130, 130, 200, 210, 230];

zPositionsArms = assembly ? [ 0, -4, 8, -2, -6, 27, 20] : [ 0, 0, 22, 6, 10, 52, 40];

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

translate([0, 0, zPositions[4]]) motor_platform();

// Arms
translate([0, -base_size-hle, zPositions[6]]) rotate([0, 0, 90]) {
	translate([0, 0, zPositionsArms[0]]) first_arm_bottom();

  translate([hle, 0, zPositionsArms[1]]) first_arm_mid_spacer();

  translate([hle, 0, zPositionsArms[2]]) first_arm_bot_spacer();

  translate([hle, 0, zPositionsArms[3]]) arm_pulley();

	translate([-hle, 0, zPositionsArms[4]]) second_arm();

  translate([hle, 0, zPositionsArms[5]]) first_arm_top_spacer();

	translate([0, 0, zPositionsArms[6]]) first_arm_top();
}

// Belt Messages
translate([0, -hle*6, 0]) rotate([90, 0, 90]) color([1, 0, 0]) beltSizes();

rotate([0, 0, 60]) translate([0, base_size, zPositions[7]]) arms_spacer();
rotate([0, 0, -60]) translate([0, base_size, zPositions[7]]) arms_spacer();

translate([0, 0, zPositions[8]]) rotate([0, 180, 0]) motor_platform();

translate([0, 0, zPositions[10]]) top();
