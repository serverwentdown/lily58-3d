// Higher definition curves
$fa = 8;
$fs = 0.4;

// Switch style
low_profile = false;
// Controller is socketed
socketed = false;
// Full size cavity
full_size_cavity = true;
// Battery thickness
battery_thickness = 7.5;

use <lily58plate.scad>
use <lily58base.scad>

include <BOSL/constants.scad>
use <BOSL/shapes.scad>


/*
translate([-97, -125, -2]) color("red", 0.8) {
	linear_extrude(0.1) import("lily58-B_Cu.svg", $fn=8);
	linear_extrude(0.1) import("lily58-F_Cu.svg", $fn=8);
}
*/

module cover(low_profile = false) {
	height = socketed ? 7.5 + battery_thickness : 2 + battery_thickness;
	pcb_thick = 1.6;

	difference() {
		translate([-14.95, -2.8, -pcb_thick]) cuboid([28.8, 48.8+2.8, height+pcb_thick], fillet=1, edges=EDGES_Z_ALL+EDGES_TOP, center=false);

		translate([-97, -125, -0.05]) plate(low_profile=low_profile);
		translate([-97, -125, -pcb_thick]) linear_extrude(pcb_thick) offset(0.05) import("lily58_BOTTOM-Frame.svg");

		// Mounting
		bolt_thick = 1.5;
		bolt_width = 4.7;
		slot_width = bolt_width * cos(30);
		translate([11, 0, 0]) cylinder(6, d=2.4);
		translate([11, 0, 6]) rotate([0, 0, 30]) cylinder(bolt_thick, d=4.7, $fn=6);
		translate([11-slot_width/2, 0, 6]) cuboid([slot_width, slot_width, bolt_thick], center=false);
		translate([-11, 0, 0]) cylinder(6, d=2.4);
		translate([-11, 0, 6]) rotate([0, 0, 30]) cylinder(bolt_thick, d=4.7, $fn=6);
		translate([-11-slot_width/2, 0, 6]) cuboid([slot_width, slot_width, bolt_thick], center=false);

		// Reset
		translate([-12.2, 17.35, 0]) cylinder(20, d=1.6);

		translate([3.45, 7, 0]) union() {
			difference() {
				union() {
					if (full_size_cavity) {
						step = 1.8;
						translate([-14.5, -5, 0]) cuboid([24, 46, step], align=[1, 1, 1]);
						translate([-14.5, -5, step]) cuboid([24, 44, height-1-step], align=[1, 1, 1]);
					} else {
						// Controller Cavity
						cuboid([20, 40, 7.5], align=[0, 1, 1]);
						// Battery Cavity
						translate([0, -3, 0]) cuboid([16, 43, 14.5], align=[0, 1, 1]);
					}
				}
				if (socketed) {
					// Support
					translate([0, 40, 0]) cuboid([20, 2, 2], align=[0, -1, 1]);
				}
			}
			// USB socket
			translate([0, 40-12+2, socketed ? 2 : -0.5]) cuboid([12, 12, 4], align=[0, 1, 1], fillet=2, edges=EDGES_Y_ALL);
		}
	}
}

scale([1.007, 1.007, 1.000]) cover(low_profile=low_profile);
