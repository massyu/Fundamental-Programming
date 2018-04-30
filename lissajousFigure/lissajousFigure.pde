// 定数
final float circleRadius = 150;   // 円の半径
final float dTheta = 5;           // 回転角 [degree] の増分/1フレーム
final float dDelta = 360.0 / 32;
final float pointDiameter = 8;    // 点の直径
// 変数
float centerX;                    // ウィンドウの中心のx座標
float centerY;                    // ウィンドウの中心のy座標
float theta;                      // 回転角 [degree]
float x, y;
float delta;
float cor;
void setup() {
  size(400, 400);
  noStroke();
  background(255, 255, 255);
  colorMode(HSB, 360, 100, 100);  // 色の指定をHSBに
  // (色相 0-360, 彩度 0-100, 明度 0-100)
  centerX = width / 2;
  centerY = height / 2;
  theta = 0;
  delta = 0;
  cor = 0;
}

void draw() {
  float radTheta = radians(theta);                       // 回転角 [radian]
  float radDelta = radians(delta);
  x = pointX(circleRadius, radTheta - radDelta);
  y = pointY(circleRadius, radTheta);
  cor = pointHue(cor);
  fill(cor, 100, 100);
  ellipse(x + centerX, y + centerY, pointDiameter, pointDiameter);
  theta = theta + dTheta;
  delta = delta + dDelta;
}


float pointX(float r, float rad) {
  x = r * cos(rad);
  return x;
}

float pointY(float r, float rad) {
  y = -r * sin(rad);
  return y;
}

float pointHue(float cor) {
  cor += 0.5;
  if (cor>360)
    cor = 0;
  return cor;
}