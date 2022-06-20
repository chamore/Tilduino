class Body{
  float x, y;
  float vx, vy;
  int R = 0, G = 0, B = 0;
  int Rsen = 0, Gsen = 0, Bsen = 0;
  int Type;
  int r = 0;
  PImage name = null;
  int number;
  int HP;
  float wide = 0, high = 0;

  void setFill(int R, int G, int B) {
    this.R = R;
    this.G = G;
    this.B = B;
  }
  void setStroke(int Rsen, int Gsen, int Bsen){
    this.Rsen = Rsen;
    this.Gsen = Gsen;
    this.Bsen = Bsen;
  }
  void setVelocity(float vx, float vy) {
    this.vx = vx;
    this.vy = vy;
  }
  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }
}
class Circle extends Body {

  Circle(int r) {
    this.r = r;
  }
}
class Bs extends Circle {

  Bs(int r, PImage name) {
    super(r);
    Type = 0;
    this.name = name;
    number = num;
    num++;
  }
}
class PL extends Circle {

  PL(int r, PImage name) {
    super(r);
    Type = 3;
    this.name = name;
    number = num;
    num++;
  }
}
class Tama extends Circle {

  Tama(int r) {
    super(r);
    Type = 1;
    number = num;
    num++;
  }
}
class Danmaku extends Circle {

  Danmaku(int r) {
    super(r);
    Type = 4;
    number = num;
    num++;
  }
}
class EffectC extends Circle {

  EffectC(int r) {
    super(r);
    Type = 5;
    number = num;
    num++;
  }
}
class Box extends Body {
  
  Box(int wide, int high){
    this.wide = wide;
    this.high = high;
  }
}
class Gage extends Box{
  
  Gage(int wide, int high){
    super(wide,high);
    Type = 2;
    number = num;
    num++;
  }
  void setWidth(float HP){
    this.wide = HP;
  }
  void setHeight(int takasa){
    this.high = takasa;
  }
  float getWidth(){
    int i;
    int n = this.number;
    float Width = this.wide;
    if (world.list.isEmpty() == false){
      for (i = 0; i < world.list.size(); i ++) {
        if (world.list.get(i).get(10)==n){
          Width = world.list.get(i).get(8);
        }
      }
    }
    return Width;
  }
}
