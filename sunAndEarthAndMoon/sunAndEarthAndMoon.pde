Sun theSun;

void setup() {
  size(480, 480);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  theSun = new Sun(50, width / 2, height / 2);
}

void draw() {
  background(0, 0, 100);
  theSun.drawFigure();
}

class Sun {
  float d;                 // 直径
  float x;                 // 中心のx座標
  float y;                 // 中心のy座標
  Earth theEarth;
  Sun(float d, float x, float y) {
    this.d = d;
    this.x = x;
    this.y = y;
    theEarth = new Earth(0.6 * d, 150, x, y);    // 直径および回転の半径と中心の位置を与える
  }
  void drawFigure() {
    theEarth.drawFigure();             // Earthオブジェクトに描画を指示
    fill(30, 70, 100);
    ellipse(x, y, d, d);         // 自分自身を描画
  }
}

class Earth {
  float ed;
  float er;
  float ex;
  float ey;
  float theta = 0;
  float dTheta = 1;
  float rad;
  Moon theMoon;
  Earth(float d, float r, float x, float y) {
    this.ed = d;
    this.er = r;
    this.ex = x;
    this.ey = y;
    theMoon = new Moon(0.3 * d, 40, x, y);    // 直径および回転の半径と中心の位置を与える
  }
  void drawFigure() {
    theMoon.drawFigure(ex, ey, er);
    rad = radians(theta);
    ex = er * cos(rad);
    ey = -er * sin(rad);
    fill(250, 100, 100);
    ellipse(ex+width/2, ey+height/2, ed, ed);
    theta = theta + dTheta;
  }
}

class Moon {
  float md;
  float mr;
  float mx;
  float my;
  float theta = 0;
  float dTheta = 3;
  float rad;
  Moon(float d, float r, float x, float y) {
    this.md = d;
    this.mr = r;
    this.mx = x;
    this.my = y;
  }
  void drawFigure(float ex, float ey, float er) {
    rad = radians(theta);
    mx = mr * cos(rad);
    my = -mr * sin(rad);
    fill(40, 100, 100);
    ellipse(ex+mx+width/2, ey+my+height/2, md, md);
    theta = theta + dTheta;
  }
}