class Particle {
  int myColor;
  double myX, myY, myAngle, mySpeed;
  Particle() {
    myColor = color(0, (int)(Math.random()*100)+80, 255);
    myX = 250;
    myY = 250;
    myAngle = (Math.random()*(2*Math.PI));
    mySpeed = (Math.random()*10);
  }
  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, 5, 5);
  }
  void move() {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
  }
}

class OddBallParticle extends Particle {
  OddBallParticle() {
    myColor = color((int)(Math.random()*255));
    myX = 250;
    myY = 250;
    myAngle = (Math.random()*(2*Math.PI));
    mySpeed = (Math.random()*20);
  }
  void show() {
    fill(myColor);
    //rect((float)myX,(float)myY, 10, 10);
    rect((float)myX-500,(float)myY, 10, 10);
    rect((float)myX,(float)myY-500, 10, 10);
    rect((float)myX+500,(float)myY, 10, 10);
    rect((float)myX,(float)myY+500, 10, 10);
  }
  void move() {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
  }
}

Particle[] starfield = new Particle[1000];

void setup() {
  size(500,500);
  background(0);
  for(int i = 0; i < starfield.length; i++) {
    starfield[i] = new Particle();
  }
  for(int i = 0; i < 300; i++) {
    starfield[i] = new OddBallParticle();
  }
}

void draw() {
  background(0);
  for(int i = 0; i < starfield.length; i++) {
    starfield[i].move();
    starfield[i].show();
  }
}
