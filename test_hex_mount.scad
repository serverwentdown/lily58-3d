
module hex_mount(l=3, hex=1.55, height=1.5, thick=5) {
    difference() {
        translate([0, -thick/2, 0]) cube([l, thick, height]);
        translate([0, -hex/2, height/2]) cube([l, hex, height/2]);
        translate([0, 0, height-hex/cos(30)/2]) rotate([0, 90, 0]) cylinder(l, d=hex/cos(30), $fn=6);
    }
}

cube([28, 15, 1], center=true);
translate([10, 4, -1.6-0.5]) {
    hex_mount(l=3, height=1.6);
    translate([-20, -10, 0]) rotate([0, 0, 90]) hex_mount(l=1.5, hex=1.60, height=1.6);
}