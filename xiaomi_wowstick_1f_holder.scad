module fhex(wid,height){
  hull(){
    cube([wid/1.7,wid,height],center = true);
    rotate([0,0,120])cube([wid/1.7,wid,height],center = true);
    rotate([0,0,240])cube([wid/1.7,wid,height],center = true);
  }
}

module segment(outer_width, outer_height, holder_width, holder_height){
  difference(){
    cube([outer_width,outer_width,outer_height]);
    translate([outer_width/2,outer_width/2,outer_height-holder_height]){
       fhex(holder_width,outer_height);
    }
  }
}

module segment_in_grid(x,y, ow, oh, hw, hh){
  translate([x*ow, y*ow, y*oh]){
    segment(ow, oh, hw, hh);
  }
  translate([x*ow, y*ow, 0]){
    cube([ow, ow, y*oh]);
  }
}

segment_in_grid(0,0,1,1,0.5,0.4);
segment_in_grid(0,1,1,1,0.5,0.4);
segment_in_grid(0,2,1,1,0.5,0.4);
segment_in_grid(1,0,1,1,0.5,0.4);
segment_in_grid(1,1,1,1,0.5,0.4);
segment_in_grid(1,2,1,1,0.5,0.4);
