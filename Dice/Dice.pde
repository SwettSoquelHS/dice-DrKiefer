
int column = 2;
int row = 5;
int total = 0;
Die[] dice = new Die[column * row];
String totalString;
boolean changeEnemy = true;
int RandomXP;
EnemyAi ai = new EnemyAi();
int XP = 0;
int totalXP = 0;
int newTotal;
int NewHealth;
int addXpos = 450;
TextManager textt = new TextManager();
int deadHealth;
int SizeX, SizeY, stage;
void setup() {
  Menu();
  
  
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
 
  total = 0;
  
  
}
void Menu() {

  stage = 1;
 
}
void MenuStage() {
  if (stage == 1) {
    textAlign(CENTER);
    textSize(50);
    fill(50);
    text("Dungeons And Dice", width/2, height/2);
    textSize(10);
    fill(50);
    text("Press Left Mouse to Continue", width/2, height/2 + 50);
  }

  if (stage == 2) {

    ProcessCommand();
  }
}
void draw() {
 background(0);
  MenuStage();
}
void ProcessCommand() {
  
  for (int a = 0; a < dice.length; a++) {
    dice[a].CreateDice();
  }
  ai.CreateEnemy();
  
  String s = "Damage Dealt: " + newTotal;
  fill(50);
  textSize(32);
  text(s, width/2 - 200, height - 100);
}
void mousePressed() {
  stage = 2;
  for (int b = 0; b < dice.length; b++) {
    dice[b].roll();
    total = total += dice[b].toggleNum;
    
  }
  newTotal = total;


  

  ai.Roll2();
  total = 0;
  


 
  redraw();
 
}



class Die {
  int xPos;
  int yPos;
  int sizeX = 50;
  int sizeY = 50;
  int toggleNum;
  
  Die(int x, int y) {
    xPos = x;
    yPos = y;

   
  }

  
  void roll() {

    toggleNum = (int)random(1, 7);
   
  }

  
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
      ellipse(xPos + sizeX/3.6, yPos + sizeY/3.6, 10, 10);
      ellipse(xPos + sizeX/2, yPos + sizeY/2, 10, 10);
      ellipse(xPos + sizeX/1.3, yPos + sizeY/1.3, 10, 10);
      break;

    case 4 :
      fill(0);

      ellipse(xPos + sizeX/1.3, yPos + sizeY/1.3, 10, 10);
      ellipse(xPos + sizeX/3.6, yPos + sizeY/3.6, 10, 10);
      ellipse(xPos + sizeX/1.3, yPos + sizeY/3.6, 10, 10);
      ellipse(xPos + sizeX/3.6, yPos + sizeY/1.3, 10, 10);
      break;

    case 5 :
      fill(0);
      ellipse(xPos + sizeX/2, yPos + sizeY/2, 10, 10);
      ellipse(xPos + sizeX/1.3, yPos + sizeY/1.3, 10, 10);
      ellipse(xPos + sizeX/3.6, yPos + sizeY/3.6, 10, 10);
      ellipse(xPos + sizeX/1.3, yPos + sizeY/3.6, 10, 10);
      ellipse(xPos + sizeX/3.6, yPos + sizeY/1.3, 10, 10);
      break;

    case 6 :
      fill(0);
      ellipse(xPos + sizeX/1.3, yPos + sizeY/2, 10, 10);
      ellipse(xPos + sizeX/3.6, yPos + sizeY/2, 10, 10);
      ellipse(xPos + sizeX/1.3, yPos + sizeY/1.25, 10, 10);
      ellipse(xPos + sizeX/3.6, yPos + sizeY/4.25, 10, 10);
      ellipse(xPos + sizeX/1.3, yPos + sizeY/4.25, 10, 10);
      ellipse(xPos + sizeX/3.6, yPos + sizeY/1.25, 10, 10);
      break;
    }
  }
  void CreateDice() {



    fill(255);
    rect(xPos, yPos, sizeX, sizeY, 2);

    ShowNumbers();
  }
  
}

class EnemyAi {
  int changeNum;

  int health = (int)random(100, 500);
  EnemyAi() {
  }
  void Roll2() {

    if (changeEnemy == true) {

      changeNum  = (int)random(1, 4);
    }

    if (changeEnemy == false) {
      ai.healthmethod();
    }
  }

  void CreateEnemy() {
    fill(255);

    DisplayEnemy();
  }

  void DisplayEnemy() {

    switch(changeNum) {

    case 1: //ogre
      fill(66, 142, 4);
      stroke(0);
      strokeWeight(2);
      ellipse(200 + addXpos, 200, 250, 250);

      strokeWeight(3);
      fill(255);
      ellipse(150 + addXpos, 100, 90, 90);

      fill(0);
      ellipse(125 + addXpos, 95, 30, 30);

      fill(255);
      ellipse(250 + addXpos, 100, 90, 90);

      fill(0);
      ellipse(260 + addXpos, 95, 30, 30);

      fill(255, 180, 180);
      arc(200 + addXpos, 220, 150, 150, 0, PI);

      fill(255);
      rect(210 + addXpos, 220, 30, 40);

      fill(255);
      rect(190 + addXpos, 220, 30, 40);

      textt.ShowText("An Ogre Has Appeared!!");
      changeEnemy = false;

      break;

    case 2: //cyclops
      fill(22, 51, 0);
      stroke(0);
      strokeWeight(2);
      ellipse(200 + addXpos, 200, 250, 250);

      strokeWeight(3);
      fill(255);
      ellipse(200 + addXpos, 150, 90, 90);

      fill(0);
      ellipse(200 + addXpos, 150, 30, 30);


      fill(127, 38, 0);
      arc(200 + addXpos, 220, 150, 150, 0, PI);

      fill(255);
      triangle(170 + addXpos, 220, 198 + addXpos, 275, 226 + addXpos, 220);
      
      textt.ShowText("An Angry Cyclops Want Blood!!");
      changeEnemy = false;

      break;

    case 3: //cacodemon
      fill(109, 0, 0);
      stroke(0);
      strokeWeight(2);
      ellipse(200 + addXpos, 200, 250, 250);

      strokeWeight(3);
      fill(255); //eye1
      ellipse(200 + addXpos, 150, 90, 90);

      fill(0);
      ellipse(200 + addXpos, 150, 30, 30);

      //rest of body
      fill(127, 38, 0);
      arc(200 + addXpos, 220, 150, 150, 0, PI);
      //tooth
      fill(255);
      triangle(150 + addXpos, 220, 178 + addXpos, 275, 206 + addXpos, 220);
      triangle(170 + addXpos, 220, 198 + addXpos, 275, 226 + addXpos, 220);
      triangle(190 + addXpos, 220, 218 + addXpos, 275, 246 + addXpos, 220);
      triangle(210 + addXpos, 220, 238 + addXpos, 275, 266 + addXpos, 220);

      textt.ShowText("A Cacodemon has Appeared");

      changeEnemy = false;
      break;
     
    }
  }

  void healthmethod() {
    NewHealth = health -= total;

  

    if (health < 0) {
   
      changeEnemy = true;
      health = (int)random(100, 500);
      deadHealth = health;
      changeNum  = (int)random(1, 4);
    }
  }
 
}

class TextManager {
  TextManager() {
  }

  void ShowText(String s) {

    fill(50);
    textSize(32);
    text(s, width/2 - 200, height/1.3);
  }
}
