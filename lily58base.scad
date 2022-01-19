// Higher definition curves
$fa = 8;
$fs = 0.4;

tilted = false;

include <module-bevelextrude.scad>


module bolt() {
    translate([0, 0, 0]) cylinder(12, d=2.4);
    translate([0, 0, 0]) cylinder(2, d=4.2, $fn=6);
    //translate([0, 0, -2]) cylinder(2, d=4.2);
    translate([0, 0, -2]) cylinder(2, d=4.2, $fn=6);
}

module slot_keepout() {
    translate([-18/2, 0, -1.75]) cube([18, 7, 1.75]);
}

module base() {
    //translate([0, 0, 0]) /*linear_extrude(6)*/ import("lily58-F_Cu.svg", $fn=8);
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
            translate([0, 0, -4]) bevel_extrude(4, bevel_depth=1, bottom=true) offset(0.8) import("lily58_BOTTOM-Frame.svg");
        }
        y_cmp = 210;
        
        // Keys
        translate([101.4, y_cmp-97.5, 0]) slot_keepout();
        translate([105, y_cmp-127, 0]) rotate([0, 0, -60]) slot_keepout();
        translate([120.5, y_cmp-50, 0]) slot_keepout();
        translate([120.5, y_cmp-69.1, 0]) slot_keepout();
        translate([120.5, y_cmp-88.1, 0]) slot_keepout();
        translate([120.5, y_cmp-107.1, 0]) slot_keepout();
        translate([139.5, y_cmp-47.6, 0]) slot_keepout();
        translate([139.5, y_cmp-66.7, 0]) slot_keepout();
        translate([139.5, y_cmp-85.7, 0]) slot_keepout();
        translate([139.5, y_cmp-104.8, 0]) slot_keepout();
        translate([158.6, y_cmp-46.21, 0]) slot_keepout();
        translate([158.6, y_cmp-65.3, 0]) slot_keepout();
        translate([158.6, y_cmp-84.4, 0]) slot_keepout();
        translate([158.6, y_cmp-103.4, 0]) slot_keepout();
        translate([177.6, y_cmp-47.6, 0]) slot_keepout();
        translate([177.6, y_cmp-66.6, 0]) slot_keepout();
        translate([177.6, y_cmp-85.7, 0]) slot_keepout();
        translate([177.6, y_cmp-104.8, 0]) slot_keepout();
        translate([196.7, y_cmp-52.4, 0]) slot_keepout();
        translate([196.7, y_cmp-71.3, 0]) slot_keepout();
        translate([196.7, y_cmp-90.5, 0]) slot_keepout();
        translate([196.7, y_cmp-109.5, 0]) slot_keepout();
        translate([215.7, y_cmp-53.9, 0]) slot_keepout();
        translate([215.7, y_cmp-72.8, 0]) slot_keepout();
        translate([215.7, y_cmp-92, 0]) slot_keepout();
        translate([215.7, y_cmp-111, 0]) slot_keepout();
        translate([130, y_cmp-126, 0]) slot_keepout();
        translate([149, y_cmp-123.75, 0]) slot_keepout();
        translate([168.1, y_cmp-123.75, 0]) slot_keepout();
        
        // Diodes
        translate([114.5, y_cmp-61+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 6, 1.5], center=true);
        translate([135.3, y_cmp-58.7+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 3, 1.5], center=true);
        translate([134.3, y_cmp-55.7+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 3, 1.5], center=true);
        translate([152.6, y_cmp-57.4+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 6, 1.5], center=true);
        translate([171.5, y_cmp-58.7+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 6, 1.5], center=true);
        translate([190.6, y_cmp-63.3+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 6, 1.5], center=true);
        translate([221.8, y_cmp-64.9+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 6, 1.5], center=true);
        translate([0, -38.1, 0]) {
            translate([114.5, y_cmp-61+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 6, 1.5], center=true);
            translate([135.3, y_cmp-58.7+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 3, 1.5], center=true);
            translate([134.3, y_cmp-55.7+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 3, 1.5], center=true);
            translate([152.6, y_cmp-57.4+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 6, 1.5], center=true);
            translate([171.5, y_cmp-58.7+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 6, 1.5], center=true);
            translate([190.6, y_cmp-63.3+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 6, 1.5], center=true);
            translate([221.8, y_cmp-64.9+1.5, 0]) translate([0, 0, -1.5/2]) cube([7, 6, 1.5], center=true);
        }
        translate([123.9, y_cmp-118, 0]) translate([0, 0, -1.5/2]) cube([7, 3, 1.5], center=true);
        translate([142.9, y_cmp-115.8, 0]) translate([0, 0, -1.5/2]) cube([7, 3, 1.5], center=true);
        translate([162, y_cmp-115.8, 0]) translate([0, 0, -1.5/2]) cube([7, 3, 1.5], center=true);
        translate([109.8, y_cmp-119.3, 0]) rotate([0, 0, -60]) translate([0, 0, -1.5/2]) cube([7, 3, 1.5], center=true);
        translate([105.6, y_cmp-89.5, 0]) translate([0, 0, -1.5/2]) cube([7, 3, 1.5], center=true);
        
        // Controller
        translate([83, y_cmp-52.58, -2]) cube([8, 11.5, 3]);
        translate([91, y_cmp-71.8, -2]) cube([19, 32, 3]);
        translate([95, y_cmp-76, -2]) cube([11, 3, 3]);
        
        // Cover
        translate([108, y_cmp-85, -3.5]) cylinder(4, d=4.2, $fn=6);
        translate([86, y_cmp-85, -3.5]) cylinder(4, d=4.2, $fn=6);
        
        // Bolts
        translate([105, y_cmp-114.8, -4]) bolt();
        translate([129.6, y_cmp-59.6, -4]) bolt();
        translate([129.6, y_cmp-97.6, -4]) bolt();
        translate([205.8, y_cmp-61.8, -4]) bolt();
        translate([205.8, y_cmp-100, -4]) bolt();
    }
}

// Correction: 0% infill, ABS
scale(1.007, 1.007) base();