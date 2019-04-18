class Piece{
  int x,y;
  char piece;
  String position;
}

color green = #779456;
color gray  = #eaebd1;

int scl = 75;

char[] pieces = {'R','N','B','Q','K','B','N','R'};
String actPos = "a1";
String lastPos = "a0";

Piece[] blackPieces = new Piece[16];
Piece[] whitePieces = new Piece[16];

void setup(){
  size(600,600);
   for(int i=0;i<8;i++){
    blackPieces[i] = new Piece();
    blackPieces[i].piece = pieces[i];
    blackPieces[i].x = (i*scl)+(scl/2);
    blackPieces[i].y = (scl/2)-5;
    blackPieces[i].position = (char)(97+i) + "8";
    blackPieces[i+8] = new Piece();
    blackPieces[i+8].piece = 'P';
    blackPieces[i+8].x = (i*scl)+(scl/2);
    blackPieces[i+8].y = ((scl/2)-5)+scl;
    blackPieces[i+8].position = (char)(97+i) + "7";
    whitePieces[i] = new Piece();
    whitePieces[i].piece = pieces[i];
    whitePieces[i].x = (i*scl)+(scl/2);
    whitePieces[i].y = (scl/2)-5;
    whitePieces[i].position = (char)(97+i) + "1";
    whitePieces[i+8] = new Piece();
    whitePieces[i+8].piece = 'P';
    whitePieces[i+8].x = (i*scl)+(scl/2);
    whitePieces[i+8].y = ((scl/2)-5)-scl;
    whitePieces[i+8].position = (char)(97+i) + "2";
  }
}

void draw(){
  stroke(255);
  for(int x=0;x<width/scl;x++){
    for(int y=0;y<height/scl;y++){
       if(y%2==0){
         if(x%2==0){
           fill(gray);
         }else{
           fill(green);
         }
       }else{
         if(x%2==1){
           fill(gray);
         }else{
           fill(green);
         }
       }
      rect(x*scl,y*scl,scl,scl);
    }
  }
  
  textSize(48);
  fill(0);
  textAlign(CENTER,CENTER);
  for(int i=0;i<16;i++){
    text(blackPieces[i].piece,blackPieces[i].x,blackPieces[i].y);
  }
  
  translate(0,scl*7);
  for(int i=0;i<16;i++){
    text(whitePieces[i].piece,whitePieces[i].x,whitePieces[i].y);
  }
  //println(mouseX + " " +mouseY);
  
  if(actPos != lastPos){
    println(actPos);
  }
  lastPos = actPos;
  Piece targPiece = getClickedPiece(actPos); 
  print(targPiece.piece);
  
}
Piece getClickedPiece(String position){
  Piece target = new Piece();
  for(int i=0;i<16;i++){
    if(position.equals(blackPieces[i].position)){      
      target =  blackPieces[i];
      break;
    }
    if(position.equals(whitePieces[i].position)){  
      target =  whitePieces[i];
      break;
    }
  }
  return target;
}
void mouseClicked() {
  // A    B      C       D       E       F       G       H
  // 0-75 76-150 151-225 256-300 301-375 376-450 451-525 556-600
  // 8    7      6       5       4       3       2       1
  
  if(mouseX < 76){
    if(mouseY < 76){
      actPos = "a8";
    }else if(mouseY < 151){
      actPos = "a7";
    }else if(mouseY < 256){
      actPos = "a6";
    }else if(mouseY < 301){
      actPos = "a5";
    }else if(mouseY < 376){
      actPos = "a4";
    }else if(mouseY < 451){
      actPos = "a3";
    }else if(mouseY < 556){
      actPos = "a2";
    }else{
      actPos = "a1";
    }
  }else if(mouseX < 151){
    if(mouseY < 76){
      actPos = "b8";
    }else if(mouseY < 151){
      actPos = "b7";
    }else if(mouseY < 256){
      actPos = "b6";
    }else if(mouseY < 301){
      actPos = "b5";
    }else if(mouseY < 376){
      actPos = "b4";
    }else if(mouseY < 451){
      actPos = "b3";
    }else if(mouseY < 556){
      actPos = "b2";
    }else{
      actPos = "b1";
    }
  }else if(mouseX < 256){
    if(mouseY < 76){
      actPos = "c8";
    }else if(mouseY < 151){
      actPos = "c7";
    }else if(mouseY < 256){
      actPos = "c6";
    }else if(mouseY < 301){
      actPos = "c5";
    }else if(mouseY < 376){
      actPos = "c4";
    }else if(mouseY < 451){
      actPos = "c3";
    }else if(mouseY < 526){
      actPos = "c2";
    }else{
      actPos = "c1";
    }
  }else if(mouseX < 301){
    if(mouseY < 76){
      actPos = "d8";
    }else if(mouseY < 151){
      actPos = "d7";
    }else if(mouseY < 256){
      actPos = "d6";
    }else if(mouseY < 301){
      actPos = "d5";
    }else if(mouseY < 376){
      actPos = "d4";
    }else if(mouseY < 451){
      actPos = "d3";
    }else if(mouseY < 556){
      actPos = "d2";
    }else{
      actPos = "d1";
    }
  }else if(mouseX < 376){
    if(mouseY < 76){
      actPos = "e8";
    }else if(mouseY < 151){
      actPos = "e7";
    }else if(mouseY < 256){
      actPos = "e6";
    }else if(mouseY < 301){
      actPos = "e5";
    }else if(mouseY < 376){
      actPos = "e4";
    }else if(mouseY < 451){
      actPos = "e3";
    }else if(mouseY < 556){
      actPos = "e2";
    }else{
      actPos = "e1";
    }
  }else if(mouseX < 451){
    if(mouseY < 76){
      actPos = "f8";
    }else if(mouseY < 151){
      actPos = "f7";
    }else if(mouseY < 256){
      actPos = "f6";
    }else if(mouseY < 301){
      actPos = "f5";
    }else if(mouseY < 376){
      actPos = "f4";
    }else if(mouseY < 451){
      actPos = "f3";
    }else if(mouseY < 556){
      actPos = "f2";
    }else{
      actPos = "f1";
    }
  }else if(mouseX < 556){
    if(mouseY < 76){
      actPos = "g8";
    }else if(mouseY < 151){
      actPos = "g7";
    }else if(mouseY < 256){
      actPos = "g6";
    }else if(mouseY < 301){
      actPos = "g5";
    }else if(mouseY < 376){
      actPos = "g4";
    }else if(mouseY < 451){
      actPos = "g3";
    }else if(mouseY < 556){
      actPos = "g2";
    }else{
      actPos = "g1";
    }
  }else{
    if(mouseY < 76){
      actPos = "h8";
    }else if(mouseY < 151){
      actPos = "h7";
    }else if(mouseY < 256){
      actPos = "h6";
    }else if(mouseY < 301){
      actPos = "h5";
    }else if(mouseY < 376){
      actPos = "h4";
    }else if(mouseY < 451){
      actPos = "h3";
    }else if(mouseY < 526){
      actPos = "h2";
    }else{
      actPos = "h1";
    }
  }
}
