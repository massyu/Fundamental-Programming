Stamp stamper;
Stamp stamp;

void setup() {
  size(480, 480);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  stamper= new Stamp();
  stamper.setX(width/2);
  stamper.setY(height/2);
  stamper.setH(250);
  stamp= new Stamp();
  stamp.setX(mouseX);
  stamp.setY(mouseY);
  stamp.setH(0);
}

void draw() {
  background(0, 0, 100);
  stamper.draw1();
  stamp.draw2();
}

class Stamp {
  final float d = 40;
  //属性
  float x;
  float y;
  float h;
  //アクセサメソッド
  void setX(float x) {
    this.x = x;
  }
  void setY(float y) {
    this.y = y;        // ボールの中心のy座標
  }
  void setH(float h) {
    this.h = h;        // ボールの中心のy座標
  }
  //メソッド
  void draw1() {
    fill(h, 100, 100);
    if (mousePressed) {
      x = mouseX;
      y = mouseY;
    }
    ellipse(x, y, d, d);
    }
  void draw2() {
      fill(h, 100, 100);
      ellipse(mouseX, mouseY, d, d);
  }
}