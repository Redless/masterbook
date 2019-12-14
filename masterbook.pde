//TO DO: add blue circle, add front cover, add back cover, different colors for different sets
import processing.pdf.*;
float scale;
String creator;
String title;
String set;
String specifics;
String story;
String hints;
String[] wincons;
int looppossibilities;
String[] counts;
int[] difficulties;
PFont boldfont;
PFont otherfont;
PFont titlefont;
boolean leftHandSide;
boolean rightHandSide;
PFont numFont;

void drawFrontCover() {
  textAlign(LEFT);
  pushMatrix();
  translate(1600, 50);
  rotate(HALF_PI);

  pushMatrix();
  translate(1050,0);

  fill(252,242,228);

  PImage img = loadImage("matsermind.png");
  image(img,0, 80*scale, 560*scale, 720*scale);
  
  fill(73,57,42);

  rect(0,0,560*scale,80*scale);
  
  tragedyLooper(50,120,160);
  
  textFont(boldfont);
  textSize(120);
  fill(250);
  textAlign(CENTER);
  text("MASTERMIND'S\nHANDBOOK",280*scale,1160);
  
  fill(165,155,16);
  rect(10*scale,1330,540*scale,150,20);
  
  fill(0);
  textSize(50);
  text("Warning!",280*scale,1390);
  textSize(25);
  text("This booklet contains scripts for the Mastermind. Reading further will\nhamper your ability to participate in these scenarios as a Protagonist.",280*scale,1430);

  popMatrix();
  popMatrix();
}

void tragedyLooper(int x, int y, int size) {
  fill(151,137,77);
  textFont(titlefont);
  textSize(size); //55
  text("T",x,y);
  textSize(size*2/3);
  text("RAGEDY",x+size*.6,y);
  textSize(size);
  text("L",x+size*100/18*.6,y);
  textSize(size*2/3);
  text("OOPER",x+size*116/18*.6,y);
}


void drawBackCover() {
  textAlign(LEFT);
  pushMatrix();
  translate(1600, 50);
  rotate(HALF_PI);

  pushMatrix();
  translate(0,0);

  fill(27,17,16);

  rect(0, 0, 560*scale, 800*scale);

  fill(73,57,42);

  rect(0,0,1050,105);
  
  tragedyLooper(55,40*105/60,45*105/60);
  
  fill(132,212,210);
  textFont(boldfont);
  textSize(25);
  text("UMINEKO REFERENCE",105,105*105/60);
  fill(250);
  textFont(otherfont);
  String stringOn = "Behold the sweetfish river running through my beloved hometown.  You who seek the Golden Land, follow its path downstream in search of the \nkey. \nAs you travel down it, you will see a village.  In that village, look for the shore the two will tell you of.  There sleeps the key to the Golden Land. \n \nThe one who obtains the key must then travel to the Golden Land in accordance with these rules.  On the first twilight, offer the six chosen by the key as sacrifices.  On the second twilight, those who remain shall tear apart the two who are close.  On the third twilight, those who remain shall praise my noble name.  On the fourth twilight, gouge the head and kill.  On the fifth twilight, gouge the chest and kill.  On the sixth twilight, gouge the stomach and kill.  On the seventh twilight, gouge the knee and kill.  On the eighth twilight, gouge the leg and kill.  On the ninth twilight, the witch shall revive, and none shall be left alive.  On the tenth twilight, at journey's end, you shall attain to the power of the Golden Land's treasures, once and for the last time.  The witch shall praise the wise and bestow four treasures.  One shall be all the gold from the Golden Land.  One shall be the resurrection of all the dead souls.  One shall be the resurrection of the love that was lost.  One shall be to put the witch to sleep for all time.  Sleep peacefully, my beloved witch, Beatrice. ";
  String word;
  int xval = 105;
  for (float yval = 105*105/60 + 35; yval < 9999; yval = yval + 15*scale+5) {
    String linetoprint = "";
    boolean jump= false;
    word = "";
    while (textWidth(linetoprint+word) < 500*105/60 && stringOn.length() > 0 && !jump) {
      linetoprint = linetoprint + word;
      if (linetoprint.length() > 0) {
        word = " ";
      }
      while (stringOn.length() > 0 && stringOn.charAt(0) != ' ' && stringOn.charAt(0) != '\n') {
        
        word = word + stringOn.charAt(0);
        stringOn = stringOn.substring(1);
      }
      if (stringOn.length() > 0)  {
        jump = stringOn.charAt(0) == '\n';
        stringOn = stringOn.substring(1);//issue?
      }
    }
    if (textWidth(linetoprint + word) >= 500*105/60 || jump) {
      if (stringOn.length() == 0) {
        stringOn = word;
      } else {
        stringOn = word + " " + stringOn;
      }
    } else {
      if (stringOn.length() != 0) {
        linetoprint = linetoprint + " " + word;
      } else {
        linetoprint = linetoprint + word;
      }
    }
    text(linetoprint,xval,yval);
    if (stringOn.length() == 0) {
      yval = yval + 5*scale;
    }
  }
  
  fill(91,38,25);
  rect(0,105,40*scale,1500-105);
  rect(0,760*scale,560*scale,40*scale);
  fill(0);
  rect(16*scale,105,24*scale,1500-105-17*scale);
  rect(16*scale,760*scale,544*scale,24*scale);
  fill(150,70,30);
  rect(20*scale,105,20*scale,1500-105-21*scale);
  rect(20*scale,760*scale,540*scale,20*scale);
  popMatrix();
  popMatrix();
}

void drawCircle(float x,float y,float size,String label) {
  noFill();
  stroke(150);
  
  strokeWeight(size*3/44);
  line(x,y+size*32/44,x,y+size*38/44);
  strokeWeight(size*2/44);
  line(x,y,x,y-size*32/44);
  line(x,y,x-size*20/44,y);
  line(x,y+size*32/44,x,y+size);
  strokeWeight(size*1/44);
  line(x,y,x-size*25/44,y+size*25/44);
  line(x,y,x-size*25/44,y-size*25/44);
  line(x,y,x,y-size*40/44);
  line(x,y,x-size*40/44,y);
  line(x,y,x+size*28/44,y);
  line(x,y,x+size*28/44*sqrt(3)/2,y+size*30/44*1/2);
  line(x,y,x+size*28/44*sqrt(3)/2,y-size*30/44*1/2);
  
  strokeWeight(size*3/44);
  arc(x,y,size*64/44,size*64/44,PI/4.,PI*13./8.);
  arc(x,y,size*54/44,size*54/44,PI*5./8.,PI*7./8.);
  strokeWeight(size*2/44);
  arc(x,y,size*54/44,size*54/44,PI*17./16.,PI*25./16.);
  //strokeWeight(size*1/44);
  arc(x,y,size*52/44,size*52/44,-PI/4.,PI*3./8.);
  
  strokeWeight(size/44);
  circle(x,y+size*26/44,size*8/44);
  fill(0,152,193);
  strokeWeight(size/88);
  circle(x,y,size);
  noStroke();
  
  
  numFont = createFont("Lucida Sans Bold.otf", size*.75);
  //numFont = createFont("Lucida Sans Bold.otf",12*scale);
  textFont(numFont);
  fill(250);
  textAlign(CENTER, CENTER);
  text(label,x,y-size*3/44);
  textAlign(LEFT);
  noStroke();
}

void setup() {
  noStroke();

  size(1700, 2200, PDF, "mmbook.pdf");
  scale = 15./8.;

  creator = "Redless";
  title = "GOHDA CULPRIT THEORY";
  set = "Rokkenjima Serial\nMurders";

  specifics = "I wrote this test script to try and illustrate the type of stuff you can do with this software, without spoiling the info from any of the book scripts. I also tried to make some umineko references, without spoilers. I am really happy with the direction this project is going. I hope those reading it think so too. I want to revive tragedy looper, it's the only game I love. It's funny to me how much of a monomaniac I've become.";
  story = "One thing I've learned on my travels is that people respond to visual humor much more readily than text based humor. They may even prefer it to humor said aloud, but I'm not actually sure about that. I think character-driven humor is essentially the most powerful, however. I also think that I'm not going to be able to play this marvel of a game much more after I finish college, and it's something I miss. I wish I could build a lot of my life around playing this (the social part of my life, at least), but I also want a wife, and that's going to require going on dates with many people, most of which won't like tragedy looper, I think.";
  hints = "So when you're playing this script you're going to want to start every loop by picking 3 locations at random and placing both of your intrigue cards and a random third card on those locations. That'll really keep the protagonists guessing, so it's definitely a really good play. As for paranoia, don't pick exactly one incident to trigger and play +1 paranoia on the culprit every single day after day 1. Make sure to use the conspiracy theorist's ability constantly so that your protagonists can figure it out for the final guess. If there's one thing I've learned from writing tragedy looper scripts, it's that hiding conspiracy theorist is overpowered and you have to put in lots of strong, preventable incidents to keep that from happening. Anyhow, for the final guess, try to hide the friend or brain, both of which are great because you can give away who they are by the way you play, which adds a welcome 'Yomi' aspect to the game. Don't forget to brush your teeth every night before you go to bed. I love the mountains in Utah, the hiking there is unparalleled.";
  wincons = new String[] {"Break the Protagonist's Ankles","Just juke them really hard","Constantly block goodwill on office worker or mystery boy","LOL get rekt","Protagonists don't realize the 1 specific way to solve this script","But they guess randomly and win anyways. Omegadespair. But you can still be happy for them. But not too happy, but you do know that you played your best and they beat you, and in many ways that's the best way for a game to end. So it's quite good imo. Great work."};

  looppossibilities = 2;
  counts = new String[] {"4","3","9"};
  difficulties = new int[] {4,6,0};

  boldfont = createFont("Lucida Sans Bold.otf",12*scale);
  otherfont = createFont("Lucida Sans Regular.ttf",12*scale);
  titlefont = createFont("colonna-mt.ttf",32*scale);
  //Colonna Std Regular is the font used. https://www.myfonts.com/fonts/mti/colonna-mt/std-regular/

  leftHandSide = true;
  rightHandSide = true;

//pages are 7 by 10 (560 b6 800)
//2 pages is 14 by 10
//that's equivalent to 2100 by 1500
  PGraphicsPDF pdf = (PGraphicsPDF) g;
  background(255);
  drawFrontCover();
  drawBackCover();
  pdf.nextPage();
  pushMatrix();
  translate(1700,2200);
  scale(-1);
  drawRightHandSide();
  drawLeftHandSide();
  pdf.nextPage();
  popMatrix();
  drawRightHandSide();
  drawLeftHandSide();
  pdf.nextPage();
  pushMatrix();
  translate(1700,2200);
  scale(-1);
  drawRightHandSide();
  drawLeftHandSide();
}

//Colonna Std Regular is the font used. https://www.myfonts.com/fonts/mti/colonna-mt/std-regular/
void drawRightHandSide() {
  textAlign(LEFT);
  pushMatrix();
  translate(1600, 50);
  rotate(HALF_PI);

  pushMatrix();
  translate(1050,0);

  fill(252,242,228);

  rect(0, 0, 560*scale, 800*scale);

  fill(60,25,12);

  rect(0,0,1050,18*15);
  drawCircle(scale*540/8,scale*540/7,31./525*scale*540,"1");
  textFont(boldfont);

  fill(255);

  text("Creator:",110*scale,56*scale);
  textFont(otherfont);
  text(creator,170*scale,56*scale);

  fill(150,115,60);
  textFont(titlefont);
  text(title,108*scale,80*scale);

  fill(255);
  textFont(boldfont);
  text(set+" Set",412*scale,100*scale);

  for (int i = 0; i < looppossibilities; i++) {
    fill(255);
    text("Loops: "+counts[i]+" / difficulty:",110*scale,(102+18*i)*scale);
    for (int j = 0; j < 8; j++) {
      if (j < difficulties[i]) {
        fill(0,152,193);
      } else {
        fill(0);
      }
      circle((266+13*j)*scale,(98+(18*i))*scale,12*scale);
    }
  }

  float xval = 37.;
  int curOn = 0;
  String stringOn = "";

  PFont textfont = createFont("Lucida Sans Regular.ttf",10*scale);
  PFont boldtextfont = createFont("Lucida Sans Bold.otf",10*scale);

  String word = "";

  textFont(textfont);


  for (float yval = 170*scale; yval < 740*scale; yval = yval + 15*scale) {
    String linetoprint = "";
    if (stringOn.length() == 0) {
      if (curOn == 0) {
        textFont(boldtextfont);
        text("Specifics",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = specifics;
        textFont(textfont);
      } else if (curOn == 1) {
        textFont(boldtextfont);
        text("Story",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = story;
        textFont(textfont);
      } else if (curOn == 2) {
        textFont(boldtextfont);
        text("Hints for the Mastermind",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = hints;
        textFont(textfont);
      } else {
        break;
      }
    }
    word = "";
    while (textWidth(linetoprint+word) < 222*scale && stringOn.length() > 0) {
    
      linetoprint = linetoprint + word;
      if (linetoprint.length() > 0) {
        word = " ";
      }
      while (stringOn.length() > 0 && stringOn.charAt(0) != ' ') {
        word = word + stringOn.charAt(0);
        stringOn = stringOn.substring(1);
      }
      if (stringOn.length() > 0)  {
        stringOn = stringOn.substring(1);//issue?
      }
    }
    if (textWidth(linetoprint + word) >= 222*scale) {
      if (stringOn.length() == 0) {
        stringOn = word;
      } else {
        stringOn = word + " " + stringOn;
      }
    } else {
      if (stringOn.length() != 0) {
        linetoprint = linetoprint + " " + word;
      } else {
        linetoprint = linetoprint + word;
      }
    }
    text(linetoprint,xval*scale,yval);
    if (stringOn.length() == 0) {
      yval = yval + 5*scale;
    }
  }

  xval = 274;
  float savey = 0;

  for (float yval = 170*scale; yval < 740*scale; yval = yval + 15*scale) {
    String linetoprint = "";
    if (stringOn.length() == 0) {
      if (curOn == 0) {
        textFont(boldtextfont);
        text("Specifics",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = specifics;
        textFont(textfont);
      } else if (curOn == 1) {
        textFont(boldtextfont);
        text("Story",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = story;
        textFont(textfont);
      } else if (curOn == 2) {
        textFont(boldtextfont);
        text("Hints for the Mastermind",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = hints;
        textFont(textfont);
      } else {
        break;
      }
    }
    word = "";
    while (textWidth(linetoprint+word) < 222*scale && stringOn.length() > 0) {
      linetoprint = linetoprint + word;
      if (linetoprint.length() > 0) {
        word = " ";
      }
      while (stringOn.length() > 0 && stringOn.charAt(0) != ' ') {
        word = word + stringOn.charAt(0);
        stringOn = stringOn.substring(1);
      }
      if (stringOn.length() > 0)  {
        stringOn = stringOn.substring(1);
      }
    }
    if (textWidth(linetoprint + word) >= 222*scale) {
      if (stringOn.length() == 0) {
        stringOn = word;
      } else {
        stringOn = word + " " + stringOn;
      }
    } else {
      if (stringOn.length() != 0) {
        linetoprint = linetoprint + " " + word;
      } else {
        linetoprint = linetoprint + word;
      }
    }
    text(linetoprint,xval*scale,yval);
    if (stringOn.length() == 0) {
      yval = yval + 5*scale;
    }
    savey = yval;
  }
  fill(60,25,12);
  savey = savey+20.*scale;

  rect((xval)*scale,savey,220*scale,68*scale,11*scale);
  savey = savey+7.*scale;
  fill(205,198,0);
  textFont(boldtextfont);
  textAlign(CENTER,TOP);
  text("VICTORY CONDITIONS\nFOR THE MASTERMIND",(xval+110)*scale,savey);
  textAlign(LEFT,TOP);
  curOn = 0;
  fill(250);
  xval = 300;
  boolean firstline = true;
  for (float yval = savey + 30*scale; yval < 740*scale; yval = yval + 15*scale) {
    boolean drawrect = true;
    if (firstline) {
      if (wincons.length == curOn) {
        break;
      }
      stringOn = wincons[curOn];
      fill(60,25,12);
      rect(274*scale,yval,220*scale,68*scale,11*scale);
      if (curOn%2 == 0) {
        textFont(boldtextfont);
        fill(250);
        text(str(curOn/2+1)+".",286*scale,yval);
      } else {
        textFont(textfont);
      }
      curOn = curOn + 1;
      firstline = false;
      drawrect = false;
    }
  
    String linetoprint = "";
  
    word = "";
    while (textWidth(linetoprint+word) < 180*scale && stringOn.length() > 0) {
      linetoprint = linetoprint + word;
      if (linetoprint.length() > 0) {
        word = " ";
      }
      while (stringOn.length() > 0 && stringOn.charAt(0) != ' ') {
        word = word + stringOn.charAt(0);
        stringOn = stringOn.substring(1);
      }
      if (stringOn.length() > 0)  {
        stringOn = stringOn.substring(1);
      }
    }
    if (textWidth(linetoprint + word) >= 180*scale) {
      if (stringOn.length() == 0) {
        stringOn = word;
      } else {
        stringOn = word + " " + stringOn;
      }
    } else {
      if (stringOn.length() != 0) {
        linetoprint = linetoprint + " " + word;
      } else {
        linetoprint = linetoprint + word;
      }
    }
    if (drawrect) {
      fill(60,25,12);
      rect(274*scale,yval,220*scale,32*scale,0,0,11*scale,11*scale);
    }
    fill(250);
    text(linetoprint,xval*scale,yval);
    if (stringOn.length() == 0) {
      firstline = true;
    }
  }
  fill(91,38,25);
  rect(0,760*scale,560*scale,40*scale);
  rect(520*scale,(18*8)*scale,40*scale,(800-18*8)*scale);
  fill(0);
  rect(0,760*scale,544*scale,24*scale);
  rect(520*scale,(18*8)*scale,24*scale,(784-18*8)*scale);
  fill(150,70,30);
  rect(0,760*scale,540*scale,20*scale);
  rect(520*scale,(18*8)*scale,20*scale,(780-18*8)*scale);
  popMatrix();
  popMatrix();
}



void drawLeftHandSide() {
  textAlign(LEFT);
  pushMatrix();
  translate(1600, 50);
  rotate(HALF_PI);

  pushMatrix();
  translate(0,0);

  fill(252,242,228);

  rect(0, 0, 560*scale, 800*scale);

  fill(60,25,12);

  rect(0,0,1050,18*15);
  drawCircle(scale*90,scale*72,31./525*scale*540,"2");
  textFont(boldfont);

  fill(255);

  text("Creator:",130*scale,56*scale);
  textFont(otherfont);
  text(creator,190*scale,56*scale);

  fill(150,115,60);
  textFont(titlefont);
  text(title,128*scale,80*scale);

  fill(255);
  textFont(boldfont);
  text(set+" Set",432*scale,100*scale);

  for (int i = 0; i < looppossibilities; i++) {
    fill(255);
    text("Loops: "+counts[i]+" / difficulty:",130*scale,(102+18*i)*scale);
    for (int j = 0; j < 8; j++) {
      if (j < difficulties[i]) {
        fill(0,152,193);
      } else {
        fill(0);
      }
      circle((286+13*j)*scale,(98+(18*i))*scale,12*scale);
    }
  }

  float xval = 57.;
  int curOn = 0;
  String stringOn = "";

  PFont textfont = createFont("Lucida Sans Regular.ttf",10*scale);
  PFont boldtextfont = createFont("Lucida Sans Bold.otf",10*scale);

  String word = "";

  textFont(textfont);


  for (float yval = 170*scale; yval < 740*scale; yval = yval + 15*scale) {
    String linetoprint = "";
    if (stringOn.length() == 0) {
      if (curOn == 0) {
        textFont(boldtextfont);
        text("Specifics",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = specifics;
        textFont(textfont);
      } else if (curOn == 1) {
        textFont(boldtextfont);
        text("Story",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = story;
        textFont(textfont);
      } else if (curOn == 2) {
        textFont(boldtextfont);
        text("Hints for the Mastermind",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = hints;
        textFont(textfont);
      } else {
        break;
      }
    }
    word = "";
    while (textWidth(linetoprint+word) < 222*scale && stringOn.length() > 0) {
    
      linetoprint = linetoprint + word;
      if (linetoprint.length() > 0) {
        word = " ";
      }
      while (stringOn.length() > 0 && stringOn.charAt(0) != ' ') {
        word = word + stringOn.charAt(0);
        stringOn = stringOn.substring(1);
      }
      if (stringOn.length() > 0)  {
        stringOn = stringOn.substring(1);//issue?
      }
    }
    if (textWidth(linetoprint + word) >= 222*scale) {
      if (stringOn.length() == 0) {
        stringOn = word;
      } else {
        stringOn = word + " " + stringOn;
      }
    } else {
      if (stringOn.length() != 0) {
        linetoprint = linetoprint + " " + word;
      } else {
        linetoprint = linetoprint + word;
      }
    }
    text(linetoprint,xval*scale,yval);
    if (stringOn.length() == 0) {
      yval = yval + 5*scale;
    }
  }

  xval = 294;
  float savey = 0;

  for (float yval = 170*scale; yval < 740*scale; yval = yval + 15*scale) {
    String linetoprint = "";
    if (stringOn.length() == 0) {
      if (curOn == 0) {
        textFont(boldtextfont);
        text("Specifics",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = specifics;
        textFont(textfont);
      } else if (curOn == 1) {
        textFont(boldtextfont);
        text("Story",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = story;
        textFont(textfont);
      } else if (curOn == 2) {
        textFont(boldtextfont);
        text("Hints for the Mastermind",xval*scale,yval);
        yval = yval + 15*scale;
        curOn++;
        stringOn = hints;
        textFont(textfont);
      } else {
        break;
      }
    }
    word = "";
    while (textWidth(linetoprint+word) < 222*scale && stringOn.length() > 0) {
      linetoprint = linetoprint + word;
      if (linetoprint.length() > 0) {
        word = " ";
      }
      while (stringOn.length() > 0 && stringOn.charAt(0) != ' ') {
        word = word + stringOn.charAt(0);
        stringOn = stringOn.substring(1);
      }
      if (stringOn.length() > 0)  {
        stringOn = stringOn.substring(1);
      }
    }
    if (textWidth(linetoprint + word) >= 222*scale) {
      if (stringOn.length() == 0) {
        stringOn = word;
      } else {
        stringOn = word + " " + stringOn;
      }
    } else {
      if (stringOn.length() != 0) {
        linetoprint = linetoprint + " " + word;
      } else {
        linetoprint = linetoprint + word;
      }
    }
    text(linetoprint,xval*scale,yval);
    if (stringOn.length() == 0) {
      yval = yval + 5*scale;
    }
    savey = yval;
  }
  fill(60,25,12);
  savey = savey+20.*scale;

  rect((xval)*scale,savey,220*scale,68*scale,11*scale);
  savey = savey+7.*scale;
  fill(205,198,0);
  textFont(boldtextfont);
  textAlign(CENTER,TOP);
  text("VICTORY CONDITIONS\nFOR THE MASTERMIND",(xval+110)*scale,savey);
  textAlign(LEFT,TOP);
  curOn = 0;
  fill(250);
  xval = 320;
  boolean firstline = true;
  for (float yval = savey + 30*scale; yval < 740*scale; yval = yval + 15*scale) {
    boolean drawrect = true;
    if (firstline) {
      if (wincons.length == curOn) {
        break;
      }
      stringOn = wincons[curOn];
      fill(60,25,12);
      rect(294*scale,yval,220*scale,68*scale,11*scale);
      if (curOn%2 == 0) {
        textFont(boldtextfont);
        fill(250);
        text(str(curOn/2+1)+".",306*scale,yval);
      } else {
        textFont(textfont);
      }
      curOn = curOn + 1;
      firstline = false;
      drawrect = false;
    }
  
    String linetoprint = "";
  
    word = "";
    while (textWidth(linetoprint+word) < 180*scale && stringOn.length() > 0) {
      linetoprint = linetoprint + word;
      if (linetoprint.length() > 0) {
        word = " ";
      }
      while (stringOn.length() > 0 && stringOn.charAt(0) != ' ') {
        word = word + stringOn.charAt(0);
        stringOn = stringOn.substring(1);
      }
      if (stringOn.length() > 0)  {
        stringOn = stringOn.substring(1);
      }
    }
    if (textWidth(linetoprint + word) >= 180*scale) {
      if (stringOn.length() == 0) {
        stringOn = word;
      } else {
        stringOn = word + " " + stringOn;
      }
    } else {
      if (stringOn.length() != 0) {
        linetoprint = linetoprint + " " + word;
      } else {
        linetoprint = linetoprint + word;
      }
    }
    if (drawrect) {
      fill(60,25,12);
      rect(294*scale,yval,220*scale,32*scale,0,0,11*scale,11*scale);
    }
    fill(250);
    text(linetoprint,xval*scale,yval);
    if (stringOn.length() == 0) {
      firstline = true;
    }
  }
  fill(91,38,25);
  rect(0,760*scale,560*scale,40*scale);
  rect(0,(18*8)*scale,40*scale,(800-18*8)*scale);
  fill(0);
  rect(16*scale,760*scale,544*scale,24*scale);
  rect(16*scale,(18*8)*scale,24*scale,(784-18*8)*scale);
  fill(150,70,30);
  rect(20*scale,760*scale,540*scale,20*scale);
  rect(20*scale,(18*8)*scale,20*scale,(780-18*8)*scale);
  popMatrix();
  popMatrix();
}
