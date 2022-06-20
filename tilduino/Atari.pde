class Atari {

  void Plshot() {//Player's shot atarihantei
    int i;
    int j;
    float tx, ty, tr;
    float cx, cy, cr;
    //int seigen;

    for (i = 0; i<world.list.size(); i++) {
      if (world.list.get(i).get(7) == 0) { //Type
        cx = world.list.get(i).get(0);
        cy = world.list.get(i).get(1);
        cr = world.list.get(i).get(8);
        for (j = 0; j<world.list.size(); j ++) {
          if (world.list.get(j).get(7) == 1) {
            tx = world.list.get(j).get(0);
            ty = world.list.get(j).get(1);
            tr = world.list.get(j).get(8);
            if (tx-tr/2 <= cx+cr/2 && tx+tr/2 >= cx-cr/2 && ty-tr/2 <= cy+cr/2 && ty+tr/2 >= cy-cr/2) {
              if (world.list.get(i).get(10)==10) {
                boss0.damage++;
              }
              if (world.list.get(i).get(10)==13) {
                boss1.damage++;
              }
              if (world.list.get(i).get(10)==16) {
                boss2.damage++;
              }
              if (world.list.get(i).get(10)==19) {
                boss3.damage++;
              }
              if (world.list.get(i).get(10)==22) {
                boss4.damage++;
              }
              if (world.list.get(i).get(10)==25) {
                boss5.damage++;
              }
              if (world.list.get(i).get(10)==28) {
                boss6.damage++;
              }
              if (world.list.get(i).get(10)==31) {
                boss7.damage++;
              }
              if (world.list.get(i).get(10)==34) {
                boss8.damage++;
              }
              if (world.list.get(i).get(10)==37) {
                boss9.damage++;
              }
              if (world.list.get(i).get(10)==40) {
                boss10.damage++;
              }
              if (world.list.get(i).get(10)==43) {
                boss11.damage++;
              }
              if (world.list.get(i).get(10)==46) {
                boss12.damage++;
              }
              if (world.list.get(i).get(10)==49) {
                bossLast.damage++;
              }
              world.list.remove(j);
              world.imglist.remove(j);
            }
            if(scene == 6 && ty-tr/2 <= height/2){
              world.list.remove(j);
              world.imglist.remove(j);
            }
          }
        }
        if (hissatsuTime > 0 && pl.x-charging/4 <= cx+16 && pl.x+charging/4 >= cx-16 && frameCount % 2 == 0) {
          if (world.list.get(i).get(10)==10) {
            boss0.damage += charging/10;
          }
          if (world.list.get(i).get(10)==13) {
            boss1.damage += charging/10;
          }
          if (world.list.get(i).get(10)==16) {
            boss2.damage += charging/10;
          }
          if (world.list.get(i).get(10)==19) {
            boss3.damage += charging/10;
          }
          if (world.list.get(i).get(10)==22) {
            boss4.damage += charging/10;
          }
          if (world.list.get(i).get(10)==25) {
            boss5.damage += charging/10;
          }
          if (world.list.get(i).get(10)==28) {
            boss6.damage += charging/10;
          }
          if (world.list.get(i).get(10)==31) {
            boss7.damage += charging/10;
          }
          if (world.list.get(i).get(10)==34) {
            boss8.damage += charging/10;
          }
          if (world.list.get(i).get(10)==37) {
            boss9.damage += charging/10;
          }
          if (world.list.get(i).get(10)==40) {
            boss10.damage += charging/10;
          }
          if (world.list.get(i).get(10)==43) {
            boss11.damage += charging/10;
          }
          if (world.list.get(i).get(10)==46) {
            boss12.damage += charging/10;
          }
          if(scene != 6){
            if (world.list.get(i).get(10)==49) {
              bossLast.damage += charging/10;
            }
          }
        }
      }
    }
  }
  void BossShot() {
    int j;
    float tx, ty, tr;

    for (j = 0; j<world.list.size(); j ++) {
      if (world.list.get(j).get(7) == 4) {
        tx = world.list.get(j).get(0);
        ty = world.list.get(j).get(1);
        tr = world.list.get(j).get(8);
        if (tx-tr/2 <= pl.x+30 && tx+tr/2 >= pl.x-30 && ty-tr/2 <= pl.y+30 && ty+tr/2 >= pl.y-30) {
          if(PCMODE == false) serial.write(hidan);
          pDamage++;
          world.list.remove(j);
          world.imglist.remove(j);
          if(scene == 7) pDamage++;
        }
        if (guard_flag == true && tx-tr/2 <= pl.x+70 && tx+tr/2 >= pl.x-70 && ty-tr/2 <= pl.y+70 && ty+tr/2 >= pl.y-70) {
          world.list.remove(j);
          world.imglist.remove(j);
        }
      }
    }
  }
}
