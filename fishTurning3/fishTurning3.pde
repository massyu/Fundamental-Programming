// 定数
final int[] fishToLeft  = new int[] {    // 魚の形状 (左向き)
  0, 0, 70, 30, // 胴体の相対位置(x,y)・横幅・縦幅
  38, 0, 15, 25                          // 尾びれの相対位置(x,y)・横幅・縦幅
};
final int[] fishToRight = new int[] {    // 魚の形状 (右向き)
  0, 0, 70, 30, 
  -38, 0, 15, 25
};

final int bodyX = 0;
final int bodyY = 1;
final int bodyLength = 2;
final int bodyWidth =3;
final int finX = 4;
final int finY = 5;
final int finLength = 6;
final int finWidth = 7;
// 変数
int [] x;                           // 魚の中心の x座標
int [] y;        // 魚の中心の y座標
int [] fish;                        // 現在の魚の形状
int vx;
int x1=100;
void setup() {
  size(400, 400);             // ウィンドウのサイズ
  noStroke();                 // 輪郭線を無効に
  background(63, 63, 255);    // 背景色
  fill(0, 0, 0);
  // 変数の初期値
  x =new int []{300, 200, 300};
  y =new int []{100, 200, 300};
  fish = fishToRight;
  vx = 1;
}

void draw() {
  background(63, 63, 255);
  drawFish(x, y, fish);
}

void drawFish(int [] x, int [] y, int [] fish) {
  for (int i=0; i<3; i++) {
    if (x[i] + fish[bodyX] < mouseX) {
      fish = fishToRight;
      x[i] += vx;
    } else if (x[i] + fish[bodyX] > mouseX) {
      fish = fishToLeft;
      x[i] -= vx;
    }
    ellipse(x[i] + fish[bodyX], y[i] + fish[bodyY], fish[bodyLength], fish[bodyWidth]);
    ellipse(x[i] + fish[finX], y[i] + fish[finY], fish[finLength], fish[finWidth]);
  }
}