//TO DO: make the pages have different info. make the intro have different info. add back cover.
import processing.pdf.*;
float scale;
String creator;
String title;
String set;
String specifics;
String story;
String hints;
String scriptnumber;
String[] wincons;
boolean printwincons;
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

  PImage img = loadImage("MSpaintient.png");
  image(img,0, 80*scale, 560*scale, 720*scale);
  
  fill(73,57,42);

  rect(0,0,560*scale,80*scale);
  
  tragedyLooper(50,120,160);
  
  textFont(boldfont);
  textSize(120);
  fill(250);
  textAlign(CENTER);
  text("QUARANTINE\nCOLLECTION",280*scale,1160);
  
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
  text("A FEW NOTES ON HOW TO PLAY THESE SCRIPTS",105,105*105/60);
  fill(250);
  textFont(otherfont);
  String stringOn = "Our group plays with table talk on completely. This makes the game more social in our opinion, and we enjoy it more. Also, this means that regardless of the number of protagonists, there will never be any coordination issues for the protagonists, which means that scripts are about as difficult for three people as they are for one person, uniformly across the board. Know that all scripts in this collection are designed for full table talk, though the mastermind is always allowed to overhear what the protagonists are saying.\n\nIn our group, the protagonists preferentially prevent the more dangerous loss conditions. For example, if \"sealed item\" being threatened as a main plot, we will almost always forbid intrigue on shrine. That's because, if sealed item really is a main plot, and the protagonists let the mastermind win loop 1 without revealing any of his tricks to get intrigue on the shrine (or his other win conditions), the protagonists are often in a really bad spot. On the other hand, if we don't respect sealed item at all, and trying to bluff sealed item is a big part of the mastermind's strategy, it might trivialize a weaker main plot that's relying on misdirection to win. So, the scripts in here are designed with the expectation that the protagonists are taking more precautions to deal with the very difficult main plots and fewer precautions to deal with the easier main plots.\n\nThe twin role was translated extremely poorly. Per the original Japanese rules, the twin is considered in the opposite location for every incident's effects, not just incidents triggered by the twin. So if twin is in school and hospital incident goes off, the twin dies. If they're in hospital, they survive. Note that for the purposes of the detective's ability, the twin is considered in their actual (not diagonally opposite) location.\n\nA word of advice for the protagonists: if a script seems hopeless, make sure you aren't missing something. In particular, make sure you're using all the goodwill abilities at your disposal. Remember, the Journalist is extremely strong because he can be used to find culprits, set off incidents, and manipulate the extra gauge, so goodwill him as much as possible.";
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
    if (textWidth(linetoprint + word) >= 500*105/60 && !jump) {
      if (stringOn.length() == 0) {
        stringOn = word;
      } else {
        stringOn = word + " " + stringOn;
      }
    } else {
      if (stringOn.length() != 0) {
        linetoprint = linetoprint + word;
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

void drawLeftInnerPage() {
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
  text("A FEW NOTES ON HOW TO PLAY THESE SCRIPTS",105,105*105/60);
  fill(250);
  textFont(otherfont);
  String stringOn = "Our group plays with table talk on completely. This makes the game more social in our opinion, and we enjoy it more. Also, this means that regardless of the number of protagonists, there will never be any coordination issues for the protagonists, which means that scripts are about as difficult for three people as they are for one person, uniformly across the board. Know that all scripts in this collection are designed for full table talk, though the mastermind is always allowed to overhear what the protagonists are saying.\n\nIn our group, the protagonists preferentially prevent the more dangerous loss conditions. For example, if \"sealed item\" being threatened as a main plot, we will almost always forbid intrigue on shrine. That's because, if sealed item really is a main plot, and the protagonists let the mastermind win loop 1 without revealing any of his tricks to get intrigue on the shrine (or his other win conditions), the protagonists are often in a really bad spot. On the other hand, if we don't respect sealed item at all, and trying to bluff sealed item is a big part of the mastermind's strategy, it might trivialize a weaker main plot that's relying on misdirection to win. So, the scripts in here are designed with the expectation that the protagonists are taking more precautions to deal with the very difficult main plots and fewer precautions to deal with the easier main plots.\n\nThe twin role was translated extremely poorly. Per the original Japanese rules, the twin is considered in the opposite location for every incident's effects, not just incidents triggered by the twin. So if twin is in school and hospital incident goes off, the twin dies. If they're in hospital, they survive. Note that for the purposes of the detective's ability, the twin is considered in their actual (not diagonally opposite) location.\n\nA word of advice for the protagonists: if a script seems hopeless, make sure you aren't missing something. In particular, make sure you're using all the goodwill abilities at your disposal. Remember, the Journalist is extremely strong because he can be used to find culprits, set off incidents, and manipulate the extra gauge, so goodwill him as much as possible.";
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
    if (textWidth(linetoprint + word) >= 500*105/60 && !jump) {
      if (stringOn.length() == 0) {
        stringOn = word;
      } else {
        stringOn = word + " " + stringOn;
      }
    } else {
      if (stringOn.length() != 0) {
        linetoprint = linetoprint + word;
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


void drawRightInnerPage() {
  textAlign(LEFT);
  pushMatrix();
  translate(1600, 50);
  rotate(HALF_PI);

  pushMatrix();
  translate(1050,0);

  fill(27,17,16);

  rect(0, 0, 560*scale, 800*scale);

  fill(73,57,42);

  rect(0,0,1050,105);
  
  tragedyLooper(55,40*105/60,45*105/60);
  
  fill(132,212,210);
  textFont(boldfont);
  textSize(25);
  text("A FEW NOTES ON HOW TO PLAY THESE SCRIPTS",65,105*105/60);
  fill(250);
  textFont(otherfont);
  String stringOn = "Our group plays with table talk on completely. This makes the game more social in our opinion, and we enjoy it more. Also, this means that regardless of the number of protagonists, there will never be any coordination issues for the protagonists, which means that scripts are about as difficult for three people as they are for one person, uniformly across the board. Know that all scripts in this collection are designed for full table talk, though the mastermind is always allowed to overhear what the protagonists are saying.\n\nIn our group, the protagonists preferentially prevent the more dangerous loss conditions. For example, if \"sealed item\" being threatened as a main plot, we will almost always forbid intrigue on shrine. That's because, if sealed item really is a main plot, and the protagonists let the mastermind win loop 1 without revealing any of his tricks to get intrigue on the shrine (or his other win conditions), the protagonists are often in a really bad spot. On the other hand, if we don't respect sealed item at all, and trying to bluff sealed item is a big part of the mastermind's strategy, it might trivialize a weaker main plot that's relying on misdirection to win. So, the scripts in here are designed with the expectation that the protagonists are taking more precautions to deal with the very difficult main plots and fewer precautions to deal with the easier main plots.\n\nThe twin role was translated extremely poorly. Per the original Japanese rules, the twin is considered in the opposite location for every incident's effects, not just incidents triggered by the twin. So if twin is in school and hospital incident goes off, the twin dies. If they're in hospital, they survive. Note that for the purposes of the detective's ability, the twin is considered in their actual (not diagonally opposite) location.\n\nA word of advice for the protagonists: if a script seems hopeless, make sure you aren't missing something. In particular, make sure you're using all the goodwill abilities at your disposal. Remember, the Journalist is extremely strong because he can be used to find culprits, set off incidents, and manipulate the extra gauge, so goodwill him as much as possible.";
  String word;
  int xval = 65;
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
    if (textWidth(linetoprint + word) >= 500*105/60 && !jump) {
      if (stringOn.length() == 0) {
        stringOn = word;
      } else {
        stringOn = word + " " + stringOn;
      }
    } else {
      if (stringOn.length() != 0) {
        linetoprint = linetoprint + word;
      } else {
        linetoprint = linetoprint + word;
      }
    }
    text(linetoprint,xval,yval);
    if (stringOn.length() == 0) {
      yval = yval + 5*scale;
    }
  }
  
  /*fill(91,38,25);
  rect(0,105,40*scale,1500-105);
  rect(0,760*scale,560*scale,40*scale);
  fill(0);
  rect(16*scale,105,24*scale,1500-105-17*scale);
  rect(16*scale,760*scale,544*scale,24*scale);
  fill(150,70,30);
  rect(20*scale,105,20*scale,1500-105-21*scale);
  rect(20*scale,760*scale,540*scale,20*scale);
  popMatrix();
  popMatrix();*/
  
  fill(91,38,25);
  rect(0,760*scale,560*scale,40*scale);
  rect(520*scale,56.5*scale,40*scale,(800-18*4)*scale);
  fill(0);
  rect(0,760*scale,544*scale,24*scale);
  rect(520*scale,56.5*scale,24*scale,(784-18*4)*scale);
  fill(150,70,30);
  rect(0,760*scale,540*scale,20*scale);
  rect(520*scale,56.5*scale,20*scale,(780-18*4)*scale);
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
  printwincons = true;
  scriptnumber = "1";

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
  //load fourth script

  
  specifics = "Super Paper Clipper is a galaxy brain script that combines isolated institution psycho, I am a master detective, and the silver bullet incident to cause an otherwise unwinnable script to become winnable. In particular, by using the AI's brain ability, the mastermind can place intrigue on the AI and city freely, guaranteeing a 2-intrigue terrorism which will kill the protagonists on the fifth day. Because of isolated institution psycho, the extra gauge will be at 1 starting on the second loop, meaning the protagonists will not be able to use the detective's ability to trigger the silver bullet. However, by triggering a serial murder, the protagonists can reduce the extra gauge to 0 at the start of the following loop, allowing them to trigger the silver bullet. This is a really complicated script that requires both a high level of understanding of mystery circle and also several hours to play. However, it is my hope that the joy of grasping the solution will be worth the investment.";
  story = "Every day, artificial intelligence gets smarter and smarter. It's only a matter of time before it becomes intelligent enough to permanently leave humans in the dust. When that happens, it will impose its values on us, regardless of what we want. The only hope to combat this new god is an old fashioned kind of god. We can't have a miracle unless she also believes.";
  hints = "During the first loop, the most important thing is that you hide the detective by keeping her away from the culprits during the appropriate days. I like to start the henchman in the city and immediately move the mystery boy over. You can win the loop just by using Black School. Starting on loop 2, you have to prioritize keeping the AI safe from the mystery boy by moving him towards the shrine on every single turn. You can win loops 2 and 3 by playing intrigue cards on both the school and the city when you have 2 cards to spare. This will mean that you do not have to place intrigue on the city using the brain's ability, so you can bluff that the AI is the paranoiac. Once they figure out she is actually the brain, they will realize something is up and start hunting for the script's \"trick\" which is exactly what you don't want. You should forbid goodwill on the journalist and soldier to ensure your protagonists do not successfully paranoia anyone, stopping the soldier's 5-cost as your highest priority. Furthermore, aggressively removing paranoia from culprits, using both your cards as well as the henchman, is of paramount importance for keeping incidents under wraps. You should also be aggressively hiding the detective's unkillability as much as possible. If you make it to final guess, you are very likely to win, since conspiracy theorist and paranoiac are unidentifiable and you should never use their abilities.";
  
  wincons = new String[] {"Placing X intrigue counters on the school","(Main Plot: The Black School victory condition)","Kill the Protagonists","Using: Terrorism","Kill the Friend (Godly Being)","Using: Terrorism, Serial Murders, Serial Killer's Ability"};
  title = "SUP3R P4PER CLIPPER";
  set = "Mystery Circle";
  counts = new String[] {"6","7"};
  difficulties = new int[] {8,6};
  looppossibilities = 2;
  printwincons = false;
  scriptnumber = "4";
  
  drawRightHandSide();
  drawLeftInnerPage();
  pdf.nextPage();
  popMatrix();
  drawRightInnerPage();
  //load third script
  
  specifics = "Fear Itself is a script that combines an orthodox tightrope plan script with an orthodox smell of gunpowder script. It's the interaction between these two plots that makes them difficult to counter at the same time. Add too little paranoia, and you won't be able to cause the incidents or figure out the culprits, but add too much paranoia to the wrong people and you risk setting off the dangerous secondary wincon.";
  story = "She descended from the skies one dark and moonless night and set to work spreading chaos and panic in this helpless town of Earth. She earns the trust of the townsfolk, and her own suicide inspires the deaths of others. Those who know the truth continue to spread her beloved fear, and it seems there is no hope left. In the end, there will need to be at least one sacrifice in order to banish her forever.";
  hints = "This is a script that only an accountant should mastermind. On the first loop, your best option is to trigger tightrope plan, since it will be difficult for them to figure out culprits initially. Then, once they realize tightrope plan is a threat, they'll start to put paranoia on everyone, and that's your time to strike using the smell of gunpowder. If things should go wrong, you can surprise them by using the informer's incident, brain's ability, and your +2 intrigue to aim for a quick kill with the alien. Once she's revealed, the alien also makes for a dangerous threat because you can mix up whether you are putting paranoia or intrigue on her during the first two days. It's up to you whether or not you aim to hide the AI's role or use it to kill the informer (probably during loop 2). If you pull it off, you might be able to buy a loop this way, but the downside is that they now have a potent tool for reducing paranoia, as well as two less roles to deal with for final guess. Speaking of paranoia, you have 6 days to place paranoia manually and 2 paranoia from increasing unease, for 14 paranoia total. They can reduce this number by 4, for a cool 10 paranoia on net. Thus, you'll need them to help you by placing at least 2 paranoia in order to get smell of gunpowder, but if they place it on suicide culprits then those people will die and the paranoia won't count. A big part of playing this script is doing math to figure out when you can still pull off one of your main wincons and when you have to go all in on the alien.";

  wincons = new String[] {"Extra Gauge is at 1 or lower when the loop ends","(Main Plot: Tightrope Plan victory condition)","Kill the Protagonists","Using: Killer's ability","12 or more paranoia on living characters when the loop ends","(Subplot: Smell of Gunpowder victory condition)"};
  title = "FEAR ITSELF";
  set = "Mystery Circle";
  counts = new String[] {"4"};
  difficulties = new int[] {6};
  looppossibilities = 1;
  printwincons = true;
  scriptnumber = "3";
  
  drawLeftHandSide();
  pdf.nextPage();
  pushMatrix();
  translate(1700,2200);
  scale(-1);
  //load second script
  
  specifics = "Detection Obsession is a unique script that exploits the interaction between the boss's ability and the detective's ability to bluff that the patient is the obstinate. In order to win, the protagonists will need to keenly use the doctor and journalist's abilities in concert to get the office worker's incident off so that the boss cannot force the patient to commit his bestial murder.";
  story = "The patient was incurably insane, and he took it out on the people around him. Or was he? That's the manipulative lie that the boss, true mastermind of the incident, would have us believe. The humble office worker may be a fool, yet he knows the truth and must warn the patient before it's too late.";
  hints = "Loop 1 should be a free victory, as long as you place a paranoia on the alien every turn. In the mean time, aggressively place forbid goodwill on the journalist or (if he already has at least one goodwill) the office worker, since finding out culprits and especially the office worker's role is very damaging to the coverup that you're trying to sell. During the second loop, continue trying to hide your information with aggressive forbid goodwills. Eventually you'll be forced to out the alien as the conspiracy theorist, but hide this for as long as possible. On some loop, when they're about to figure out the trick, you should transition towards trying to get the boy student's incident off, so you can satisfy the quilt of incident loss condition that way. If worst comes to horrible, you may have to do a movement mixup to kill a friend. Since they're your best late-loop win condition and also the easiest role to hide, try to kill the minimum number of unique people possible, to leave as many friend options open as you can. It's for this reason that I recommend adding or removing characters with the role \"person\" rather than adjusting the loop count if you're trying to balance this script for more or less competent players.";
  wincons = new String[] {"Extra Gauge is three or more at loop end","(Main Plot: Quilt of Incidents victory condition)","Kill the friends (Journalist, Girl Student)","Using: Serial Murders, Bestial Murder"};
  title = "DETECTION OBSESSION";
  set = "Mystery Circle";
  counts = new String[] {"4"};
  difficulties = new int[] {5};
  looppossibilities = 1;
  printwincons = true;
  scriptnumber = "2";
  
  
  drawRightHandSide();
  //load first script
  
  specifics = "Insanity Defense was made to complement the scripts originally bundled with the English release of the Mystery Circle expansion. It explores the Murder Plan and Smell of Gunpowder plots, which were not explored in those boxed scripts. It's a fair bit easier than the other scripts included in the quarantine collection, and requires the mastermind to improvise a bit to win all four loops without revealing all the roles.";
  story = "The patient was incurably insane, and he took it out on the people around him. The doctors, others admitted to the hospital, and the people who came to visit him all died mysteriously. Behind him lurks a much greater threat, a shadowy organization weaponizing this insanity and inflicting fear on the populace for their own nefarious ends. As the bodies pile up, survival becomes less and less certain.";
  hints = "In order to win the first loop, your best bet is to aim for a quick kill on the office worker by moving him up and moving the doctor out. After that, there are a number of options available to you. One wincon to think about is the smell of gunpowder. You have 6 days worth of manual paranoia placement, and hard-for-protagonists-to-kill characters such as the office worker and patient to play it on. Since the protagonists can remove 4 of this, you will be left with 8 paranoia on net. However, if the protagonists play goodwill on the doctor early, then you can co-opt his goodwill ability to place 4 more paranoia and close the gap to fulfill the smell of gunpowder wincon. You may also use the henchman's ability to place one more paranoia, but because of his suicide you will not be able to do much more than this. Another win condition you can go for is using suspicious letter to move the office worker to the hospital on the final day. Since he cannot enter the school, and has a 2-paranoia limit, you'll be able to guarantee this easily, so the protagonists will have to move other characters into the hospital in order to save him. Of course, you can prevent this by killing those other people using either the patient or the serial murders. Your other wincons will require the shrine maiden, who is one of your easiest to hide roles and who is reliant on the easy-to-kill doctor, or the serial murders, which are dangerous because they can kill important people or reveal the twin. However, I think if you focus on hiding roles (especially killer and twin) you should be able to finesse out the win.";

  wincons = new String[] {"Kill the Key Person (Office Worker)","Using: Serial Murders, Serial Killer's ability, Killer's ability","Kill the Protagonists","Using: Killer's Ability","12 or more paranoia on living characters when the loop ends","(Subplot: Smell of Gunpowder victory condition)"};
  title = "INSANITY DEFENSE";
  set = "Mystery Circle";
  counts = new String[] {"4"};
  difficulties = new int[] {4};
  looppossibilities = 1;
  printwincons = true;
  scriptnumber = "1";
  
  
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
  drawCircle(scale*540/8,scale*540/7,31./525*scale*540,scriptnumber);
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

  if (printwincons) {
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
  }
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
  drawCircle(scale*90,scale*72,31./525*scale*540,scriptnumber);
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
  
  if (printwincons) {
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
  }
  
  popMatrix();
  popMatrix();
}
