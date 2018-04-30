// constants
final int fps = 60;                 // 1秒間あたりのフレーム数
final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 8;             // vyの初期値の上限
final float hueMax = 360.0;         // 色相の最大値
final float ballmax = 199;
float d = 40;
float h = 8;
int ballcount = 0;
// variables
Ball[] aBall = new Ball[200];                          // ボールのオブジェクト1つを参照する変数

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);

  aBall[ballcount] = new Ball(d, 
    random(d / 2, width - d / 2), 
    random(d / 2, height / 5), 
    random(vx0min, vx0max), 
    random(vy0min, vy0max), 
    d*h
    );
}

void draw() {
  background(0, 0, 100);
  for (int i=0; i<=ballcount; i++) {
    aBall[i].move();
    aBall[i].draw();
  }
}

/** 動くボールを表す */
class Ball {
  final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
  final float elas = 0.98;            // 反発係数
  final float dH = 30;                // 色相の増加分
  float d;
  float x;
  float y;
  float vx;
  float vy;
  float h = 0;                        // 色相
  boolean judge;

  Ball(float d, float x, float y, float vx, float vy, float h) {
    this.d = d;
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.h = h;
    this.judge = false;
  }

  Ball(float d, float x, float y, float h) {
    this(d, x, y, random(-7, 5), random(-8, -4), h);
    this.judge = false;
  }

  Ball() {
    this(40, random(40 / 2, width - 40 / 2), random(40 / 2, height / 5), 
      random(-7, 5), random(4, 8), 0);
    this.judge = false;
  }

  void move() {
    split();
    x  += vx;          // ボールが速度ぶん移動する
    vy += gravity;          // 速度のy成分に重力加速度を加算する
    y  += vy;          // ボールが速度ぶん移動する
    if (x < d / 2) {
      vx = - vx * elas;
      x = d / 2;
    } else if (x > width - d / 2) {
      vx = - vx  * elas;
      x = width - d / 2;
    }
    if (y > height - d / 2) {
      vy = - vy * elas;
      y = height - d / 2;
    } else if (y < d / 2) {
      vy = - vy * elas;
      y = d / 2;
    }
  }

  void draw() {
    fill(calcHue(h), 100, 100);
    ellipse(x, y, d, d);
  }

  void split() {
    if (sqrt(pow(mouseX - x, 2)+pow(mouseY - y, 2))>d/2) {
      judge = true;
    } else {
      if (judge) {
        if (d<50) {
          d *= 1.26;
        } else {
          if (ballcount<ballmax) {
            for (int c=0; c<8; c++) {
              d=15;
              ballcount++;
              aBall[ballcount] = new Ball(d, x, y, h);
            }
          }
        }
        judge = false;
      }
    }
  }

  float  calcHue(float h) {
    h = 360%d*10;
    return h;
  }
}