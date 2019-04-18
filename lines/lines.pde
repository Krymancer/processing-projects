ArrayList<Point> points;
int nPoints = 30;
void setup(){
  size(600,400);
  points = new ArrayList<Point>();
  for(int i=0;i<nPoints;i++){
    float x = random(0,width);
    float y = random(0,height);
    Point point = new Point(x,y);
    points.add(point);
  }

}

void draw(){
  background(0);
  Point prevPoint = points.get(0);
  for(Point p : points){
    p.show();
    //p.fall();
    p.move();
    if(p.hasGone()){
      p.pos.x = random(0,width);
      p.pos.y = random(0,height);    
    }
    stroke(255);
    line(p.pos.x,p.pos.y,prevPoint.pos.x,prevPoint.pos.y);
    prevPoint = p;
  }

}
