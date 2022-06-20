class Vanish{
  boolean ve = true;
  int vetime1;
  int vetime2;
  EffectC veffect;
  
  void vanish(float x, float y){
    int kakudo;
    if(this.ve == true){
      vetime1 = frameCount;
      veffect = new EffectC(10);
      hakai ++;
      for(kakudo=0;kakudo<6;kakudo++){
        float xe = cos(kakudo*PI/3);
        float ye = sin(kakudo*PI/3);
        veffect.setPosition(x+xe*10,y+ye*10);
        veffect.setVelocity(xe,ye);
        veffect.setFill(255,255,255);
        world.add(veffect);
      }
    }
    this.ve = false;
    vetime2 = frameCount;
    if (this.vetime2 - this.vetime1 == 50){
      world.remove(veffect);
      world.remove(veffect);
      world.remove(veffect);
      world.remove(veffect);
      world.remove(veffect);
      subnum ++;
    }
  }
}
