// 定数
final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 15;            // vyの初期値の上限
final float fps = 60.0;             // 1秒間あたりのフレーム数
final float gravity = 9.8 / 60;     // 重力加速度を1フレームあたりにしたもの
final float elas = 0.98;            // 反発係数力
final float d = 40.0;               // ボールの直径
final float hueMax = 360.0;         // 色相の最大値
final int nBalls = 10;               // ボールの個数
int color1;
// 変数
Ball[] balls = new Ball[10];                    // 複数のボールの位置と速度を保持する2次元配列を参照する変数
int[] energy;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  for (int i = 0; i < nBalls; i++) {
    balls[i] = new Ball();
  }
  energy = new int[nBalls];
  // 初期位置と初期速度をボールごとに決定(乱数で)
  for (int i = 0; i < nBalls; i++) {
    balls[i].X  = random(d / 2, width - d / 2);     // x
    balls[i].Y  = random(d / 2, height / 5);        // y
    balls[i].VX = random(vx0min, vx0max);           // vx
    balls[i].VY = random(vy0min, vy0max);           // vy
  }
  for (int j = 0; j < energy.length; j++) {
    energy[j] = 0;
  }
}

void draw() {
  background(0, 0, 100);
  for (int i=0; i<nBalls; i++) {
    if (sqrt(pow(mouseX-balls[i].X, 2)+pow(mouseY-balls[i].Y, 2))>d/2) {
      fill(180, 100, 100);
      boundBalls(balls, i);
      energy[i]=0;
      ellipse(balls[i].X, balls[i].Y, d, d);
    } else {
      color1=int(random(0, 360));
      fill(color1, 100, 100);
      upSpeed(balls, i);
      energy[i]+=1;
      ellipse(balls[i].X, balls[i].Y, d+energy[i], d+energy[i]);
    }
  }

  // ここを考える
}

// 必要な関数は適宜追加

void upSpeed(Ball[] ball, int i) {
  ball[i].VX += 2;
}

void boundBalls(Ball[] ball, int i) {
  ball[i].X  += ball[i].VX;          // ボールが速度ぶん移動する
  ball[i].VY += gravity;           // 速度のy成分に重力加速度を加算する
  ball[i].Y  += ball[i].VY;          // ボールが速度ぶん移動する
  if (ball[i].X < d / 2) {
    ball[i].VX = - ball[i].VX * elas;
    ball[i].X = d / 2;
  } else if (ball[i].X > width - d / 2) {
    ball[i].VX = - ball[i].VX  * elas;
    ball[i].X = width - d / 2;
  }
  if (ball[i].Y > height - d / 2) {
    ball[i].VY = - ball[i].VY * elas;
    ball[i].Y = height - d / 2;
  } else if (ball[i].Y < d / 2) {
    ball[i].VY = - ball[i].VY * elas;
    ball[i].Y = d / 2;
  }
}

class Ball {
  float X;
  float Y;
  float VX;
  float VY;
}