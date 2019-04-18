boolean selected = false;
String keyPress = "";
String gridSelected = "";
ChessPiece selectedPiece;
boolean pieceSelected = false;
int indexOfPieceToDie;
int displayMode = 0;
color green = #779456;
color gray  = #eaebd1;
boolean mclicled = false;

ChessPiece[] chessPiecesAlive = new ChessPiece[32];

void setup(){
  background(0);
  smooth();
  size(900,900);
  setupChessPieces();
  drawAxes();
  drawGrid();
}

void setupChessPieces(){
  ChessPiece black_rook1 = new ChessPiece("Rook", "8a", 0);
  ChessPiece black_knight1 = new ChessPiece("Night", "8b", 0);
  ChessPiece black_bishop1 = new ChessPiece("Bishop", "8c", 0);
  ChessPiece black_king = new ChessPiece("King", "8e", 0);
  ChessPiece black_queen = new ChessPiece("Queen", "8d", 0);
  ChessPiece black_bishop2 = new ChessPiece("Bishop", "8f", 0);
  ChessPiece black_knight2 = new ChessPiece("Night", "8g", 0);
  ChessPiece black_rook2 = new ChessPiece("Rook", "8h", 0);
  ChessPiece black_pawn1 = new ChessPiece("Pawn", "7a", 0);
  ChessPiece black_pawn2 = new ChessPiece("Pawn", "7b", 0);
  ChessPiece black_pawn3 = new ChessPiece("Pawn", "7c", 0);
  ChessPiece black_pawn4 = new ChessPiece("Pawn", "7d", 0);
  ChessPiece black_pawn5 = new ChessPiece("Pawn", "7e", 0);
  ChessPiece black_pawn6 = new ChessPiece("Pawn", "7f", 0);
  ChessPiece black_pawn7 = new ChessPiece("Pawn", "7g", 0);
  ChessPiece black_pawn8 = new ChessPiece("Pawn", "7h", 0);

  ChessPiece white_pawn1 = new ChessPiece("Pawn", "2a", 1);
  ChessPiece white_pawn2 = new ChessPiece("Pawn", "2b", 1);
  ChessPiece white_pawn3 = new ChessPiece("Pawn", "2c", 1);
  ChessPiece white_pawn4 = new ChessPiece("Pawn", "2d", 1);
  ChessPiece white_pawn5 = new ChessPiece("Pawn", "2e", 1);
  ChessPiece white_pawn6 = new ChessPiece("Pawn", "2f", 1);
  ChessPiece white_pawn7 = new ChessPiece("Pawn", "2g", 1);
  ChessPiece white_pawn8 = new ChessPiece("Pawn", "2h", 1);
  ChessPiece white_rook1 = new ChessPiece("Rook", "1a", 1);
  ChessPiece white_knight1 = new ChessPiece("Night", "1b", 1);
  ChessPiece white_bishop1 = new ChessPiece("Bishop", "1c", 1);
  ChessPiece white_king = new ChessPiece("King", "1e", 1);
  ChessPiece white_queen = new ChessPiece("Queen", "1d", 1);
  ChessPiece white_bishop2 = new ChessPiece("Bishop", "1f", 1);
  ChessPiece white_knight2 = new ChessPiece("Night", "1g", 1);
  ChessPiece white_rook2 = new ChessPiece("Rook", "1h", 1);

  chessPiecesAlive[0] = black_rook1;
  chessPiecesAlive[1] = black_knight1;
  chessPiecesAlive[2] = black_bishop1;
  chessPiecesAlive[3] = black_king;
  chessPiecesAlive[4] = black_queen;
  chessPiecesAlive[5] = black_bishop2;
  chessPiecesAlive[6] = black_knight2;
  chessPiecesAlive[7] = black_rook2;
  chessPiecesAlive[8] = black_pawn1;
  chessPiecesAlive[9] = black_pawn2;
  chessPiecesAlive[10] = black_pawn3;
  chessPiecesAlive[11] = black_pawn4;
  chessPiecesAlive[12] = black_pawn5;
  chessPiecesAlive[13] = black_pawn6;
  chessPiecesAlive[14] = black_pawn7;
  chessPiecesAlive[15] = black_pawn8;

  chessPiecesAlive[16] = white_pawn1;
  chessPiecesAlive[17] = white_pawn2;
  chessPiecesAlive[18] = white_pawn3;
  chessPiecesAlive[19] = white_pawn4;
  chessPiecesAlive[20] = white_pawn5;
  chessPiecesAlive[21] = white_pawn6;
  chessPiecesAlive[22] = white_pawn7;
  chessPiecesAlive[23] = white_pawn8;
  chessPiecesAlive[24] = white_rook1;
  chessPiecesAlive[25] = white_knight1;
  chessPiecesAlive[26] = white_bishop1;
  chessPiecesAlive[27] = white_king;
  chessPiecesAlive[28] = white_queen;
  chessPiecesAlive[29] = white_bishop2;
  chessPiecesAlive[30] = white_knight2;
  chessPiecesAlive[31] = white_rook2;
}

void drawAxes(){
  textAlign(CENTER);
  int letter = 65; //65 = 'A'
  int number = 8; 

  for (int i = 95; i <= 850; i=i+100){ // x axis label (top, letters)
    text(char(letter++), i, 29);
  }

  for (int i = 95; i <= 865; i=i+100){ // y axis label (left, numbers)
    text(number--, 25, i);
  }
}

// Method to draw entire chess grid
void drawGrid(){
  int colour = 1; // Setting an integer to represent black/white for use later.
  
  for (int i = 100; i < 900; i=i+100){ // y axis loop (Rows)
    for (int j = 100; j < 900; j=j+100){ // x axis loop (Columns)
      pushMatrix(); // Save the original matrix state onto stack
      translate(j, i); // Translate point of reference to next point for grid
      drawSquare(colour); // Call drawSquare method with corresponding colour
      popMatrix(); // Pop stored matrix (original matrix) to undo translation
      colour = colour * -1; // Invert the colour for the next square
    }
    colour = colour * -1; // Additional inverting of colour for next row
  }
}

void draw(){ 
  // Iterate through the every chess piece that is still alive
  for (int i = 0; i < 32; i++){
    if (chessPiecesAlive[i].isAlive()){
      if (chessPiecesAlive[i].xcor == chessPiecesAlive[i].newxcor && chessPiecesAlive[i].ycor == chessPiecesAlive[i].newycor){
        if (!chessPiecesAlive[i].inDefaultPosition()&&pieceSelected==false){
          drawGrid();
        }
        chessPiecesAlive[i].display();
      }
      else{
        drawGrid();
        chessPiecesAlive[i].display();
      }

      for (int j = 0;j<32; j++){
        if (i!=j){ // Don't redraw the one moving
          if (chessPiecesAlive[j].isAlive()){
            chessPiecesAlive[j].display();
          }
        }
      }
    }
  }
}

void drawSquare(int colour){
  if (colour==1){
    fill(green);
  }
  else{
    fill(gray);
  }

  rect(-50, -50, 100, 100); // Draw the rectangle.
}

boolean isInsideBoard(int mouseXcor, int mouseYcor){
  // 100 for mouseX/mouseY refers to the very top left corner of 1a
  // ie: the further legal clickable position
  if (mouseXcor < 52 || mouseYcor < 52 || (mouseXcor < 52 && mouseYcor < 52) || (mouseXcor > 850 && mouseYcor > 850) || (mouseXcor > 850 || mouseYcor > 850)){
    //System.out.println("X= " + mouseX + " Y= " + mouseY);
    System.out.println("Invalid Position");
    return false;
  }else{
    //System.out.println("X= " + mouseX + " Y= " + mouseY);
    return true;
  }
}

void selectPieceOnGrid(String position){
  if (!checkEmpty(position) && pieceSelected==false){
    selectSquare(position); // Colour the selected piece/grid red
    gridSelected = position; // Save the notated version of clicked position
    selectedPiece = getChessPieceAt(position); // Get the chess piece on that  --------------------------- Consider removing get chess piece at function
    System.out.println("Unit type: " + selectedPiece.getName()); // Print out what type it is
    pieceSelected = true; // Set boolean flag to say that a piece is selected
  }
}

void moveSelectedPiece(String position){
  System.out.println(position);
  boolean castling = false;
  if (pieceSelected==true){
// Castling Conditions
    if (selectedPiece.getName() == "King" && selectedPiece.inDefaultPosition() && selectedPiece!=chessPiecesAlive[indexOfPieceToDie]){
      // Each quadrant for castling
      if (checkEmpty(position) && position.equals("1c") && checkEmpty("1b") && checkEmpty("1d")){
        chessPiecesAlive[0].updatePosition("1d");
      }
      if (checkEmpty(position) && position.equals("1g") && checkEmpty("1f")){
        chessPiecesAlive[7].updatePosition("1f");
      }
      if (checkEmpty(position) && position.equals("8g") && checkEmpty("8f")){
        chessPiecesAlive[31].updatePosition("8f");
      }
      if (checkEmpty(position) && position.equals("8c") && checkEmpty("8b") && checkEmpty("8d")){
        chessPiecesAlive[24].updatePosition("8d");
      }
    }

    if (!checkEmpty(position)){
      indexOfPieceToDie = getIndexOfChessPieceAt(position);
      
      if (chessPiecesAlive[indexOfPieceToDie]!=selectedPiece){
        System.out.println(chessPiecesAlive[indexOfPieceToDie].getName() + " has died. :(");
        chessPiecesAlive[indexOfPieceToDie].kill();
      }else{
        System.out.println("Unselected " + selectedPiece.getName());
        selectedPiece.undo();
      }
    }
  }

  selectedPiece.updatePosition(position);
  
  if (selectedPiece.getName() == "Pawn" && selectedPiece.getColour() == 0){
    if (position.charAt(0) == '1'){
      promotionScreen(selectedPiece);
      //selectedPiece.promote();
    }
  }
  if (selectedPiece.getName() == "Pawn" && selectedPiece.getColour() == 1){
    if (position.charAt(0) == '8'){
      promotionScreen(selectedPiece);
    }
  }


  System.out.println(selectedPiece.getName() + " has moved to " + position);
  pieceSelected = false;
  drawGrid();
}

String clickedCell;
void mouseClicked(){
  mclicled = !mclicled;
  if (!isInsideBoard(mouseX, mouseY)){
    return;
  }

  clickedCell = convertToNotation((mouseX + 48)/100,(mouseY + 48)/100);
  System.out.println("Cell position selected: " + clickedCell);

  if (!pieceSelected){
    selectPieceOnGrid(clickedCell);
  }else{
    moveSelectedPiece(clickedCell);
  }
}

ChessPiece getChessPieceAt(String position){
  int indexOfPiece = 0;
  for (int i = 0; i<chessPiecesAlive.length ; i++){
    if (chessPiecesAlive[i].getPosition().equals(position)){
      indexOfPiece = i;
    }
  }
  return chessPiecesAlive[indexOfPiece];
}



int getIndexOfChessPieceAt(String position){
  int indexOfPiece = -1;
  for (int i = 0; i<chessPiecesAlive.length ; i++){
    if (chessPiecesAlive[i].getPosition().equals(position)){
      indexOfPiece = i;
    }
  }
  return indexOfPiece;
}

String convertToNotation(int x, int y){
  //System.out.println("X = " + mouseX + " Y= " + mouseY);
  //System.out.println("X = " + x + " Y= " + y);
  String notationPosition = "" + (char(57 - y)) +(char(x+96));
  return notationPosition;
}

boolean checkEmpty(String position){
  for (int i = 0; i<chessPiecesAlive.length ; i++){
    if (chessPiecesAlive[i].getPosition().equals(position)){
      System.out.println("Cell is occupied!");
      return false;
    }
  }
  System.out.println("Cell is empty!");
  return true;
}


void selectSquare(String position){
  fill(20, 152, 12,100);
  pushMatrix();
  translate( convertToX(position), convertToY(position) );
  rect(-50, -50, 100, 100);
  popMatrix();
}

int convertToX(String position){
  int xcor = (int(position.charAt(1)-96))* 100 ;
  return xcor;
}

int convertToY(String position){
  int ycor = (57 - int(position.charAt(0)))  * 100;
  return ycor;
}

//positions.txt
void readFile(){
  String fileLine;
  String fileName = dataPath("positions.txt");
  boolean validLine = false;
  String[] splitInput = new String[2];
  int i = -1;
  int j = -1;
  try{
      System.out.println("Reading positions from file positions.txt");
    System.out.println("Disregarding invalid line format.");
    BufferedReader file;//= new BufferedReader(new FileReader(fileName));
    file = createReader(fileName);

    while ( (fileLine = file.readLine ())!=null){
      System.out.println("Read line: " + fileLine);
      splitInput = splitTokens(fileLine, ">");
      String first_entry = splitInput[0];
      String second_entry = splitInput[1];
      System.out.println(splitInput[0] + " " + splitInput[1]);

      if (!checkEmpty(first_entry)){
        selectSquare(first_entry);
        i = getIndexOfChessPieceAt(first_entry);
      }
      if (i!=-1){
        if (!checkEmpty(second_entry)){
          j = getIndexOfChessPieceAt(second_entry);
          chessPiecesAlive[j].kill();
        }
        chessPiecesAlive[i].updatePosition(second_entry);
        drawGrid();
        System.out.println(chessPiecesAlive[i].getName());
      }

    }
  } 
  catch (IOException e){  
    e.printStackTrace();
    fileLine = null;
  }
}


void keyPressed(){

  keyPress = keyPress + key;
  if (keyPress.length() == 2){
    //System.out.println("Keyboard press: " + keyPress);
    if (validPosition(keyPress)){
      if (!pieceSelected){
        selectPieceOnGrid(keyPress);
      }else{
        moveSelectedPiece(keyPress);
      }
    }else{
     //System.out.println("You entered an invalid position");
    }
    keyPress = ""; // Reset the key input
  }

  switch(key){
  case 'r':
  case 'R':
    readFile();
    break;
  case 'm':
  case 'M':
    break;
  }
}

boolean validPosition(String position){
  boolean validletter;
  boolean validnumber;
  validnumber = (int(position.charAt(0))-48 >= 1 && position.charAt(0)-48<=8);
  validletter = (int(position.charAt(1))-96 >= 1 && position.charAt(1)-96<=8);
  return (validnumber && validletter);
}

void promotionScreen(ChessPiece piece){
  pushMatrix();
  translate(width/2,height/2);
  rect(-255,-140,500,300);
  fill(gray);
  PImage chessImg;
  if (piece.colour == 0){
    tint(80);
  }else{
    noTint();
  }
  chessImg = loadImage("queen.png");
  image(chessImg, -240, -50);
  chessImg = loadImage("rook.png");
  image(chessImg, -110, -50);
  chessImg = loadImage("bishop.png");
  image(chessImg, 20, -50);
  chessImg = loadImage("knight.png");
  image(chessImg, 130, -50);
  popMatrix();
  //if((mouseY > 418) && (mouseY < 488)){
  //   if((mouseX > 200) && (mouseX < 300)){
  //     //queen
  //     piece.assignTypeImg("queen.png");
  //   }else if((mouseX > 360) && (mouseX < 422)){
  //     //rook
  //     piece.assignTypeImg("rook.png");
  //   }else if((mouseX > 484)&&(mouseX < 558)){
  //     //bishop
  //     piece.assignTypeImg("bishop.png");
  //   }else if((mouseX > 595)&&(mouseX < 666)){
  //     //knight
  //     piece.assignTypeImg("knight.png");
  //   }else{
  //     //nothing
  //     promotionScreen(piece);
  //   }
  }
  
  //System.out.println("X = " + mouseX + " Y = " + mouseY)

/*void switchDisplay(){
  drawGrid(); // Refresh the grid to be able to redraw all other chess pieces
  if (displayMode==0){
    displayMode=1;
  
  else{
    if (displayMode==1){
      displayMode=2;
    }else{
      displayMode=0;
    }
  }
  selectSquare(gridSelected); // Reselect the square/piece that was selected before the display change
}*/

class ChessPiece{
  String name;
  String position;
  int colour;
  int xcor;
  int ycor;
  int newxcor;
  int newycor;
  PImage chessImg;
  boolean isAlive = true;
  int moves = 0;

  public ChessPiece(String name, String position, int colour){
    this.name = name;
    this.position = position;
    this.colour = colour;
    assignTypeImg(name);
    xcor = convertToX(position);
    ycor = convertToY(position);
  }
  
  void setup(){
    size(100, 100);
    display();
  }

  void display(){
    assignPieceColour(this.colour);
    newxcor=convertToX(position);
    newycor=convertToY(position);
    pushMatrix();
    translate(xcor, ycor);
    if (displayMode==0){//img
      image(chessImg, -50, -50);
    }

    if (displayMode==1) { //text
      if (colour==0){
        fill(70);
      }
      else{
        fill(180);
      }
      text(name.charAt(0), 0, 0);
    }

    if (displayMode==2){ // text bold 
      if (xcor>450){
        image(chessImg, -50, -50);
      }else{
        if (colour==0){
          fill(70);
        }else{
          fill(180);
        }
        text(name.charAt(0), 0, 0);
      }
    }

    // For animation purposes: new x/y is the destination, x/y is the old destination. Change co-ordinates based off different.
    if (newxcor == xcor && newycor == ycor)
    {
    }else{
      if (xcor < newxcor){
        xcor=xcor + 2;
      }if (xcor > newxcor){
        xcor=xcor -2;
      }if (ycor < newycor){
        ycor=ycor+2;
      }if (ycor > newycor){
        ycor=ycor-2;
      }
    }
    popMatrix();
  }

  void assignTypeImg(String name){
    switch(name.charAt(0)){
      case 'P':
        chessImg = loadImage("pawn.png");
        break;
      case 'R':
        chessImg = loadImage("rook.png");
        break;
      case 'N':
        chessImg = loadImage("knight.png");
        break;
      case 'B':
        chessImg = loadImage("bishop.png");
        break;
      case 'Q':
        chessImg = loadImage("queen.png");
        break;
      case 'K':
        chessImg = loadImage("king.png");
        break;
    }
  }

  void assignPieceColour(int colour){
    if (colour == 0){
      tint(80);
      //filter(NORMAL);
    }else{
      noTint();
    }
  }


  void kill(){
    isAlive = false;
    position = "";
  }

  boolean isAlive(){
    return isAlive;
  }

  void updatePosition(String newPosition){
    moves++;
    this.position = newPosition;
  }

  boolean inDefaultPosition(){
    return (moves==0);
  }


  int convertToX(String position){
    return (((int(position.charAt(1))-96)) * 100);
  }

  int convertToY(String position){
    return ((57 - (int(position.charAt(0)))) * 100);
  }

  String getName(){
    return this.name;
  }
  
  String getPosition(){
    return position;
  }
  
  void undo(){
    moves--;
  }

  void promote(){
    name = "Queen";
    assignTypeImg(this.name);
  }

  int getColour(){
    return colour;
  }
}
