// Demo switch style
low_profile = false;

include <BOSL/constants.scad>
use <BOSL/shapes.scad>


module slot_negative(low_profile = false) {
    upper_plate = low_profile ? 1.3 : 1.5;
    height = low_profile ? 2.2 : 5;
    hole = low_profile ? 14.1 : 14.1;
    hang = low_profile ? 1 : 2;
    hang_width = low_profile ? 11.5 : 6;

    cuboid([hole, hole, height], align=V_UP);
    // Printing upright
    //cuboid([hole+hang, hole+hang, height-upper_plate], align=V_UP, chamfer=2, edges=EDGES_Z_ALL);
    // Inverted printing
    cuboid([hole+hang, hang_width, height-upper_plate], align=V_UP, chamfer=1, edges=EDGES_Z_ALL);
    cuboid([hang_width, hole+hang, height-upper_plate], align=V_UP, chamfer=1, edges=EDGES_Z_ALL);
}

module slot_demo(low_profile = false) {
    difference() {
        cuboid([20, 20, low_profile ? 2.2 : 5], align=V_UP);
        slot_negative(low_profile = low_profile);
    }
}

slot_demo(low_profile=low_profile);
