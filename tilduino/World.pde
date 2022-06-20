class World {
  ArrayList<ArrayList<Float>> list;
  ArrayList<ArrayList<PImage>> imglist;
  int i;

  World() {
    list = new ArrayList<ArrayList <Float>>();
    imglist = new ArrayList<ArrayList <PImage>>();
  }

  void add(Body body) {
    ArrayList<Float>li = new ArrayList <Float>();
    ArrayList<PImage>imgli = new ArrayList <PImage>();
    float Type = body.Type;
    float wide = body.wide;
    float high = body.high;
    if (Type == 0 ||Type == 1||Type == 3||Type == 4||Type == 5) {
      float r = body.r;
      wide = r;
      high = r;
    }
    li.clear();
    li.add(body.x);
    li.add(body.y);
    li.add(body.vx);
    li.add(body.vy);
    float R = body.R;
    float G = body.G;
    float B = body.B;
    li.add(R);
    li.add(G);
    li.add(B);
    li.add(Type);
    li.add(wide);
    li.add(high);
    float number = body.number;
    li.add(number);
    float Rsen = body.Rsen;
    float Gsen = body.Gsen;
    float Bsen = body.Bsen;
    li.add(Rsen);
    li.add(Gsen);
    li.add(Bsen);
    list.add(li);
    PImage name = body.name;
    imgli.clear();
    imgli.add(name);
    imglist.add(imgli);
  }
  void remove(Body body) {
    int number = body.number;
    for (i = 0; i < list.size(); i++) {
      if (number == list.get(i).get(10)) {
        list.remove(i);
        imglist.remove(i);
      }
    }
  }
  void step() {
    for (i = 0; i < list.size(); i++) {
      float x = list.get(i).get(0)+list.get(i).get(2);
      float y = list.get(i).get(1)+list.get(i).get(3);
      list.get(i).set(0, x);
      list.get(i).set(1, y);
    }
    at.Plshot();
    at.BossShot();
  }
  void draw() {
    for (i = 0; i < list.size(); i++) {
      float x = list.get(i).get(0);
      float y = list.get(i).get(1);
      float R = list.get(i).get(4);
      float G = list.get(i).get(5);
      float B = list.get(i).get(6);
      float wide = list.get(i).get(8);
      float high = list.get(i).get(9);
      float Type = list.get(i).get(7);
      float Rsen = list.get(i).get(11);
      float Gsen = list.get(i).get(12);
      float Bsen = list.get(i).get(13);
      fill(R, G, B);
      if (Type == 0 ||Type == 1 || Type == 3 || Type == 4 || Type == 5){
        if(R == 0 && G == 0 && B == 0){
        noFill();
        }
        if(Rsen == 0 && Gsen == 0 && Bsen == 0){
        noStroke();
        } else {
        stroke(Rsen, Gsen, Bsen);
        }
        strokeWeight(1);
        ellipse(x, y, wide, high);
      } 
      if (Type == 0 || Type == 3) {
        PImage name = imglist.get(i).get(0);
        if(scene == 7 && list.get(i).get(10) == 49){
          tint(204, 100, 100);
        } else {
          noTint();
        }
        imageMode(CENTER);
        image(name, x, y);
      }
      if (Type == 2) {
        rectMode(CENTER);
        noStroke();
        rect(x, y, wide, high);
      }
      if (x < -200 || x > width + 200 || y < -200 || y > height + 200) {
        list.remove(i);
        imglist.remove(i);
      }
    }
  }
}
