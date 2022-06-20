void pl(){
  pl = new PL(10, Player);
  pgage = new Gage(pHP,10);
  pgage.setFill(0,170,0);
  tama1 = new Tama(10);
  tama2 = new Tama(10);
  tama3 = new Tama(10);
  tama4 = new Tama(10);
  tama5 = new Tama(10);
  tama6 = new Tama(10);
  tama7 = new Tama(10);
  hissatsuGage = new Gage(5, hissatsuEnergy);
  hissatsuGage.setFill(170,170,0);
}

void drawPL(PL drawPL, Gage drawgage, int x, int y, int MHP, int damage) {
  world.remove(drawPL);
  drawPL.setPosition(x, y);
  float HP;
  drawgage.setWidth(MHP-damage);
  world.remove(drawgage);
  HP = drawgage.getWidth();
  drawgage.setPosition(x-(MHP/2-HP/2),y+60);
  world.remove(hissatsuGage);
  hissatsuGage.setPosition(x+50, y+30-hissatsuEnergy/2);
  if(hissatsuA == true){
    if(hissatsuEnergy >= 0 && frameCount %4 == 0){
      hissatsuEnergy --;
      charging ++;
    }
  }
  if(hissatsuA == false){
    if(hissatsuEnergy <= 50 && frameCount %20 == 0){
      hissatsuEnergy++;
    }
  }
  hissatsuGage.setHeight(hissatsuEnergy);
  if (HP > 0){
    world.add(drawPL);
    world.add(drawgage);
    world.add(hissatsuGage);
  }
  if (HP <= 0){
    scene = -1;
  }
}

void plMove () {
  px += 6*kasokudox;
  py += 6*kasokudoy;
  if (px < -50) px = -50;
  if (px > width + 50) px = width + 50;
  if (py < -50) py = -50;
  if (py > height + 50) py = height + 50;
}

void plMoveLastMae () {
  if (px < width/2) px += 6;
  if (px > width/2) px -= 6;
  if (py < height/4*3) py += 6;
  if (py > height/4*3) py -= 6;
}

void plMoveLast () {
  px += 6*kasokudox;
  py += 6*kasokudoy;
  if (px < -50) px = -50;
  if (px > width + 50) px = width + 50;
  if (py < height/2) py = height/2;
  if (py > height + 50) py = height + 50;
  if (py == height/2) pDamage ++;
}

void shotTama(){
  shotTamaA();
  shotTamaB();
  hissatsuA();
  hissatsuB();
}

void shotTamaA() {
  if (shotA == true) {
    if (frameCount %5 == 0) {
      setTamaA(tama1, px+30, py+20);
      setTamaA(tama2, px-30, py+20);
      world.add(tama1);
      world.add(tama2);
      tamakazu ++;
    }
  }
}

void setTamaA(Tama ball, int x, int y) {
  ball.setFill(120, 170, 230);
  ball.setPosition(x, y);
  ball.setVelocity(0, -20);
}

void shotTamaB(){
  if (shotB == true){
    if (frameCount %10 == 0) {
      setTamaB(tama1, 30);
      setTamaB(tama2, 50);
      setTamaB(tama3, 70);
      setTamaB(tama4, 90);
      setTamaB(tama5, 110);
      setTamaB(tama6, 130);
      setTamaB(tama7, 150);
      world.add(tama1);
      world.add(tama2);
      world.add(tama3);
      world.add(tama4);
      world.add(tama5);
      world.add(tama6);
      world.add(tama7);
      tamakazu += 2;
    }
  }
}

void setTamaB(Tama ball, int sandankaku){
  ball.setFill(120, 170, 230);
  ball.setPosition(px, py - 50);
  ball.setVelocity(20*cos(radians(sandankaku)), -20*sin(radians(sandankaku)));
}

void hissatsuA(){
  ellipseMode(CENTER);
  noStroke();
  fill(170, 170, 250);
  ellipse(pl.x, pl.y-50, charging, charging);
  fill(170, 170, 0);
  ellipse(pl.x, pl.y-50, charging/4*3, charging/4*3);
  if(hissatsuA == false && hissatsuA_old == true){
    hissatsuTime += 1;
    chargingGoukei += charging;
  }
  hissatsuA_old = hissatsuA;
  if(hissatsuTime > 0 && hissatsuTime <= 50){
    rectMode(CORNER);
    noStroke();
     if(scene == 6){
       fill(170, 170, 250);
       rect(pl.x-charging/4, pl.y-50, charging/2, -py+height/2+50);
       fill(170, 170, 0);
       rect(pl.x-charging/16*3, pl.y-50, charging/8*3, -py+height/2+50);
     }else{
       fill(170, 170, 250);
       rect(pl.x-charging/4, pl.y-50, charging/2, -py);
       fill(170, 170, 0);
       rect(pl.x-charging/16*3, pl.y-50, charging/8*3, -py);
     }
    hissatsuTime ++;
  }
  if(hissatsuTime > 50) {
    charging = 0;
    hissatsuTime = 0;
  }
}

void hissatsuB(){
  if(hissatsuEnergy >= 50){
    if(hissatsuB == true && hissatsuB_old == false || hissatsuB == false && hissatsuB_old == true){
      guard_flag = true;
    }
  }
  if(guard_flag == true){
    stroke(220, 220, 50);
    strokeWeight(2);
    rectMode(CORNER);
    noFill();
    stroke(250);
    rect(pl.x-70, pl.y-70, 140, 140, 5);
    chargingGoukei ++;
    if(frameCount %7 == 0){
      hissatsuEnergy --;
    }
    if(hissatsuEnergy == 0){
      guard_flag = false;
    }
  }
  hissatsuB_old = hissatsuB;
}
