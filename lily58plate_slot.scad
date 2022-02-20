include <BOSL/constants.scad>
use <BOSL/shapes.scad>

upper_plate = 1.5;
height = 5;
hole = 14.1;
hang = 2;

module slot_negative() {
    cuboid([hole, hole, height], align=V_UP);
    // Printing upright
    //cuboid([hole+hang, hole+hang, height-upper_plate], align=V_UP, chamfer=2, edges=EDGES_Z_ALL);
    // Inverted printing
    cuboid([hole+hang, 6, height-upper_plate], align=V_UP, chamfer=1, edges=EDGES_Z_ALL);
    cuboid([6, hole+hang, height-upper_plate], align=V_UP, chamfer=1, edges=EDGES_Z_ALL);
}

module slot_demo() {
    difference() {
        cuboid([hole+hang+4, hole+hang+4, 5], align=V_UP);
        slot_negative();
    }
}

slot_demo();
