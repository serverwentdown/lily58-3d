// Higher definition curves
$fa = 8;
$fs = 0.4;

// Switch style
low_profile = false;
// Case for both sides
pair = false;

use <module-bevelextrude.scad>

module hex_mount(l=3, hex=1.55, height=1.5, thick=5) {
    difference() {
        translate([0, -thick/2, 0]) cube([l, thick, height]);
        translate([0, -hex/2, height/2]) cube([l, hex, height/2]);
        translate([0, 0, height-hex/cos(30)/2]) rotate([0, 90, 0]) cylinder(l, d=hex/cos(30), $fn=6);
    }
}

module case_side(low_profile = false, pair = false) {
    /*
    translate([0, 0, 0]) color("blue", 0.2) {
        linear_extrude(0.1) import("lily58-B_Cu.svg", $fn=8);
        linear_extrude(0.1) import("lily58-F_Cu.svg", $fn=8);
    }
    */
    //translate([0, 0, -4]) bevel_extrude(4, bevel_depth=1, bottom=true) offset(0.1) import("lily58_BOTTOM-Frame.svg");
	// Height of the plate
	plate_height = low_profile ? 2.2 : 5;
	// Height between the PCB and top of key
	pcb_key_height = low_profile ? 12.5 : 20;
	// Height between the plate and top of key
    plate_key_height = pcb_key_height - plate_height;
	// Height of the hex holder
	holder_height = 1.6;
	// Additional height between key and plate
	over_height = holder_height + 0.4;
	// Total height for the supports
    support_height = plate_key_height + over_height;
	// Height of the base
	base_height = low_profile ? 0 : 0;
	// Height of the PCB
	pcb_height = 1.6;
	// Total height of the hole
	height = over_height + pcb_key_height + pcb_height + base_height;
	
    base = 1.5;
    gap = 0.05;
    wall = 1.5;
    translate([0, 0, pair ? -height-wall/2 : -pcb_height-base_height]) difference() {
        translate([0, 0, 0]) bevel_extrude(height+wall, bevel_depth=pair ? 0 : 2, bottom=false) offset(0.1+gap+wall) import("lily58_BOTTOM-Frame.svg");
        difference() {
            translate([0, 0, 0]) bevel_extrude(height, bevel_depth=2) offset(0.1+gap) import("lily58_BOTTOM-Frame.svg");
            
            translate([82-0.2, 95, height - support_height]) cube([8, 25, support_height]);
            translate([144.4, 73.4, height - support_height]) cube([35, 2, support_height]);
            translate([179.5, 87, height - support_height]) cube([6, 6, support_height]);
            translate([185.5, 88.3, height - support_height]) cube([17, 1, support_height]);
            translate([189, 169.5, height - support_height]) cube([38, 4, support_height]);
            translate([209, 167.5, height - support_height]) cube([18, 4, support_height]);
            translate([113.5, 171, height - support_height]) cube([15, 3, support_height]);
            
            translate([160, 170, height-holder_height]) {
                hex_mount(l=3, height=holder_height);
                translate([-20, -10, 0]) rotate([0, 0, 90]) hex_mount(l=1.5, hex=1.60, height=holder_height);
            }
        }
    }
    
	//translate([97, 125, 0]) import("lily58cover_low_profile.stl");
}

module case(low_profile = false, pair = true) {
	if (pair) {
		case_side(low_profile=low_profile, pair=true);
		mirror([0, 0, 1]) case_side(low_profile=low_profile, pair=true);
	} else {
		case_side(low_profile=low_profile, pair=false);
	}
}

case(low_profile=low_profile, pair=pair);
// Correction: 0% infill, PETG, Rev 1
//scale([1.007, 1.007, 1.007]) base();
//scale(1.007, 1.007) base();
// Correction: 0% infill, PETG
//scale([1.004, 1.004, 0.004]) base();
