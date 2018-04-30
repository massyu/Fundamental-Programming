final float vx0min = -3;            // vxの初期値の下限
final float vx0max = 7;             // vxの初期値の上限
final float vy0min = 3;             // vyの初期値の下限
final float vy0max = 7;             // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float d = 40;
final float elas = 0.98;
final float hueMax = 360;

// 変数
Ball ball0;                         // ボールのオブジェクト1つを参照する変数
Ball ball1;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  fill(255, 0, 0);
  ball0 = new Ball();
  ball0.setD(d);                    // ボールの直径をセット
  ball0.setX(random(d / 2, width - d / 2));
  ball0.setY(random(d / 2, height / 5));
  ball0.setVX(random(vx0min, vx0max));
  ball0.setVY(random(vy0min, vy0max));
  ball0.setgravity(9.8 / fps);
  ball0.setelas(elas);
  ball0.sethueMax(hueMax);
  ball0.setjud(0);
  ball1 = new Ball();
  ball1.setD(d);                    // ボールの直径をセット
  ball1.setX(random(d / 2, width - d / 2));
  ball1.setY(random(d / 2, height / 5));
  ball1.setVX(random(vx0min, vx0max));
  ball1.setVY(random(vy0min, vy0max));
  ball1.setgravity(9.8 / fps);
  ball1.setelas(elas);
  ball1.sethueMax(180);
  ball1.setjud(1);
  colorMode(HSB, ball0.hueMax, 100, 100);
}

void draw() {
  background(0, 0, 100);
  ball0.move();
  ball0.draw();
  ball1.move();
  ball1.draw();
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
    if (jud==0) {
      fill(180, 100, 100);
      vx = trace1(x);
      x += vx;
      vy = trace2(y);
      y += vy;
    } else {
      fill(hueMax, 100, 0);
      x  += vx;          // ボールが速度ぶん移動する
      vy += gravity; 
      y  += vy;          // ボールが速度ぶん移動する
    }
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
    ellipse(x, y, d, d);
  }
  float trace1(float x) {
    if (ball1.x > x) {
      vx += gravity;
      x += vx;
    } else {
      vx += -gravity;
      x += vx;
    }
    return vx;
  }
  float trace2(float y) {
    float gravity;
    if (ball1.y > y) {
      gravity = abs(ball1.x-x)/10000;
      vy += gravity;
      y += vy;
    } else {
      gravity = abs(ball1.y-y)/10000;
      vy -= gravity;
      y += vy;
    }
    return vy;
  }
}