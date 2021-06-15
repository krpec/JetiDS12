include <Chamfer.scad>;
//author: Roman 'krpec' Dittrich (dittrich.r@gmail.com)
//Jeti DS-12 gimbal protector, version 1.0

$fa = 1;
$fs = 0.1;

module base() {
    difference() {
        union() {
            translate([-65, -6.25, -6])
                chamferCube([130, 12.5, 12], chamfers=[[0, 0, 2, 2], [0, 2, 2, 0], [2, 2, 2, 2]]);
            translate([-7.25, -13.75, -6])
                chamferCube([14.5, 9.5, 10], chamfers=[[0, 0, 0, 1], [0, 1, 1, 0], [1, 1, 0, 0]]);
        }
    
        translate([-25, -4, 5.5])
            linear_extrude(3)
                text("Jeti DS-12", size = 8);
    }
    /*
    #cube([136, 12.5, 12], center = true);
    #translate([0, -8, -1])
        cube([12.5, 9.5, 10], center = true);
    */
}

module stick_holes() {
    //translate([-61.25, 0, 0])
    translate([-57.25, 0, 0])
        cylinder(h = 15, d = 8.5, center = true);
    
    //translate([61.25, 0, 0])
    translate([57.25, 0, 0])
        cylinder(h = 15, d = 8.5, center = true);
}

module strap_holder() {
    translate([0, -9.35, 0])
        cube([11.5, 4.5, 15], center = true);
}

difference() {
    base();
    stick_holes();
    strap_holder();
}


