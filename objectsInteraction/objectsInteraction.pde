final float vx0min = -3;            // vxの初期値の下限
final float vx0max = 7;             // vxの初期値の上限
final float vy0min = 3;             // vyの初期値の下限
final float vy0max = 7;             // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float d = 40;
final float elas = 0.98;
final float hueMax = 360;

// 変数
Ball[] balls = new Ball[4];                         // ボールのオブジェクト1つを参照する変数
Ball square;
void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  fill(0, 0, 0);
  square = new Ball();
  for (int i=0; i<balls.length; i++) {
    balls[i] = new Ball ();
  }
  for (int i=0; i<balls.length; i++) {
    balls[i].setD(d);                    // ボールの直径をセット
    balls[i].setX(random(d / 2, width - d / 2));
    balls[i].setY(random(d / 2, height / 5));
    balls[i].setVX(random(vx0min, vx0max));
    balls[i].setVY(random(vy0min, vy0max));
    balls[i].setgravity(9.8 / fps);
    balls[i].setelas(elas);
    balls[i].sethueMax(hueMax);
    balls[i].setjud(1);
  }
  square.setD(d);
  square.setX(random(d / 2, width - d / 2));
  square.setX(random(d / 2, width - d / 2));
  square.setVX(random(vx0min, vx0max));
  square.setVY(random(vy0min, vy0max));
  square.setgravity(9.8 / fps);
  square.setelas(elas);
  square.sethueMax(hueMax);
  square.setjud(0);
  rectMode(CENTER);
  colorMode(HSB, hueMax, 100, 100);
}

void draw() {
  background(0, 0, 100);
  for (int i=0; i<balls.length; i++) {
    balls[i].move();
    balls[i].draw();
  }
  square.move();
  square.draw2();
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
  int jud;
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
  void setjud(int jud) {
    this.jud = jud;
  }
  void move() {
    x  += vx;          // ボールが速度ぶん移動する
    vy += gravity; 
    y  += vy;          // ボールが速度ぶん移動する
    if (x < d / 2) {
      if (jud==0) {
        for (int i=0; i<balls.length; i++) {
          balls[i].vx -= 10;
        }
      }else {
        square.vx -= 2;
      }
      vx = - vx * elas;
      x = d / 2;
    } else if (x > width - d / 2) {
      if (jud==0) {
        for (int i=0; i<balls.length; i++) {
          balls[i].vy += 10;
        }
      }else {
        square.vy += 2;
      }
      vx = - vx  * elas;
      x = width - d / 2;
    }
    if (y > height - d / 2) {
      if (jud==0) {
        for (int i=0; i<balls.length; i++) {
          balls[i].vx += 10;
        }
      }else {
        square.vx += 2;
      }
      vy = - vy * elas;
      y = height - d / 2;
    } else if (y < d / 2) {
      if (jud==0) {
        for (int i=0; i<balls.length; i++) {
          balls[i].vy -= 10;
        }
      }else {
        square.vy -= 2;
      }
      vy = - vy * elas;
      y = d / 2;
    }
  }
  void draw() {
    fill(0, 100, 100);
    ellipse(x, y, d, d);
  }
  void draw2() {
    fill(280, 100, 100);
    rect(x, y, d, d);
  }
}