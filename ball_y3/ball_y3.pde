// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final int fps =60;
final int d = 40;
final int x = 100;
final float y0 = 20;
final float vy0 = 4;
final float elas = 0.98;
final float dy = 0.75;
// 変数
float y;                         // <-- ボールのy座標
float vy;                        // <-- ボールの速度のy成分
void setup() {
  size(200, 480);
  noStroke();
  fill(0, 0, 0);
  y = y0;
  vy = vy0;
  frameRate(fps);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  vy += gravity;    // <-- 速度に重力加速度を加算する
  y += vy;          // <-- ボールが速度ぶん移動する
  background(0, 0, 100);
  if (y==0) {
    fill(0, 100, 100);
  } else {
    fill(y*dy, 100, 100);
  }

  if (y>=460) {
    vy = -vy*elas;
    ellipse(x, height-d/2, d, d);
  } else {
    ellipse(x, y, d, d);
  }
}