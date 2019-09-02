//TO DO: add blue circle, add front cover, add back cover, different colors for different sets

import processing.pdf.*;

size(1700, 2200, PDF, "mmbook.pdf");
float scale = 15./8.;


String creator = "Redless";
String title = "GOHDA CULPRIT THEORY";
String set = "Rokkenjima Serial\nMurders";

String specifics = "I wrote this test script to try and illustrate the type of stuff you can do with this software, without spoiling the info from any of the book scripts. I also tried to make some umineko references, without spoilers. I am really happy with the direction this project is going. I hope those reading it think so too. I want to revive tragedy looper, it's the only game I love. It's funny to me how much of a monomaniac I've become.";
String story = "One thing I've learned on my travels is that people respond to visual humor much more readily than text based humor. They may even prefer it to humor said aloud, but I'm not actually sure about that. I think character-driven humor is essentially the most powerful, however. I also think that I'm not going to be able to play this marvel of a game much more after I finish college, and it's something I miss. I wish I could build a lot of my life around playing this (the social part of my life, at least), but I also want a wife, and that's going to require going on dates with many people, most of which won't like tragedy looper, I think.";
String hints = "So when you're playing this script you're going to want to start every loop by picking 3 locations at random and placing both of your intrigue cards and a random third card on those locations. That'll really keep the protagonists guessing, so it's definitely a really good play. As for paranoia, don't pick exactly one incident to trigger and play +1 paranoia on the culprit every single day after day 1. Make sure to use the conspiracy theorist's ability constantly so that your protagonists can figure it out for the final guess. If there's one thing I've learned from writing tragedy looper scripts, it's that hiding conspiracy theorist is overpowered and you have to put in lots of strong, preventable incidents to keep that from happening. Anyhow, for the final guess, try to hide the friend or brain, both of which are great because you can give away who they are by the way you play, which adds a welcome 'Yomi' aspect to the game. Don't forget to brush your teeth every night before you go to bed. I love the mountains in Utah, the hiking there is unparalleled.";
String[] wincons = new String[] {"Break the Protagonist's Ankles","Just juke them really hard","Constantly block goodwill on office worker or mystery boy","LOL get rekt","Protagonists don't realize the 1 specific way to solve this script","But they guess randomly and win anyways. Omegadespair. But you can still be happy for them. But not too happy, but you do know that you played your best and they beat you, and in many ways that's the best way for a game to end. So it's quite good imo. Great work."};

int looppossibilities = 2;
String[] counts = new String[] {"4","3","9"};
int[] difficulties = {4,6,0};

PFont boldfont = createFont("Lucida Sans Bold.otf",12*scale);
PFont otherfont = createFont("Lucida Sans Regular.ttf",12*scale);
PFont titlefont = createFont("colonna-mt.ttf",32*scale);
//Colonna Std Regular is the font used. https://www.myfonts.com/fonts/mti/colonna-mt/std-regular/
//it costs 35$ so i cant use it sorry! if someone buys it for me or I figure out how to pirate it (lol pirating fonts) i will switch to it.

boolean leftHandSide = true;
boolean rightHandSide = true;

//pages are 7 by 10 (560 b6 800)
//2 pages is 14 by 10
//that's equivalent to 2100 by 1500

background(255);

//Colonna Std Regular is the font used. https://www.myfonts.com/fonts/mti/colonna-mt/std-regular/
if (rightHandSide) {
strokeWeight(0);

pushMatrix();
translate(1600, 50);
rotate(HALF_PI);



pushMatrix();
translate(1050,0);

fill(252,242,228);

rect(0, 0, 560*scale, 800*scale);

fill(60,25,12);

rect(0,0,1050,18*15);

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
      fill(60,70,230);
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
    //println(linetoprint);
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
noStroke();
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
noStroke();
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

textAlign(LEFT);

if (leftHandSide) {
  strokeWeight(0);

pushMatrix();
translate(1600, 50);
rotate(HALF_PI);



pushMatrix();
translate(0,0);

fill(252,242,228);

rect(0, 0, 560*scale, 800*scale);

fill(60,25,12);

rect(0,0,1050,18*15);

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
      fill(60,70,230);
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
    //println(linetoprint);
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
noStroke();
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
noStroke();
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
