float fallSpeed = 3;

class Point{
  PVector pos;
  Point(float x, float y){
    pos = new PVector(x,y);
  }
  
  void show(){
    stroke(255);
    strokeWeight(4);
    point(pos.x,pos.y);
  }
  
  void move(){
    float sort = random(0,2);
    if(sort < 1){
      if(sort < 0.5){
        pos.x += fallSpeed;
      }else{
        pos.x -= fallSpeed;
      }
    }else{
     if(sort < 1.5){
        pos.y += fallSpeed;
      }else{
        pos.y -= fallSpeed;
      }
    
    }
    
  }
  
  void fall(){
    pos.y += fallSpeed;
  }
  
  boolean hasGone(){
    return pos.y > height || pos.x > width || pos.y < 0 || pos.x < 0;
  }
}
