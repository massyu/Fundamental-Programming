// 定数
final int X = 0;
final int Y = 1;
final int VX = 2;
final int VY = 3;
final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 13;            // vyの初期値の上限
final int fps = 60;                 // 1秒間あたりのフレーム数
final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
final float d = 40;                 // ボールの直径
final float hueMax = 360.0;         // 色相の最大値

// 変数
float[] ball0;                      // ボールの x, y, vx, vy を要素とする配列を参照する変数

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  ball0 = new float[4];                         // ボールの x, y, vx, vy を要素とする配列
  ball0[X]  = random(d / 2, width - d / 2);     // x
  ball0[Y]  = random(d / 2, height / 5);        // y
  ball0[VX] = random(vx0min, vx0max);           // vx
  ball0[VY] = random(vy0min, vy0max);           // vy
}

void draw() {
  background(0, 0, 100);
  boundBall(ball0);
  if (sqrt(pow(mouseX-ball0[X], 2)+pow(mouseY-ball0[Y], 2))<d/2) {
    fill(0, 100, 100);
  } else {
    fill(180, 100, 100);
  }
  ellipse(ball0[X], ball0[Y], d, d);
}

// 必要な関数は適宜追加

void boundBall(float[] ball) {
  ball[X]  += ball[VX];          // ボールが速度ぶん移動する
  ball[VY] += gravity;           // 速度のy成分に重力加速度を加算する
  ball[Y]  += ball[VY];          // ボールが速度ぶん移動する
  if (ball[X] < d / 2) {
    ball[VX] = - ball[VX] * elas;
    ball[X] = d / 2;
  } else if (ball[X] > width - d / 2) {
    ball[VX] = - ball[VX]  * elas;
    ball[X] = width - d / 2;
  }
  if (ball[Y] > height - d / 2) {
    ball[VY] = - ball[VY] * elas;
    ball[Y] = height - d / 2;
  } else if (ball[Y] < d / 2) {
    ball[VY] = - ball[VY] * elas;
    ball[Y] = d / 2;
  }
}