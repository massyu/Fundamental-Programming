// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final int fps =60;
final int d = 40;
final int x0 = 20;
final int y0 = 20;
final int vy0 = 4;
final int vx0 = 4;
final float elas = 0.98;
final int dy = 30;
// 変数
float y;                         // <-- ボールのy座標
float x;
float vy;                        // <-- ボールの速度のy成分
float vx;
float cor;

void setup() {
  size(480, 480);
  noStroke();
  fill(0, 0, 0);
  y = y0;
  x = x0;
  vy = vy0;
  vx = vx0;
  frameRate(fps);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  vy += gravity;    // <-- 速度に重力加速度を加算する
  y += vy;          // <-- ボールが速度ぶん移動する
  x += vx;
  background(0, 0, 100);
  cor = calcHue(vy,vx);
  if (vy==0) {
    fill(0, 100, 100);
  } else {
    fill(cor, 100, 100);
  }

  if (y>=460) {
    vy = -vy*elas;
    ellipse(x, height-d/2, d, d);
    y=460;
  } else if (y<=20) {
    vy = -vy*elas;
    ellipse(x, d/2, d, d);
    y=20;
  } else if (x>=460) {
    vx = -vx*elas;
    ellipse(width-d/2, y, d, d);
    x=460;
  } else if (x<=20) {
    vx = -vx*elas;
    ellipse(d/2, y, d, d);
    x=20;
  } else {
    ellipse(x, y, d, d);
  }
}

float calcHue(float vy, float vx) {
  vy = sqrt(vx * vx + vy * vy);
  vy *= dy;
  return (vy);
}