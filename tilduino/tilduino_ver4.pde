import processing.serial.*;

Serial serial;

PImage Boss, Back, Title, Gameover ,optionA, optionB, Bullet, Charge, Yajirushi, Start;
PImage Player, Sugiya, Makita, Hara, Hirano;
PFont pf;

String myString;

public boolean PCMODE = true;
public int hissatsuApc = 0;
public int hissatsuBpc = 0;

public boolean shotA = false, shotB = false;
public boolean hissatsuA = false, hissatsuB = false;
public boolean hissatsuA_old;
public boolean hissatsuB_old;
public boolean guard_flag = false;
public boolean makitaFlag = false;
public int kasokudox, kasokudoy;
public int k = 1; //boss keisuu
public int hissatsuEnergy = 50;
public int hissatsuTime = 0;
public float charging = 0;
public int num = 0;//body number
public int X = 0;//background one y
public int XX = -1485;//background two y
public int scene = 0;
public int subnum = 0;//enemy number
public int loading = 0;
public int s0time;
public int s3time;
public float yajiY, yajiY2, yajiY3;
public float wakuX1, wakuX2, wakuX3, wakuX4;
public int wakuX5, wakuX6;
public int hidan = 100;
public int hakai = 0;
public int time = 0;
public int tamakazu = 0;
public int chargingGoukei = 0;

public int px = width/2;;
public int py = height*4/5;;
public int pDamage = 0;
public int pHP = 100;
public int PLdata = 00;

Atari at;
PL pl;
Tama tama1, tama2, tama3, tama4, tama5, tama6, tama7;
World world;
Gage pgage, hissatsuGage;
Boss boss0, boss1, boss2, boss3, boss4, boss5, boss6, boss7, boss8, boss9, boss10, boss11, boss12, bossLast;

void setup() {
  fullScreen();
  
  if(PCMODE == false){
  serial = new Serial(this, Serial.list()[3], 9600);
  serial.bufferUntil('\n');
  serial.write(PLdata);
  }
  
  pf = loadFont("Athelas-BoldItalic-48.vlw");
  textFont(pf);
  
  Boss = loadImage("ohtani.png");
  Player = loadImage("daru.png");
  Back = loadImage("haikei.png");
  Title = loadImage("title.png");
  optionA = loadImage("Abutton.png");
  optionB = loadImage("Bbutton.png");
  Bullet = loadImage("bulletType.png");
  Charge = loadImage("chargeType.png");
  Yajirushi = loadImage("yajirushi.png");
  Start = loadImage("start.png");
  Gameover = loadImage("gameover.png");
  Sugiya = loadImage("sugiya.png");
  Makita = loadImage("makita.png");
  Hirano = loadImage("hirano.png");
  Hara = loadImage("hara.png");
  
  px = width/2;
  py = height*4/5;
  
  yajiY = height/2 + 5;
  s0time = 0;
  wakuX1 = width/10*7+250;
  wakuX2 = width/10*7+250;
  wakuX5 = width/10*7+250;
  wakuX6 = width/10*7+350;

  world = new World();
  at = new Atari();
  
  pl();
  boss0 = new Boss(width/2, height/5, 40, 64, Sugiya);
  boss1 = new Boss(-50, height/5, 20, 64, Boss);
  boss2 = new Boss(-50, height/4, 20, 64, Boss);
  boss3 = new Boss(-50, height/5, 40, 64, Boss);
  boss4 = new Boss(-50, height/4, 40, 64, Boss);
  boss5 = new Boss(width+100, height/7, 3, 64, Makita);
  boss6 = new Boss(width+100, height/7, 3, 64, Makita);
  boss7 = new Boss(width+100, height/7, 3, 64, Makita);
  boss8 = new Boss(-100, height/7, 3, 64, Hirano);
  boss9 = new Boss(-100, height/7, 3, 64, Hirano);
  boss10 = new Boss(-100, height/7, 3, 64, Hirano);
  boss11 = new Boss(width/5, -150, 40, 64, Sugiya);
  boss12 = new Boss(width/5*4, -150, 40, 64, Sugiya);
  bossLast = new Boss(width/2, -150, 200, 260, Hara);
  System.out.println(boss11.boss.number);
}

void draw() {
  //println(charging/25);
  
  if(PCMODE == false){
    serial.write(PLdata);
    myString = trim(myString);
    int arduinos[] = int(split(myString, ','));
    kasokudox = arduinos[0];
    kasokudoy = arduinos[1];
    //println(arduinos);
    if(arduinos[3] == 0) shotA = false;
    if(arduinos[3] == 1) shotA = true;
    if(arduinos[3] == 2) shotB = false;
    if(arduinos[3] == 3) shotB = true;
    if(arduinos[2] == 0) hissatsuA = false;
    if(arduinos[2] == 1) hissatsuA = true;
    if(arduinos[2] == 2) hissatsuB = false;
    if(arduinos[2] == 3) hissatsuB = true;
    //println(arduinos[3]);
  }
  
  if(scene == 0){
    background(20);
    image(Title,0,0);
    image(Bullet, width/10*7, height/2);
    image(Charge, width/10*7, height/2+70);
    image(Start, width/10*7, height/2+140);
    image(optionA, width/10*7+260, height/2+5);
    image(optionB, width/10*7+360, height/2+6);
    image(optionA, width/10*7+260, height/2+75);
    image(optionB, width/10*7+360, height/2+76);
    image(Yajirushi, width/10*7-50, yajiY);
    waku(wakuX1, height/2);
    waku(wakuX2, height/2+70);
    if(s0time == 0){
      if(yajiY == height/2 + 5){
        if(kasokudoy == 1){
          yajiY2 = height/2 + 5;
          s0time++;
          yajiY3 = 1;
        }
        if(kasokudox == 1 && wakuX1 == wakuX5){
          s0time++;
          wakuX3 = 1;
          wakuX4 = 0;
        }
        if(kasokudox == -1 && wakuX1 == wakuX6){
          s0time++;
          wakuX3 = -1;
          wakuX4 = 0;
        }
      }
      if(yajiY == height/2 + 75){
        if(kasokudoy == 1){
          yajiY2 = height/2 + 75;
          s0time++;
          yajiY3 = 1;
        }
        if(kasokudoy == -1){
          yajiY2 = height/2 + 75;
          s0time++;
          yajiY3 = -1;
        }
        if(kasokudox == 1 && wakuX2 == wakuX5){
          s0time++;
          wakuX3 = 1;
          wakuX4 = 1;
        }
        if(kasokudox == -1 && wakuX2 == wakuX6){
          s0time++;
          wakuX3 = -1;
          wakuX4 = 1;
        }
      }
      if(yajiY == height/2 + 145){
        if(wakuX1 == wakuX5 && wakuX2 == wakuX5) PLdata = 00;
        if(wakuX1 == wakuX6 && wakuX2 == wakuX5) PLdata = 10;
        if(wakuX1 == wakuX5 && wakuX2 == wakuX6) PLdata = 01;
        if(wakuX1 == wakuX6 && wakuX2 == wakuX6) PLdata = 11;
        //println(PLdata);
        if(kasokudoy == -1){
          yajiY2 = height/2 + 145;
          s0time++;
          yajiY3 = -1;
        }
        if(shotA == true || shotB == true) {
          scene++;
        }
      }
    }
    if(s0time > 0){
      if(yajiY3 == 1){
        yajirushiMove(1);
      }
      if(yajiY3 == -1){
        yajirushiMove(-1);
      }
      if(wakuX3 == 1 && wakuX4 ==0){
        wakuMove(0,1);
      }
      if(wakuX3 == -1 && wakuX4 ==0){
        wakuMove(0,-1);
      }
      if(wakuX3 == 1 && wakuX4 ==1){
        wakuMove(1,1);
      }
      if(wakuX3 == -1 && wakuX4 ==1){
        wakuMove(1,-1);
      }
    }
    if(s0time == 10){//20sec freeze
      s0time = -20;
      if(yajiY3 == 1){
        yajiY = yajiY2 + 70;
      }
      if(yajiY3 == -1){
        yajiY = yajiY2 - 70;
      }
      if(wakuX3 == 1){
        if(wakuX4 == 0) wakuX1 = wakuX6;
        if(wakuX4 == 1) wakuX2 = wakuX6;
      }
      if(wakuX3 == -1){
        if(wakuX4 == 0) wakuX1 = wakuX5;
        if(wakuX4 == 1) wakuX2 = wakuX5;
      }
      yajiY3 = 0;
      wakuX3 = 0;
      wakuX4 = 0;
    }
    if(s0time < 0){
      s0time++;
    }
  }
  if(scene == 1){
    background(20);
    shotA = false;
    shotB = false;
    loading ++;
    text("now loading .", width/4*3, height/8*7);
    if(loading >= 30){
      text(".", width/30*27.1, height/8*7);
    }
    if(loading >= 60){
      text(".", width/30*27.3, height/8*7);
    }
    if(loading == 100){
      scene++;
    }
  }
  if(scene == 2){
    background(20);
    imageMode(CORNER);
    image(Back,0,0);
    drawPL(pl, pgage, px, py, pHP, pDamage);
    plMove ();
    shotTama();
    boss0.drawBoss(0, 0);
    world.step();
    world.draw();
    if(subnum == 1) scene++;
    //debug();
  }
  if(scene == 3){
    background(20);
    drawBack();
    drawPL(pl, pgage, px, py, pHP, pDamage);
    plMove();
    shotTama();
    boss1.drawBoss(1, 1);
    boss2.drawBoss(1, 2);
    world.step();
    world.draw();
    if(subnum == 3) scene++;
  }
  if(scene == 4){
    background(20);
    drawBack();
    if(makitaFlag == false){
      s3time = frameCount;
      makitaFlag = true;
    }
    drawPL(pl, pgage, px, py, pHP, pDamage);
    plMove();
    shotTama();
    boss3.drawBoss(1, 2);
    boss4.drawBoss(1, 1);
    boss5.drawBoss(2, 4);
    if(frameCount >= s3time + 180){
      boss6.drawBoss(2, 4);
    }
    if(frameCount >= s3time + 360){
      boss7.drawBoss(2, 4);
    }
    if(frameCount >= s3time + 700){
      boss8.drawBoss(2, 3);
    }
    if(frameCount >= s3time + 880){
      boss9.drawBoss(2, 3);
    }
    if(frameCount >= s3time + 1060){
      boss10.drawBoss(2, 3);
    }
    world.step();
    world.draw();
    if(subnum == 11) scene++;
  }
  if(scene == 5){
    background(20);
    drawBack();
    drawPL(pl, pgage, px, py, pHP, pDamage);
    plMoveLastMae();
    boss11.drawBoss(0, 6);
    boss12.drawBoss(0, 6);
    bossLast.drawBoss(0 ,5);
    if(boss11.y == height/2){
      if(frameCount %2 == 0){
        stroke(250, 250, 150);
        strokeWeight(7);
        line(0, boss11.y, width ,boss12.y);
      }
    }
    world.step();
    world.draw();
    if(bossLast.y == height/4){
      scene ++;
    }
  }
  if(scene == 6){
    background(20);
    drawBackLast();
    drawPL(pl, pgage, px, py, pHP, pDamage);
    shotTama();
    plMoveLast();
    boss11.drawBoss(2, 0);
    boss12.drawBoss(2, 0);
    bossLast.drawBoss(3, 0);
    if(frameCount %2 == 0){
      stroke(250, 250, 150);
      strokeWeight(7);
      line(0, boss11.y, width, boss12.y);
    }
    world.step();
    world.draw();
    if(subnum == 13) scene++;
  }
  if(scene == 7){
    background(20);
    drawBackLast();
    drawPL(pl, pgage, px, py, pHP, pDamage);
    shotTama();
    plMove();
    bossLast.drawBoss(4, 0);
    world.step();
    world.draw();
    if(subnum == 14) scene++;
  }
  if(scene == 8){
    background(30);
    textSize(120);
    fill(255);
    text("Game Clear", width/2-280, height/5*2);
    textSize(80);
    text("score ;", width/2-280, height/5*3);
    int timeScore = 10000 - time;
    if(timeScore <= 0) timeScore = 0;
    int tamakazuScore = (1000 - tamakazu)*5;
    if(tamakazuScore <= 0) tamakazuScore = 0;
    int chargingScore = (500 - chargingGoukei)*5;
    if(chargingScore <= 0) chargingScore = 0;
    int score = timeScore + tamakazuScore + hakai*1000 + (pHP - pDamage)*500 + chargingScore;
    text(score, width/2 + 100, height/5*3);
    println(timeScore);
    println(tamakazuScore);
    println(hakai*1000);
    println((pHP - pDamage)*500);
    println(chargingScore);
  }
  if(scene == -1){
    background(20);
    imageMode(CORNER);
    image(Gameover, 0, 0, width, height);
  }
  if(scene > 1 && scene < 8) time ++;
}

void drawBack(){
  imageMode(CORNER);
  image(Back,0, X/*, width, height + 435*/);
  X++;
  XX++;
  image(Back,0, XX/*, width, height + 435*/);
  if(XX == 0)X = -1485;
  if(X == 0)XX = -1485;
}

void drawBackLast(){
  imageMode(CORNER);
  image(Back,0, X);
  image(Back,0, XX);
}

void yajirushiMove(int idouhoukouY){
  yajiY = yajiY2 +idouhoukouY*(70*sin(PI*s0time/20));
  s0time++;
}

void waku(float wakuyoko, int wakutakasa){
  noFill();
  strokeWeight(2);
  strokeJoin(ROUND);
  stroke(255);
  rect(wakuyoko, wakutakasa, 56, 46);
}

void wakuMove(int waku, int idouhoukouX){
  if(waku == 0){
    if(idouhoukouX == 1){
      wakuX1 =  wakuX5 + idouhoukouX*(100*sin(PI*s0time/20));
    }
    if(idouhoukouX == -1){
      wakuX1 =  wakuX6 + idouhoukouX*(100*sin(PI*s0time/20));
    }
  }
  if(waku == 1){
    if(idouhoukouX == 1){
      wakuX2 =  wakuX5 + idouhoukouX*(100*sin(PI*s0time/20));
    }
    if(idouhoukouX == -1){
      wakuX2 =  wakuX6 + idouhoukouX*(100*sin(PI*s0time/20));
    }
  }
  s0time++;
}

void debug(){
  int de;
  for(de=0;de<world.list.size();de++){
    System.out.println(world.list);
  }
}

void serialEvent(Serial serial){
    myString = serial.readStringUntil('\n');
}

void keyPressed () {
  if(PCMODE == true){
    if (key == 'a') kasokudox = -1;
    if (key == 'd') kasokudox = 1;
    if (key == 'w') kasokudoy = -1;
    if (key == 's') kasokudoy = 1;
    if (key == ' ' && PLdata == 0 || key == ' ' && PLdata == 1) shotA = true;
    if (key == ' ' && PLdata == 10 || key == ' ' && PLdata == 11) shotB = true;
    if (key == 'm' && PLdata == 0 || key == 'm' && PLdata == 10) hissatsuApc = 1 - hissatsuApc;
    if (hissatsuApc == 1) hissatsuA = true;
    if (hissatsuApc == 0) hissatsuA = false;
    if (key == 'm' && PLdata == 1 || key == 'm' && PLdata == 11) hissatsuBpc = 1 - hissatsuBpc;
    if (hissatsuBpc == 1) hissatsuB = true;
    if (hissatsuBpc == 0) hissatsuB = false;
  }
}

void keyReleased () {
  if(PCMODE == true){
    if (key == 'a') kasokudox = 0;
    if (key == 'd') kasokudox = 0;
    if (key == 'w') kasokudoy = 0;
    if (key == 's') kasokudoy = 0;
    if (key == ' ' && PLdata == 0 || key == ' ' && PLdata == 1) shotA = false;
    if (key == ' ' && PLdata == 10 || key == ' ' && PLdata == 11) shotB = false;
  }
}
