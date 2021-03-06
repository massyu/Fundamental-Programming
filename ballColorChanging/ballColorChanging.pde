final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 8;             // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float elas = 0.98;
final float hueMax = 360;

// 変数
Ball ball0;                         // ボールのオブジェクト1つを参照する変数
float d = 40;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  fill(0, 0, 0);
  ball0 = new Ball();
  ball0.setD(d);                    // ボールの直径をセット
  ball0.setX(random(d / 2, width - d / 2));
  ball0.setY(random(d / 2, height / 5));
  ball0.setVX(random(vx0min, vx0max));
  ball0.setVY(random(vy0min, vy0max));
  ball0.setgravity(9.8 / fps);
  ball0.setelas(elas);
  ball0.sethueMax(hueMax);
  colorMode(HSB, ball0.hueMax, 100, 100);
}

void draw() {
  background(0, 0, 100);
  ball0.move();
  ball0.draw();
}

/** 動くボールを表す */
class Ball {
  float gravity;    // 1フレームあたりの重力加速度
  float elas;            // 反発係数
  float hueMax;
  float d;
  float x;
  float y;
  float vx;
  float vy;
  int bounds=0;
  int i = 0;
  void setD(float d) {
    this.d = d;
  }
  void setX(float x) {
    this.x = x;
  }
  void setY(float y) {
    this.y = y;        // ボールの中心のy座標
  }
  void setVX(float vx) {
    this.vx = vx;
  }
  void setVY(float vy) {
    this.vy = vy;
  }
  void setgravity(float gravity) {
    this.gravity = gravity;
  }
  void setelas(float elas) {
    this.elas = elas;
  }
  void sethueMax(float hueMax) {
    this.hueMax = hueMax;
  }
  void move() {
    x  += vx;          // ボールが速度ぶん移動する
    vy += gravity;          // 速度のy成分に重力加速度を加算する
    y  += vy;          // ボールが速度ぶん移動する
    if (x < d / 2) {
      bounds++;
      judge(bounds);
      vx = - vx * elas;
      x = d / 2;
    } else if (x > width - d / 2) {
      bounds++;
      judge(bounds);
      vx = - vx  * elas;
      x = width - d / 2;
    }
    if (y > height - d / 2) {
      bounds++;
      judge(bounds);
      vy = - vy * elas;
      y = height - d / 2;
    } else if (y < d / 2) {
      bounds++;
      judge(bounds);
      vy = - vy * elas;
      y = d / 2;
    }
  }
  void draw() {
    ellipse(x, y, d, d);
  }
  void judge(int bounds) {
    if (bounds%3==0) {
      i++;
      fill(40*i, 100, 100);
    }
    if (i>=9)
      i=0;
  }
}