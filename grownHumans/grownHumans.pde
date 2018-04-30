final float fps = 60;            // フレームレート
final float de = 50;             // 最終の顔の直径

Human[] someone = new Human[5];

void setup() {
  size(400, 400);                  // ウィンドウのサイズ
  frameRate(fps);
  noStroke();                      // 輪郭線を無効に
  colorMode(HSB, 360, 100, 100);   // カラーモードをHSBに
  float x = 40;
  float y = 320;
  float d = 25;
  for (int i=0; i<someone.length; i++) {
    someone[i] = new Human(x+i*80, y, d);
  }
}

/**
 *  人の成長を描く
 */
void draw() {
  background(0, 0, 100);        // 背景色(白)
  for (int i=0; i<someone.length; i++) {
    someone[i].grown();            // 人を成長させる
    someone[i].drawFigure();         // 人を描く
  }
}

class Human {
  final float growthRate = 0.004;  // 成長率
  float x;
  float y;
  float h;
  float w;
  float d;
  float he;
  float we;
  float hue;
  Human(float x, float y, float d) {
    this.x = x;
    this.y = y;
    this.h = random(40, 50);
    this.w = random(15, 20);
    this.d = d;
    this.he = random(160,240);
    this.we = random(80,100);
    this.hue = random(0,360);
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
    fill(hue, 87, 100);
    ellipse(x, y - h / 2 + d / 2, w, h); // 胴体
  }
}