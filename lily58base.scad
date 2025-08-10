// Higher definition curves
$fa = 8;
$fs = 0.4;

tilted = false;
// Switch style
low_profile = false;

use <module-bevelextrude.scad>


module bolt() {
    thick = 1.4;
    translate([0, 0, -12]) cylinder(12, d=2.4);
    translate([0, 0, -12-thick]) cylinder(12, d=3.9);
}

module slot_keepout(low_profile = false) {
    if (low_profile) {
        translate([-16/2, -6.175, -1.75]) cube([16, 5, 1.75]);
        translate([-18.75/2, -6.175+(5-2.5)/2, -1.75]) cube([18.75, 2.5, 1.75]);
        translate([-6/2, -8.39, -1.75]) cube([6, 5, 1.75]);
        translate([-8/2, -8.39+(5-2.5)/2, -1.75]) cube([8, 2.5, 1.75]);
    } else {
        translate([-18/2, 0.25, -1.75]) cube([18, 7, 1.75]);
    }
    // Switch
    translate([0, 0, -0.75]) cylinder(1.4, d=4.1, $fn=12);
    translate([-5.35, 0, -0.75]) cylinder(1.4, d=2.3, $fn=12);
    translate([5.35, 0, -0.75]) cylinder(1.4, d=2.3, $fn=12);
}

module feet() {
    // Feet
    depth = 0.75;
    y_cmp = 210;
    translate([89.5, y_cmp-43.5, 0]) cylinder(depth, d=10);
    translate([106.4, y_cmp-134.5, 0]) cylinder(depth, d=10);
    translate([219, y_cmp-47.5, 0]) cylinder(depth, d=10);
    translate([219, y_cmp-114, 0]) cylinder(depth, d=10);
}

module base(low_profile = false) {
    thick = 2.2;
    /*
    translate([0, 0, 0]) color("blue", 0.2) {
        linear_extrude(0.1) import("lily58-B_Cu.svg", $fn=8);
        linear_extrude(0.1) import("lily58-F_Cu.svg", $fn=8);
    }
    */
    difference() {
        if (tilted) {
            // Tilted
            difference() {
                translate([0, 0, -20]) bevel_extrude(20, bevel_depth=1, bottom=true) offset(0.8) import("lily58_BOTTOM-Frame.svg");
                translate([15, 0, -25]) translate([80, 60, 0]) cube([150, 150, 20]);
                translate([0, 0, -45.7]) rotate([0, -6, 0]) translate([80, 60, 0]) cube([150, 150, 20]);
            }
        } else {
            // Flat
            difference() {
                translate([0, 0, -thick]) bevel_extrude(thick, bevel_depth=0.5, bottom=true) offset(0.8) import("lily58_BOTTOM-Frame.svg");
                translate([0, 0, -thick]) feet();
            }
        }
        y_cmp = 210;
        
        // Keys
        translate([101.4, y_cmp-97.5, 0]) slot_keepout(low_profile=low_profile);
        translate([105, y_cmp-127, 0]) rotate([0, 0, -60]) slot_keepout(low_profile=low_profile);
        translate([120.5, y_cmp-50, 0]) slot_keepout(low_profile=low_profile);
        translate([120.5, y_cmp-69.1, 0]) slot_keepout(low_profile=low_profile);
        translate([120.5, y_cmp-88.1, 0]) slot_keepout(low_profile=low_profile);
        translate([120.5, y_cmp-107.1, 0]) slot_keepout(low_profile=low_profile);
        translate([139.5, y_cmp-47.6, 0]) slot_keepout(low_profile=low_profile);
        translate([139.5, y_cmp-66.7, 0]) slot_keepout(low_profile=low_profile);
        translate([139.5, y_cmp-85.7, 0]) slot_keepout(low_profile=low_profile);
        translate([139.5, y_cmp-104.8, 0]) slot_keepout(low_profile=low_profile);
        translate([158.6, y_cmp-46.21, 0]) slot_keepout(low_profile=low_profile);
        translate([158.6, y_cmp-65.3, 0]) slot_keepout(low_profile=low_profile);
        translate([158.6, y_cmp-84.4, 0]) slot_keepout(low_profile=low_profile);
        translate([158.6, y_cmp-103.4, 0]) slot_keepout(low_profile=low_profile);
        translate([177.6, y_cmp-47.6, 0]) slot_keepout(low_profile=low_profile);
        translate([177.6, y_cmp-66.6, 0]) slot_keepout(low_profile=low_profile);
        translate([177.6, y_cmp-85.7, 0]) slot_keepout(low_profile=low_profile);
        translate([177.6, y_cmp-104.8, 0]) slot_keepout(low_profile=low_profile);
        translate([196.7, y_cmp-52.4, 0]) slot_keepout(low_profile=low_profile);
        translate([196.7, y_cmp-71.3, 0]) slot_keepout(low_profile=low_profile);
        translate([196.7, y_cmp-90.5, 0]) slot_keepout(low_profile=low_profile);
        translate([196.7, y_cmp-109.5, 0]) slot_keepout(low_profile=low_profile);
        translate([215.7, y_cmp-53.9, 0]) slot_keepout(low_profile=low_profile);
        translate([215.7, y_cmp-72.8, 0]) slot_keepout(low_profile=low_profile);
        translate([215.7, y_cmp-92, 0]) slot_keepout(low_profile=low_profile);
        translate([215.7, y_cmp-111, 0]) slot_keepout(low_profile=low_profile);
        translate([130, y_cmp-126, 0]) slot_keepout(low_profile=low_profile);
        translate([149, y_cmp-123.75, 0]) slot_keepout(low_profile=low_profile);
        translate([168.1, y_cmp-123.75, 0]) slot_keepout(low_profile=low_profile);
        
        // Diodes
        diode_thick = 1.4;
        translate([114.5, y_cmp-61+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 6, diode_thick], center=true);
        translate([135.3, y_cmp-60.2+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 3, diode_thick], center=true);
        translate([134.3, y_cmp-57.2+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 3, diode_thick], center=true);
        translate([152.6, y_cmp-57.4+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 6, diode_thick], center=true);
        translate([171.5, y_cmp-58.7+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 6, diode_thick], center=true);
        translate([190.6, y_cmp-63.3+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 6, diode_thick], center=true);
        translate([221.8, y_cmp-64.9+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 6, diode_thick], center=true);
        translate([0, -38.1, 0]) {
            translate([114.5, y_cmp-61+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 6, diode_thick], center=true);
            translate([135.3, y_cmp-60.2+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 3, diode_thick], center=true);
            translate([134.3, y_cmp-57.2+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 3, diode_thick], center=true);
            translate([152.6, y_cmp-57.4+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 6, diode_thick], center=true);
            translate([171.5, y_cmp-58.7+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 6, diode_thick], center=true);
            translate([190.6, y_cmp-63.3+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 6, diode_thick], center=true);
            translate([221.8, y_cmp-64.9+1.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 6, diode_thick], center=true);
        }
        translate([123.9, y_cmp-118, 0]) translate([0, 0, -diode_thick/2]) cube([7, 3, diode_thick], center=true);
        translate([142.9, y_cmp-115.8, 0]) translate([0, 0, -diode_thick/2]) cube([7, 3, diode_thick], center=true);
        translate([162, y_cmp-115.8, 0]) translate([0, 0, -diode_thick/2]) cube([7, 3, diode_thick], center=true);
        translate([109.8, y_cmp-119.3, 0]) rotate([0, 0, -60]) translate([0, 0, -diode_thick/2]) cube([7, 3, diode_thick], center=true);
        translate([105.6, y_cmp-89.5, 0]) translate([0, 0, -diode_thick/2]) cube([7, 3, diode_thick], center=true);
        
        // Controller
        //translate([91, y_cmp-71.8, -1.75]) cube([19, 32, 3]); // Controller
        translate([91 + (19-3.75), y_cmp-71.8, -1.75]) cube([3.75, 32, 3]); // Controller
        translate([91, y_cmp-71.8, -1.75]) cube([3.75, 32, 3]); // Controller
        translate([83.5, y_cmp-72.5, -1.75]) cube([3, 9.5, 3]); // Reset
        //translate([83.25, y_cmp-50.8, -1.5]) cube([7.5, 9.4, 3]); // Audio
        //translate([85, y_cmp-52.3, -1.5]) cube([4, 2.5, 3]); // Audio
        //translate([85.4, y_cmp-48.55, -0.75]) cube([3.25, 8.5, 3]); // Audio
        translate([95, y_cmp-76, -1.75]) cube([11, 3, 3]); // OLED
        
        // Cover
        translate([108, y_cmp-85, 0]) bolt();
        translate([86, y_cmp-85, 0]) bolt();
        
        // Bolts
        translate([105, y_cmp-114.8, 0]) bolt();
        translate([129.6, y_cmp-59.6, 0]) bolt();
        translate([129.6, y_cmp-97.6, 0]) bolt();
        translate([205.8, y_cmp-61.8, 0]) bolt();
        translate([205.8, y_cmp-100, 0]) bolt();
    }
}

// Correction: 0% infill, PETG, Rev 1
scale([1.007, 1.007, 1.007]) base(low_profile=low_profile);
//scale(1.007, 1.007) base();
// Correction: 0% infill, PETG
//scale([1.004, 1.004, 0.004]) base();
