color[] colors = {#FFFFFF,#FFFF00,#00FFFF,#00FF00,#FF00FF,#FF0000,#0000FF};
void setup(){
  size(800,600);
  for(int i=0;i<7;i++){
    fill(colors[i]); //changing the color, to the correct bar, white,yellow,cian,green,magenta,red and blue.
    rect(i*(width/7),0,width/7,height-150); //starting the frist bar in 0,0 and proceed until reach the end.
    fill(255 - (i*42.5)); // 255/6 = 42.5, so we graduating getting darker until we reach black(0).
    rect(i*(width/7),height-150,width/7,height); //same of the frist rect, but starting in a lower height.
  }
}
