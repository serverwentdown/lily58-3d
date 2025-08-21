// Switch style
low_profile = false;
// Include case
case = false;
// Show PCB
pcb = false;

translate([-97, -125, 0]) union() {
	if (pcb) {
		translate([0, 0, -1.6]) color("blue", 0.1) {
			linear_extrude(1.6) import("lily58-B_Cu.svg", $fn=8);
			linear_extrude(1.6) import("lily58-F_Cu.svg", $fn=8);
		}
	}
	if (low_profile) {
		import("lily58plate_low_profile.stl");
		translate([0, 0, -1.6]) import("lily58base_low_profile.stl");
		translate([97, 125, 0]) import("lily58cover_low_profile.stl");
		if (case) {
			import("lily58case_low_profile.stl");
		}
	} else {
		import("lily58plate.stl");
		translate([0, 0, -1.6]) import("lily58base.stl");
		translate([97, 125, 0]) import("lily58cover.stl");
		if (case) {
			import("lily58case.stl");
		}
	}
}
