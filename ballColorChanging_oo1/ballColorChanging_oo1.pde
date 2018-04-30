// constants
final int fps = 60;                 // 1秒間あたりのフレーム数
final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 8;             // vyの初期値の上限
final float d =40;
final float hueMax = 360.0;         // 色相の最大値

// variables
Ball aBall;                          // ボールのオブジェクト1つを参照する変数

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  aBall = new Ball(
    random(d / 2, width - d / 2), 
    random(d / 2, height / 5), 
    random(vx0min, vx0max), 
    random(vy0min, vy0max)
    );
}

void draw() {
  background(0, 0, 100);
  aBall.move();
  aBall.draw();
}

/** 動くボールを表す */
class Ball {
  final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
  final float elas = 0.98;            // 反発係数
  final float dH = 30;                // 色相の増加分
  float x;
  float y;
  float vx;
  float vy;
  float h = 0;                        // 色相
  int bounds = 0;                     // 跳ね返り回数

  Ball(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
  }

  Ball() {
    this(random(40 / 2, width - 40 / 2), random(40 / 2, height / 5), 
      random(-7, 5), random(4, 8));
  }

  void move() {
    x  += vx;          // ボールが速度ぶん移動する
    vy += gravity;     // 速度のy成分に重力加速度を加算する
    y  += vy;          // ボールが速度ぶん移動する
    if (x < d / 2) {
      vx = - vx * elas;
      x = d / 2;
    } else if (x > width - d / 2) {
      vx = - vx  * elas;
      x = width - d / 2;
    }
    if (y > height - d / 2) { // 床
      vy = - vy * elas;
      y = height - d / 2;
      // バウンド回数による色相の変更
      bounds += 1;
      if (bounds >= 4) {
        bounds = 0;
        h += dH;
        if (h > hueMax) {
          h -= hueMax;
        }
      }
    } else if (y < d / 2) {
      vy = - vy * elas;
      y = d / 2;
    }
  }
  void draw() {
    fill(h, 100, 100);
    ellipse(x, y, d, d);
  }
}