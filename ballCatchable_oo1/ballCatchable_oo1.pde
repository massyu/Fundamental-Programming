// 定数
final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 15;            // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
final float d = 40;                 // ボールの直径
final float hueMax = 360.0;         // 色相の最大値


// オブジェクト
Ball ball0;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  ball0 = new Ball();                         // ボールの x, y, vx, vy を要素とする配列
  ball0.X  = random(d / 2, width - d / 2);     // ボールの中心のx座標
  ball0.Y  = random(d / 2, height / 5);        // ボールの中心のy座標
  ball0.VX = random(vx0min, vx0max);           // ボールの速度のx成分
  ball0.VY = random(vy0min, vy0max);           // ボールの速度のy成分
}

void draw() {
  background(0, 0, 100);
  fill(0, 100, 100);
  if (sqrt(pow(mouseX-ball0.X, 2)+pow(mouseY-ball0.Y, 2))>d/2) {
    fill(180, 100, 100);
    boundBall(ball0);
  }
  ellipse(ball0.X, ball0.Y, d, d);
}

void boundBall(Ball ball) {
  ball.X  += ball.VX;          // ボールが速度ぶん移動する
  ball.VY += gravity;           // 速度のy成分に重力加速度を加算する
  ball.Y  += ball.VY;          // ボールが速度ぶん移動する
  if (ball.X < d / 2) {
    ball.VX = - ball.VX * elas;
    ball.X = d / 2;
  } else if (ball.X > width - d / 2) {
    ball.VX = - ball.VX  * elas;
    ball.X = width - d / 2;
  }
  if (ball.Y > height - d / 2) {
    ball.VY = - ball.VY * elas;
    ball.Y = height - d / 2;
  } else if (ball.Y < d / 2) {
    ball.VY = - ball.VY * elas;
    ball.Y = d / 2;
  }
}

class Ball {
  float X;
  float Y;
  float VX;
  float VY;
}