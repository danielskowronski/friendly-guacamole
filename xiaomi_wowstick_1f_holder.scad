segment_width=1;
segment_height=1;
holde_width=0.5;
hole_height=0.4;

module fhex(wid,height){
  hull(){
    cube([wid/1.7,wid,height],center = true);
    rotate([0,0,120])cube([wid/1.7,wid,height],center = true);
    rotate([0,0,240])cube([wid/1.7,wid,height],center = true);
  }
}

module segment(){
  difference(){
    cube([segment_width,segment_height,segment_height]);
    translate([segment_width/2,segment_height/2,segment_height-hole_height]){
       fhex(holde_width,segment_height);
    }
  }
}

module segment_in_grid(x,y,is_hole=true){
  translate([x*segment_width, y*segment_width, y*segment_height]){
    if (is_hole) segment();
    else cube([segment_width,segment_width,segment_height]);
  }
  translate([x*segment_width, y*segment_width, 0]){
    cube([segment_width, segment_width, y*segment_height]);
  }
}

//row 1
segment_in_grid(0,0);
segment_in_grid(1,0);
segment_in_grid(2,0);

//row 2
segment_in_grid(0,1);
segment_in_grid(1,1,false);
segment_in_grid(2,1);

//row 3
segment_in_grid(0,2);
segment_in_grid(1,2);
segment_in_grid(2,2);
