// Higher definition curves
$fa = 8;
$fs = 0.4;

use <lily58plate.scad>
use <lily58base.scad>

include <BOSL/constants.scad>
use <BOSL/shapes.scad>

/*
translate([-97, -125, 0]) color("blue", 0.2) {
	linear_extrude(0.1) import("lily58-B_Cu.svg", $fn=8);
	linear_extrude(0.1) import("lily58-F_Cu.svg", $fn=8);
}
*/

difference() {
	translate([-14.95, -2.8, -1.5]) cuboid([28.8, 48.8+2.8, 15+1.5], fillet=2, edges=EDGES_Z_ALL+EDGES_TOP, center=false);

	translate([-97, -125, 0]) plate();
	translate([-97, -125, -1.5]) linear_extrude(1.5) offset(0.1) import("lily58_BOTTOM-Frame.svg");

	// Mounting
	translate([11, 0, 6]) cylinder(15, d=4.2);
	translate([11, 0, 0]) cylinder(6, d=2.4);
	translate([-11, 0, 6]) cylinder(15, d=4.2);
	translate([-11, 0, 0]) cylinder(6, d=2.4);

	translate([3.45, 7, 0]) difference() {
		union() {
			// Controller Cavity
			cuboid([20, 40, 7.5], align=[0, 1, 1]);
			// USB socket
			translate([0, 40, 2]) cuboid([12, 6, 4], align=[0, 1, 1], fillet=2, edges=EDGES_Y_ALL);

			// Battery Cavity
			translate([0, -3, 0]) cuboid([16, 43, 14.5], align=[0, 1, 1]);
		}
		translate([0, 40, 0]) cuboid([20, 2, 2], align=[0, -1, 1]);
	}
}
