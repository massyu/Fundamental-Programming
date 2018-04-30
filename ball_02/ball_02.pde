// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final int fps =60;
final int d = 40;
final int x0 = d/2;
final int y0 = d/2;
final int vy0 = 6;
final int vx0 = 4;
final float elas = 0.98;
final int dy = 30;
final int X = 0;
final int Y = 1;
final int VX = 2;
final int VY = 3;
// 変数
float cor;
float [] ball0;
void setup() {
  size(480, 480);
  noStroke();
  fill(0, 0, 0);
  ball0 = new float [4];
  ball0[Y] = y0;
  ball0[X] = x0;
  ball0[VY] = vy0;
  ball0[VX] = vx0;
  frameRate(fps);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0, 0, 100);
  boundBall(ball0);
  cor = calcHue(ball0[VX], ball0[VY]);
  if (ball0[VY]==0) {
    fill(0, 100, 100);
  } else {
    fill(cor, 100, 100);
  }
  ellipse(ball0[X], ball0[Y], d, d);
}

void boundBall(float ball0[]) {
  ball0[VY] += gravity;    // <-- 速度に重力加速度を加算する
  ball0[X] += ball0[VX];
  ball0[Y] += ball0[VY];

  if (ball0[Y]>=height - d/2) {
    ball0[VY] = -ball0[VY]*elas;
    ball0[Y]=height - d/2;
  } else if (ball0[Y]<=d/2) {
    ball0[VY] = -ball0[VY]*elas;
    ball0[Y]=d/2;
  } 

  if (ball0[X]>=width - d/2) {
    ball0[VX] = -ball0[VX]*elas;
    ball0[X]=width -d/2;
  } else if (ball0[X]<=d/2) {
    ball0[VX] = -ball0[VX]*elas;
    ball0[X]=d/2;
  }
}

float calcHue(float vy, float vx) {
  vy = sqrt(vx * vx + vy * vy);
  vy *= dy;
  return (vy);
}