float x0 = 200.0;           // 元の正方形の中心のx座標
float y0 = 200.0;           // 元の正方形の中心のy座標
float m0 = 300.0;           // 元の正方形の一辺の長さ

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  background(255, 255, 255);
  fill(0, 0, 0);  
  drawSquare(x0, y0, m0);
}

void drawSquare(float x, float y, float m) { 
  if (m>1) {
    m/=3;
    drawSquare(x-m, y-m, m);
    drawSquare(x-m, y+m, m);  
    drawSquare(x+m, y-m, m);
    drawSquare(x+m, y+m, m);
  } else {
    rectMode(CENTER);
    rect(x-m, y-m, m, m);
    rect(x-m, y+m, m, m);    
    rect(x+m, y-m, m, m);    
    rect(x+m, y+m, m, m);
  }
}