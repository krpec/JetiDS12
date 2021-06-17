//author: Roman 'krpec' Dittrich (dittrich.r@gmail.com)
//Jeti DS-12 gimbal protector, version 1.2

include <Chamfer.scad>;
include <Roundedcube.scad>;
//Chamfer.scad - https://github.com/SebiTimeWaster/Chamfers-for-OpenSCAD
//roundedcube.scad - https://danielupshaw.com/openscad-rounded-corners/


$fa = 1;
$fs = 0.1;

module chamfer_base() {
  union() {
    translate([-65, -6.25, 0])
      chamferCube([130, 12.5, 12], chamfers=[[0, 0, 2, 2], [0, 2, 2, 0], [2, 2, 2, 2]]);
    translate([-7.25, -13.75, 0])
      chamferCube([14.5, 9.5, 10], chamfers=[[0, 0, 0, 1], [0, 1, 1, 0], [1, 1, 0, 0]]);
  }
}

module round_base() {
  union() {
    translate([-65, -6.25, 0])
      roundedcube([130, 12.5, 12], false, 2, "zmax");
    translate([-7.25, -13.75, 0])
      roundedcube([14.5, 9.5, 10], false, 2, "zmax");
  }
}

module holder_text() {
  translate([-25, -4, 10])
    linear_extrude(3) text("Jeti DS-12", size = 8); 
}

module stick_holes() {
    translate([-57.25, 0, 6])
        cylinder(h = 15, d = 8.5, center = true);
    
    translate([57.25, 0, 6])
        cylinder(h = 15, d = 8.5, center = true);
}

module strap_holder() {
    translate([0, -9.35, 6])
        cube([11.5, 4.5, 15], center = true);
}

//style = "chamfer" | "round"
module holder_engraved(style = "round") {
  difference() {
    if (style == "chamfer") {
      chamfer_base();
    }
    else {
      round_base();
    }

    translate([0, 0, 1])
      holder_text();
    stick_holes();
    strap_holder();
  }
}

module holder_embossed(style = "round") {
  difference() {
    union() {
      if (style == "chamfer") {
        chamfer_base();
      }
      else {
        round_base();
      }

      holder_text();
    }

    stick_holes();
    strap_holder();
  }
}

holder_embossed("chamfer");
//holder_engraved("round");
