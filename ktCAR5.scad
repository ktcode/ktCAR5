//
// ktCAR5
//
//


gap1 = 0.001;
gap2 = 0.002;

panel_thick = 2;



//#translate([0, -1, 123.8/2]) cube([58.6, 7.8, 123.8], center=true); //iPhone SE
difference()
{
union()
{    
difference()
{
    union()
    {
        translate([0, 0, 70/2-10-3.3/2]) cube([63, 12, 70+3.3], center=true);
    }
    translate([0, 0, 123.8/2]) cube([58.6+2, 7.8+2, 123.8], center=true);
    translate([0, -5, 123.8/2]) cube([52, 5, 123.8], center=true);
    //translate([-4, 0,  30/2+48]) cube([60, 20, 30], center=true);
    
    translate([0, -0.5,  -3.5/2]) cylinder(h=10, r=10/2, center=true, $fn=100);

    translate([0, -0.5,  0]) cylinder(h=30, r=8/2, center=true, $fn=100);
    translate([-35+8/2+2+15, -0.5,  -3.3+1]) holeB(20);
    translate([-35+8/2+2, -0.5,  -3.3+1]) holeB(13);
    translate([-30+15, -0.5,  -5.4-4/2-1/2-3.3+5]) rotate([0, 90, 0]) cylinder(h=5, r=4/2, center=true, $fn=100);
    translate([-30+15, -0.5,  -5.4-4*(2/3)-1-3.3+5-(10/2)]) cube([5, 4, 4/2+10], center=true);
    translate([9, -0.5,  -3.3+1]) holeB(20);
    translate([-30, -0.5,  -5.4-4/2-1/2-3.3]) rotate([0, 90, 0]) cylinder(h=17, r=4/2, center=true, $fn=100);
    translate([-30, -0.5,  -5.4-4*(2/3)-1-3.3]) cube([17, 4, 4/2], center=true);
}
translate([-52/2, -6, 0]) kadoL(D=1.1);
translate([ 52/2, -6, 0]) kadoR(D=1.1);

translate([63/2-7, (7.8+2)/2-1.5, 0]) slide(7, 2);
//translate([63/2-2.35, 10/2, 0]) rotate([0, 0, -90]) slide(10, 2);
translate([63/2-7, (7.8+2)/2-1.3, 34.5]) slide2(7, 2);
//translate([63/2-2.15, 10/2, 34.5]) rotate([0, 0, -90]) slide2(10, 2);
translate([-63/2, (7.8+2)/2-1.5, 0]) slide(7, 2);
//translate([-63/2+2.35, -10/2, 0]) rotate([0, 0, 90]) slide(10, 2);
translate([-63/2, (7.8+2)/2-1.3, 34.5]) slide2(7, 2);
//translate([-63/2+2.15, -10/2, 34.5]) rotate([0, 0, 90]) slide2(10, 2);
translate([63/2, 0, 48.45]) nob(11, 4.5);
translate([-63/2, 0, 48.45]) rotate([0, 0, 180]) nob(11, 4.5);
}
//#translate([0, 0, 65]) cube([100, 100, 100], center=true);
}



module slide(W=5, D=1)
{
    difference()
    {
        union()
        {
            cube([W, 5, 10]);
            translate([0, 0, 10]) rotate([-10, 0, 0]) cube([W, 5, 12]);
        }
        translate([-1, D, -1]) cube([W+2, 10, 30]);
    }
}

module slide2(W=5, D=1)
{
    difference()
    {
        union()
        {
            cube([W, 5, 2]);
            translate([0, 0, 2]) rotate([-10, 0, 0]) cube([W, 5, 12]);
            translate([W, 0, 0]) rotate([-10, 180, 0]) cube([W, 5, 12]);
        }
        translate([-1, D, -20]) cube([W+2, 10, 50]);
    }
}

module nob(W=10, H=3)
{
    translate([5*sqrt(0.5), W/2, 5*sqrt(0.5)]) rotate([0, 0, 180]) 
    {
    difference()
    {
        union()
        {
            translate([0, 0, H]) rotate([0, 45, 0]) cube([5, W, 5]);
            cube([5, W, H]);
            translate([5*sqrt(0.5), 0, -5*sqrt(0.5)]) rotate([0, -45, 0]) cube([5, W, 5]);
        }
        translate([5*sqrt(0.5), -1, -5]) cube([W+2, W+2, 30]);
    }
    }
}

module kadoL(R=20, D=1)
{
    difference()
    {
        union()
        {
            cube([R, D, R]);
        }
        translate([R/2, 0, R/2]) rotate([90, 0, 0]) cylinder(h=D*3, r=R/2, center=true, $fn=100);
        translate([0, -D, R/2]) cube([R, D*3, R]);
        translate([R/2, -D, R/2]) cube([R, D*3, R]);
        translate([R/2, -D, 0]) cube([R, D*3, R]);
    }
}

module kadoR(R=20, D=1)
{
    difference()
    {
        union()
        {
            translate([-R, 0, 0]) cube([R, D, R]);
        }
        translate([-R/2, 0, R/2]) rotate([90, 0, 0]) cylinder(h=D*3, r=R/2, center=true, $fn=100);
        translate([-R, -D, R/2]) cube([R, D*3, R]);
        translate([-R-R/2, -D, R/2]) cube([R, D*3, R]);
        translate([-R-R/2, -D, 0]) cube([R, D*3, R]);
    }
}

module holeB(W=35)
{
    translate([W/2, 0,  -9.5/2]) rotate([0, 90, 0]) cylinder(h=W, r=9.5/2, center=true, $fn=100);
    translate([W/2, 0,  -9.5/2-100/2]) cube([W, 9.5, 100], center=true);
}