/*
///////////////////////////////////////////////////////////////////////////////////
// Open SCAD Notes
% = background : # = debug : ! = root : * = disable

union() : intersection() : difference() : minkowski() :hull()
translate([X, Y, Z]) : rotate([X,Y,Z]) : scale([x, y, z])
linear_extrude(height = X, center = true, convexity = 10, twist = Y, slices = 20)

square ([X,Y],center = true) : cube([X, Y, Z], center=true)
circle(r = X) : cylinder(r1=X, r2=Y, h=Z, center=true, $fn=20) : sphere(2, $fn=100)
color("Red",0.7)

polygon(points=[[-50,0],[-50,50],[50,50],[50,0]], paths=[[0,1,2,3]]);
polyhedron(points=[[-50,0],[-50,50],[50,50],[50,0], triangles=[[1,0,3],[2,1,3]]);

// STL Import
translate([0, 0, 0])
import("OpenBeam.stl");

///////////////////////////////////////////////////////////////////////////////////
*/

include <metric_fastners.scad>;


scale = 0.99;
length = 40;


module beam(length=40) {
	linear_extrude(length)
	 polygon([ [-4.5, 0], [-2.7, -1.9], [-5.5,-1.9], [-5.5, -2.8], [-3, -5.7], [3, -5.7], [5.5, -2.8], [5.5,-1.9], [2.7, -1.9], [4.5, 0], [2.7, 1.9], [5.5, 1.9], [5.5, 2.8], [3, 5.7], [-3, 5.7], [-5.5, 2.8], [-5.5,1.9], [-2.7, 1.9] ]);
}


module connector() {
	difference() {
	translate([0, 0, -length/2]) rotate([0, 0, 0]) scale([scale, scale, scale])
 	 beam(length);

*#	translate([0, 2, 0]) rotate([90, 0, 0])
		 cap_bolt_boolean(3, 8, 30);
	}
}



// Primary Placement
translate([0, 0, 0]) rotate([0, 0, 0])
connector(40);




