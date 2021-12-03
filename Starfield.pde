PImage img;
ArrayList <Star> sList = new ArrayList <Star> ();
int sNum = 500;
int imgdup;
void setup() {
  size(1000, 1000);
  img= loadImage("Starproject Puffer.jpg");
  for (int i = 0; i < sNum; i++) {
    sList.add(new Star());
  }
  sList.add((int)(Math.random()*sNum), new Ship());
  sList.add((int)(Math.random()*sNum), new Ship());
  sList.add((int)(Math.random()*sNum), new Ship());
  sList.add((int)(Math.random()*sNum), new Ship());
  sList.add((int)(Math.random()*sNum), new Ship());
  sList.add((int)(Math.random()*sNum), new Ship());
  sList.add((int)(Math.random()*sNum), new Ship());
}


void draw() {
  background(220);
  for (Star s : sList) {
    s.move();
    s.show();
  }
}


void mouseClicked() {
  for (Star s : sList) {
    if (dist(mouseX, mouseY,(float)s.x,(float)s.y)<=s.sz) {
      s.dead = true;
    }
  }
}
class Star {
  int sz, cl;
  double x, y, an, sp;
  boolean dead;
  Star() {
    sz = 10;
    cl = color((int)Math.random()*256, (int)Math.random()*256, (int)Math.random()*256);
    x = width/2;
    y= height/2;
    an = Math.random()*2*Math.PI;
    sp = Math.random()*10;
  }
  void move() {
    // x += (int)(Math.random() * 11) - 5;
    //y += (int)(Math.random() * 11) - 5;
      x += Math.cos(an) * sp;
      y += Math.sin(an) * sp;
    }
    void show() {
    fill(cl);
    ellipse((float) x, (float) y, (float) sz, (float) sz);
  }
}

class Ship extends Star {
  PImage myImg;
  Ship() {
    myImg = img;
    sz = 100;
    sp = 4;
  }
  void show() {
    ellipse((float) x, (float) y, (float) sz, (float) sz);
    image(myImg, (float) x-sz/2, (float) y-sz/2, (float)sz, (float)sz);
  }
  void move(){
   if (!dead) {
      x += Math.cos(an) * sp;
      y += Math.sin(an) * sp;
    }
}
}
  //Add spaceship
  //if mouse hits spaceship, mouse will destroy spaceship and explosion will repeat
