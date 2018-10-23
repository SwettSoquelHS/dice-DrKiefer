Die dice;
void setup() {
  dice = new Die();
  size(400, 400);

  //no loop means that draw is only called once
  //OR if you ever call redraw()
  //noLoop();
}

void draw() {

  dice.CreateDice(5, 5);
  //your code here
}

void mousePressed() {
  //No real work for you to do here
  //calling redraw will do the necessary work 
  //to redraw your processing script
  redraw();
}


//Dice: Models a single 6 sided dice cube
//Each instance should randomly assign itself a value from 1 to 6
class Die {
  int xPos = 5;
  int yPos = 5;
  int sizeX = 50;
  int sizeY = 50;
  int toggleNum = (int)random(4, 5);
  //variable declarations for your Die instances here

  //constructor
  Die() {


    //variable initializations here
  }

  //Simulate a roll of a die
  void roll() {
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
      break;

    case 6 :
      fill(0);
      ellipse(xPos + sizeX/2, yPos + sizeY/2, 10, 10);
      break;
    }
  }
  void CreateDice(int x, int y) {
    x = sizeX;
    y = sizeY;
    for (int i = 0; i < x; i++) {
      xPos = 100 * i + 30;
      for (int j = 0; j < y; j++) {
        yPos = 100 * j + 30;
        fill(255);
        rect(xPos, yPos, sizeX, sizeY, 2);
        ShowNumbers();
      }
    }
  }
  void show() {



    //your code here
  }
}
