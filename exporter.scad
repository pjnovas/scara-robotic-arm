/*
 * Use this file to export each part as STL
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

// Uncomment each part for export (remember to leave only one uncommented)
// The number is the quantity of each to print

// Platfors ////////////////////
   motor_platform();        // 2
// top();                   // 1 ---
// bottom();                // 1
// motor_mount_z();         // 1

// Arms ////////////////////////
// first_arm_bottom();      // 1
// arm_pulley();            // 1
// second_arm();            // 1
// first_arm_top();         // 1

// Spacers /////////////////////
// arms_spacer();           // 2
// base_spacer();           // 3
// first_arm_mid_spacer();  // 1
// first_arm_bot_spacer();  // 1
// first_arm_top_spacer();  // 1
// base_rod_blocker();      // 3


//////////////////////////////////////////////
//////////////////////////////////////////////
// Print times (minutes)
//
// res | fill | speed
// 0.3 | 20%  | 40 mm/s

// motor_platform           || 240 (2 x 120)
// top                      ||
// bottom                   ||
// motor_mount_z            ||
// first_arm_bottom         ||
// arm_pulley               ||
// second_arm               ||
// first_arm_top            ||
// arms_spacer              ||
// base_spacer              ||
// first_arm_mid_spacer     ||
// first_arm_bot_spacer     ||
// first_arm_top_spacer     ||
// base_rod_blocker         ||

// Total ~ YYY hours
