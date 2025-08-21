OPENSCAD=flatpak run org.openscad.OpenSCAD
OPENSCAD_EXPORT=$(OPENSCAD) --export-format asciistl

TARGETS=\
		lily58plate.stl \
		lily58plate_low_profile.stl \
		lily58base.stl \
		lily58base_low_profile.stl \
		lily58base_6deg.stl \
		lily58cover.stl \
		lily58cover_low_profile.stl \
		lily58cover_socketed.stl \
		lily58case.stl \
		lily58case_low_profile.stl \
		lily58case_pair.stl \
		lily58case_pair_low_profile.stl \


all: $(TARGETS)

clean:
	rm -f $(TARGETS)

lily58plate.stl: lily58plate.scad lily58plate_slot.scad
	$(OPENSCAD_EXPORT) -o lily58plate.stl lily58plate.scad
lily58plate_low_profile.stl: lily58plate.scad lily58plate_slot.scad
	$(OPENSCAD_EXPORT) -o lily58plate_low_profile.stl lily58plate.scad -D low_profile=true

lily58base.stl: lily58base.scad
	$(OPENSCAD_EXPORT) -o lily58base.stl lily58base.scad
lily58base_low_profile.stl: lily58base.scad
	$(OPENSCAD_EXPORT) -o lily58base_low_profile.stl lily58base.scad -D low_profile=true
lily58base_6deg.stl: lily58base.scad
	$(OPENSCAD_EXPORT) -o lily58base_6deg.stl lily58base.scad -D tilted=true

lily58cover.stl: lily58cover.scad lily58plate.scad lily58plate_slot.scad lily58base.scad
	$(OPENSCAD_EXPORT) -o lily58cover.stl lily58cover.scad
lily58cover_low_profile.stl: lily58cover.scad lily58plate.scad lily58plate_slot.scad lily58base.scad
	$(OPENSCAD_EXPORT) -o lily58cover_low_profile.stl lily58cover.scad -D low_profile=true
lily58cover_socketed.stl: lily58cover.scad lily58plate.scad lily58plate_slot.scad lily58base.scad
	$(OPENSCAD_EXPORT) -o lily58cover_socketed.stl lily58cover.scad -D socketed=true

lily58case.stl: lily58case.scad
	$(OPENSCAD_EXPORT) -o lily58case.stl lily58case.scad

lily58case_low_profile.stl: lily58case.scad
	$(OPENSCAD_EXPORT) -o lily58case_low_profile.stl lily58case.scad -D low_profile=true

lily58case_pair.stl: lily58case.scad
	$(OPENSCAD_EXPORT) -o lily58case_pair.stl lily58case.scad -D pair=true

lily58case_pair_low_profile.stl: lily58case.scad
	$(OPENSCAD_EXPORT) -o lily58case_pair_low_profile.stl lily58case.scad -D pair=true -D low_profile=true
