
int column = 2;
int row = 5;
int total = 0;
Die[] dice = new Die[column * row];
String totalString;
void setup() {
  //dice = new Die();
  size(800, 800);

  for (int i = 0; i < column; i++) {
    int xPos = 100 * i + 30;
    for (int j = 0; j < row; j++) {
      int  yPos = 100 * j + 30;
      dice[i * row + j] = new Die(xPos, yPos);
      //sum += dice[i * row * j].toggleNum;
    }
  }
  for (int b = 0; b < dice.length; b++) {
    dice[b].roll();
    total = total += dice[b].toggleNum;
  }
  println(total);
  total = 0;
  // dice.roll();
  //no loop means that draw is only called once
  //OR if you ever call redraw()
  //noLoop();
}

void draw() {

  for (int a = 0; a < dice.length; a++) {
    dice[a].CreateDice();
  }

  //your code here
}

void mousePressed() {
  for (int b = 0; b < dice.length; b++) {
    dice[b].roll();
    total = total += dice[b].toggleNum;
    //totalString = Integer.toString(total);
    //print(dice[dice.length - 2].);
  }
  println(total);
  total = 0;
  //dice.roll();


  //No real work for you to do here
  //calling redraw will do the necessary work 
  //to redraw your processing script
  redraw();
}


//Dice: Models a single 6 sided dice cube
//Each instance should randomly assign itself a value from 1 to 6
class Die {
  int xPos;
  int yPos;
  int sizeX = 50;
  int sizeY = 50;
  int toggleNum;
  //variable declarations for your Die instances here

  //constructor
  Die(int x, int y) {
    xPos = x;
    yPos = y;

    //variable initializations here
  }

  //Simulate a roll of a die
  void roll() {
    toggleNum = (int)random(1, 7);
    //your code here, 
    //should randomly assign a value from 1 to 6
  }

  /*
	  Use the randomly assigned roll value to draw the face of a die
   	*/
  void ShowNumbers() {

    switch(toggleNum) {
    case 1 :
      fill(0);
      ellipse(xPos + sizeX/2, yPos + sizeY/2, 10, 10);
      break;

    case 2 :
      fill(0);
      ellipse(xPos + sizeX/1.5, yPos + sizeY/2, 10, 10);
      ellipse(xPos + sizeX/3, yPos + sizeY/2, 10, 10);
      break;

    case 3 :
      fill(0);
      // a three dice is diagonal
      ellipse(xPos + sizeX/2, yPos + sizeY/3, 10, 10);
      ellipse(xPos + sizeX/1.5, yPos + sizeY/1.75, 10, 10);
      ellipse(xPos + sizeX/3, yPos + sizeY/1.75, 10, 10);
      break;

    case 4 :
      fill(0);

      ellipse(xPos + sizeX/1.5, yPos + sizeY/1.5, 10, 10);
      ellipse(xPos + sizeX/3, yPos + sizeY/2.5, 10, 10);
      ellipse(xPos + sizeX/1.5, yPos + sizeY/2.5, 10, 10);
      ellipse(xPos + sizeX/3, yPos + sizeY/1.5, 10, 10);
      break;

    case 5 :
      fill(0);
      ellipse(xPos + sizeX/2, yPos + sizeY/2, 10, 10);
      ellipse(xPos + sizeX/1.5, yPos + sizeY/1.5, 10, 10);
      ellipse(xPos + sizeX/3, yPos + sizeY/3, 10, 10);
      ellipse(xPos + sizeX/1.5, yPos + sizeY/3, 10, 10);
      ellipse(xPos + sizeX/3, yPos + sizeY/1.5, 10, 10);
      break;

    case 6 :
      fill(0);
      ellipse(xPos + sizeX/1.5, yPos + sizeY/2, 10, 10);
      ellipse(xPos + sizeX/3, yPos + sizeY/2, 10, 10);
      ellipse(xPos + sizeX/1.5, yPos + sizeY/1.25, 10, 10);
      ellipse(xPos + sizeX/3, yPos + sizeY/4.25, 10, 10);
      ellipse(xPos + sizeX/1.5, yPos + sizeY/4.25, 10, 10);
      ellipse(xPos + sizeX/3, yPos + sizeY/1.25, 10, 10);
      break;
    }
  }
  void CreateDice() {



    fill(255);
    rect(xPos, yPos, sizeX, sizeY, 2);

    ShowNumbers();
  }
  void show() {



    //your code here
  }
}
