// Higher definition curves
$fa = 8;
$fs = 0.4;

// Switch style
low_profile = false;
// Controller is socketed
socketed = false;
// Full size cavity
full_size_cavity = true;
// Battery thickness. Original design is 8mm. New design is 7mm. Include adhesive thickness.
battery_thickness = 7.5;

use <lily58plate.scad>
use <lily58base.scad>

include <BOSL/constants.scad>
use <BOSL/shapes.scad>



translate([-97, -125, -2]) color("red", 0.4) {
	linear_extrude(0.1) import("lily58-B_Cu.svg", $fn=8);
	linear_extrude(0.1) import("lily58-F_Cu.svg", $fn=8);
}


module cover(low_profile = false) {
    width = 28.2;
    depth = 54.3;
    top_thick = 0.75;
	height = socketed ? 5.5 + 1.6 + battery_thickness + top_thick : 2.5 + battery_thickness + top_thick;
	pcb_thick = 1.6;

	difference() {
		//translate([-14.7, -3, -pcb_thick]) cuboid([29, 48.8+2.8, height+pcb_thick], fillet=2, edges=EDGES_Z_ALL, center=false);
        translate([-14.2, 51.55-depth, -pcb_thick]) cuboid([width, depth-3.5, height+pcb_thick], fillet=1.2, edges=EDGES_Z_ALL, center=false);

		translate([-97, -125, -0.05]) plate(low_profile=low_profile);
		translate([-97, -125, -pcb_thick]) linear_extrude(pcb_thick) offset(0.1) import("lily58_BOTTOM-Frame.svg");

		// Mounting
		bolt_thick = 1.3;
		bolt_width = 4.7;
        bolt_position = 6;
		slot_width = bolt_width * cos(30);
        slot_length = 5;
		translate([11, 0, 0]) cylinder(bolt_position, d=2.4);
		translate([11, 0, bolt_position-0.2]) rotate([0, 0, 30]) cylinder(bolt_thick+0.2, d=4.7, $fn=6);
		translate([11-slot_width/2, 0, bolt_position]) cuboid([slot_width, slot_length, bolt_thick], center=false);
		translate([-11, 0, 0]) cylinder(bolt_position, d=2.4);
		translate([-11, 0, bolt_position-0.2]) rotate([0, 0, 30]) cylinder(bolt_thick+0.2, d=4.7, $fn=6);
		translate([-11-slot_width/2, 0, bolt_position]) cuboid([slot_width, slot_length, bolt_thick], center=false);

		// Reset
		translate([-12.6, 17.35, 0]) cylinder(20, d=1.8);
		translate([-12.1, 17.35, 0]) cuboid([3.75, 8.5, 4.75], align=[0, 0, 1]);

		translate([3.45, 7, 0]) union() {
			difference() {
				union() {
					if (full_size_cavity) {
						step = 1.7;
                        // Controller
						translate([0, -4.9, 0]) cuboid([19.5, 46, step], align=[0, 1, 1]);
						translate([0, -4.9, 0]) cuboid([12.5, 45.5, step+0.2], align=[0, 1, 1]);
                        // Remaining cavity
						translate([-15, -4.9, 0]) cuboid([24.5, 44.7, height-top_thick], align=[1, 1, 1]);
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
			translate([0, 40-12+2, socketed ? 2 : -0.5]) cuboid([11, 12, 3.5], align=[0, 1, 1], fillet=1.5, edges=EDGES_Y_ALL);
		}
	}
}

cover(low_profile=low_profile);
// Correction: 0% infill, PETG, Rev 1
//scale([1.007, 1.007, 1.000]) cover(low_profile=low_profile);
