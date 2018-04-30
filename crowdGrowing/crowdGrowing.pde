float x;                      // 人のx座標の初期値
float y;                      // 人の列のy座標
int bodyWidth = 20;                // 体の幅
int faceDiameter = 30;             // 顔の直径
float bodyHeight;              // 胴体の長さ

void setup() {
  size(400, 400);                  // ウィンドウのサイズ
  background(255, 255, 255);       // 背景色(白)
  noStroke();                      // 輪郭線を無効に
  colorMode(HSB, 360, 100, 100);   // カラーモードをHSBに
  frameRate(6);
}

void draw() {
  x = (float)random(0, 380);
  y = (float)random(100, 400);
  bodyHeight = random(40,120);
  drawHuman(x, y, bodyHeight);                   // 人の描画
}

void drawHuman(float x, float y, float bodyHeight) {
  fill(random(0, 360), 100, 100);            // ランダムな色相 (カラーモードはHSB)
  ellipse(x, y - bodyHeight, faceDiameter, faceDiameter);               // 顔
  rect(x - bodyWidth / 2, y - bodyHeight, bodyWidth, bodyHeight);       // 胴体
}