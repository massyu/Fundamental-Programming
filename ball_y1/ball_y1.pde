// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final int fps =60;
final int d = 40;
final int x = 100;
final float y0 = 20;
final float vy0 = 4;
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
}

void draw() {
  vy += gravity;    // <-- 速度に重力加速度を加算する
  y += vy;          // <-- ボールが速度ぶん移動する
  background(255, 255, 255);
  ellipse(x, y, d, d);
}