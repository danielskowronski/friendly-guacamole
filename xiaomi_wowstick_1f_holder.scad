segment_width=10;//10
segment_height=10;//10
holde_width=4.5;//5
hole_height=4;//4

module fhex(wid,height){
  hull(){
    cube([wid/1.7,wid,height],center = true);
    rotate([0,0,120])cube([wid/1.7,wid,height],center = true);
    rotate([0,0,240])cube([wid/1.7,wid,height],center = true);
  }
}

module segment(txt=""){
  difference(){
    cube([segment_width,segment_height,segment_height]);
    
    
    
    translate([segment_width/2,segment_height/2,segment_height-hole_height]){
      fhex(holde_width,segment_height);
    }

   
    extrusion=1;
    translate([0,extrusion,0])
    rotate([90,0,0]){
      linear_extrude(extrusion){
        divider=3;
        if (len(txt) == 2) { divider=5; }
        translate([segment_width/divider,segment_width/divider,0]){
          text(txt, size=segment_width/divider, font="Ubuntu Mono");
        }
      }
    }
  }

}

module segment_in_grid(x,y,txt="",is_hole=true){
  translate([x*segment_width, y*segment_width, y*segment_height]){
    if (is_hole) segment(txt);
    else cube([segment_width,segment_width,segment_height]);
  }
  translate([x*segment_width, y*segment_width, 0]){
    cube([segment_width, segment_width, y*segment_height]);
  }
}

//row 1
segment_in_grid(0,0,txt="4.");
segment_in_grid(1,0,txt="50");
segment_in_grid(2,0,txt="mm");

segment_in_grid(3,0,txt="X");