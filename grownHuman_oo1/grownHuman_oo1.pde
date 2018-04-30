final float fps = 60;            // フレームレート
final float he = 240;            // 最終身長
final float we = 140;            // 最終体幅
final float de = 50;             // 最終の顔の直径

Human someone;

void setup() {
  size(400, 400);                  // ウィンドウのサイズ
  frameRate(fps);
  noStroke();                      // 輪郭線を無効に
  colorMode(HSB, 360, 100, 100);   // カラーモードをHSBに
  float x = 200;
  float y = 320;
  float h = 40;
  float w = 20;
  float d = 25;
  someone = new Human(x, y, h, w, d);
}

/**
 *  人の成長を描く
 */
void draw() {
  background(0, 0, 100);        // 背景色(白)
  someone.grown();            // 人を成長させる
  someone.drawFigure();         // 人を描く
}

class Human {
  final float growthRate = 0.004;  // 成長率
  float x;
  float y;
  float h;
  float w;
  float d;
  Human(float x, float y, float h, float w, float d) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    this.d = d;
  }
  void grown() {
    if ( h < he )
      h = h * (1.0 + growthRate);
    if ( w < we )
      w = w * (1.0 + growthRate * 0.8);
    if ( d < de )
      d = d * (1.0 + growthRate * 0.5);
  }
  void drawFigure() {
    fill(35, 60, 100);
    ellipse(x, y - h, d, d);           // 顔
    fill(220, 87, 100);
    ellipse(x, y - h / 2 + d / 2, w, h); // 胴体
  }
}