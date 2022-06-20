class Boss{
  boolean drawable = true;
  float x;
  float y;
  float damage;
  int HP;
  int size;
  Bs boss;
  Gage bgage;
  Vanish v;
  Danmaku danmaku;
  
  Boss(float x, float y, int HP, int r, PImage name){
    this.x = x;
    this.y = y;
    this.HP = HP;
    this.size = r;
    boss = new Bs(r, name);
    bgage = new Gage(this.HP, 10);
    v = new Vanish();
    danmaku = new Danmaku(15);
  }
  void drawBoss(int Danmaku, int Move){
    if(drawable == true){
      if(x >= -200 && x <= width+200){
        world.remove(boss);
        boss.setPosition(x, y);
        float ghp = HP - damage;;//genzai no HP
        bgage.setWidth(HP-damage);
        world.remove(bgage);
        bgage.setPosition(x-(HP/2-ghp/2), y - this.size/2 -40);
        bgage.setFill(0,170,0);
        if (ghp > 0){
          world.add(boss);
          world.add(bgage);
          if(Danmaku == 0){
          }
          if(Danmaku == 1){
            danmaku1();
          }
          if(Danmaku == 2){
            danmaku2();
          }
          if(Danmaku == 3){
            danmaku3();
          }
          if(Danmaku == 4){
            danmaku4();
          }
          if(Move == 0){
          }
          if(Move == 1){
            this.bossMove1();
          }
          if(Move == 2){
            this.bossMove2();
          }
          if(Move == 3){
            this.bossMove3();
          }
          if(Move == 4){
            this.bossMove4();
          }
          if(Move == 5){
            this.bossMove5();
          }
          if(Move == 6){
            this.bossMove6();
          }
        }
        if (ghp <= 0){
          v.vanish(x,y);
        }
      } else {
        subnum ++;
        drawable = false;
      }
    } else {
      return;
    }
  }
  
  int move1X = 400;
  int move1XX = 400;
  int move1XXX = 200;
  
  void bossMove1 () {
    this.x = this.move1X*cos(PI*move1XX/300) + move1XXX;
    if (this.move1XX % 600 == 0){
      this.move1X = 300;
      this.move1XXX += 100;
    }
    if (this.move1XX % 600 == 300){
      this.move1X = 400;
      this.move1XXX += 100;
    }
    move1XX ++;
  }
  
  void bossMove2 () {
    this.x = this.move1X*-cos(PI*move1XX/300) - move1XXX + width;
    if (this.move1XX % 600 == 0){
      this.move1X = 300;
      this.move1XXX += 100;
    }
    if (this.move1XX % 600 == 300){
      this.move1X = 400;
      this.move1XXX += 100;
    }
    move1XX ++;
  }
  
  void bossMove3 (){
    this.x += 10;
  }
  
  void bossMove4 (){
    this.x -= 10;
  }
  
  void bossMove5 (){
    if(this.y <= height/4) this.y ++;
  }
  
  void bossMove6 (){
    if(this.y < height/2) {
      this.y += 2;
    } else {
      this.y = height/2;
    }
  }
  
  void danmaku1(){
  if (frameCount %20 == 0){
    danmaku.setFill(230, 100, 10);
    danmaku.setPosition(x, y);
    type1(danmaku);
    world.add(danmaku);
    }
  }
  
  void danmaku2(){
    if (frameCount %80 == 0 || frameCount %80 == 5 || frameCount %80 == 10 || frameCount %80 == 15){
      danmaku.setFill(180, 150, 230);
      danmaku.setPosition(x, y);
      type2(danmaku);
      world.add(danmaku);
    }
  }
  
  void danmaku3(){
    if (frameCount %4 == 0){
      danmaku.setFill(255, 255, 255);
      danmaku.setStroke(200, 0, 200);
      type3(danmaku);
      world.add(danmaku);
    }
    if (frameCount %4 == 2){
      danmaku.setFill(255, 255, 255);
      danmaku.setStroke(0, 0, 200);
      type4(danmaku);
      world.add(danmaku);
    }
  }
  
  void danmaku4(){
    if (frameCount %2 == 0){
      danmaku.setFill(255, 0, 0);
      danmaku.setStroke(200, 200, 200);
      type5(danmaku);
      world.add(danmaku);
    }
    if (frameCount %2 == 1){
      danmaku.setFill(255, 0, 0);
      danmaku.setStroke(200, 200, 200);
      type6(danmaku);
      world.add(danmaku);
    }
  }
  
  void type1(Danmaku ball){//kouhani
    int type1[]={-2,-1,0,1,2,1,0,-1};
    ball.setVelocity(type1[frameCount/20%8],3);
  }
  
  void type2(Danmaku ball){//shikousei
    float t2x1 = this.x - px; 
    float t2y1 = this.y - py;
    float distance = (float)Math.sqrt(Math.pow(t2x1, 2)+Math.pow(t2y1, 2));
    float t2x2 = t2x1/distance;
    float t2y2 = t2y1/distance;
    ball.setVelocity(-10*t2x2, -10*t2y2);
  }
  
  int slide3 = 0;
  int slide4 = 0;
  
  void type3(Danmaku ball){
    int type3[]={15,16,17,18,19,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14};
    ball.setPosition(x+125*cos(PI/10*(type3[frameCount/4 %20]+slide3*0.2)),y+125*(-sin(PI/10*(type3[frameCount/4 %20]+slide3*0.2))));
    ball.setVelocity(2*cos(PI/10*(type3[frameCount/4 %20]+slide3*0.2)),-2*sin(PI/10*(type3[frameCount/4%20]+slide3*0.2)));
    if(frameCount/4 %20 == 19) {
      slide3 ++;
    }
  }
  
  void type4(Danmaku ball){
    int type4[]={15,16,17,18,19,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14};
    ball.setPosition(x+125*-cos(PI/10*(type4[(frameCount -2)/4%20]+0.5+slide4*0.2)),y+125*sin(PI/10*(type4[(frameCount -2)/4%20]+0.5+slide4*0.2)));
    ball.setVelocity(-2*cos(PI/10*(type4[(frameCount -2)/4%20]+0.5+slide4*0.2)),2*sin(PI/10*(type4[(frameCount -2)/4%20]+0.5+slide4*0.2)));
    if((frameCount-2)/4 %20 == 19) {
      slide4 ++;
    }
  }
  
  void type5(Danmaku ball){
    int type3[]={15,16,17,18,19,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14};
    ball.setPosition(x+125*cos(PI/10*(type3[frameCount/2 %20]+slide3*0.2)),y+125*(-sin(PI/10*(type3[frameCount/2 %20]+slide3*0.2))));
    ball.setVelocity(4*cos(PI/10*(type3[frameCount/2 %20]+slide3*0.2)),-4*sin(PI/10*(type3[frameCount/2%20]+slide3*0.2)));
    if(frameCount/2 %20 == 19) {
      slide3 ++;
    }
  }
  
  void type6(Danmaku ball){
    int type4[]={15,16,17,18,19,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14};
    ball.setPosition(x+125*-cos(PI/10*(type4[(frameCount -1)/2%20]+0.5+slide4*0.2)),y+125*sin(PI/10*(type4[(frameCount -1)/2%20]+0.5+slide4*0.2)));
    ball.setVelocity(-4*cos(PI/10*(type4[(frameCount -1)/2%20]+0.5+slide4*0.2)),4*sin(PI/10*(type4[(frameCount -1)/2%20]+0.5+slide4*0.2)));
    if((frameCount-1)/2 %20 == 19) {
      slide4 ++;
    }
  }
}
