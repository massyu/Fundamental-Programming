float x0 = 200.0;           // 元の正方形の中心のx座標
float y0 = 200.0;           // 元の正方形の中心のy座標
float m0 = 300.0;           // 元の正方形の一辺の長さ
float x1, x2;
float y1, y2;
float m;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  background(255, 255, 255);
  fill(0, 0, 0);
  x1=x0-m0/3;
  y1=y0-m0/3;
  x2=x0+m0/3;
  y2=x0+m0/3;
  m=m0/3;
  drawSquare(x1, y1, m);
  drawSquare(x1, y2, m);
  drawSquare(x2, y1, m);
  drawSquare(x2, y2, m);
  // 小さい正方形の中心座標と一辺の長さを計算
  // drawSquare を 4回呼び出す
}

void drawSquare(float x, float y, float m) {
  rectMode(CENTER);
  rect(x, y, m, m);
  // 1つの正方形を素直に描画
}