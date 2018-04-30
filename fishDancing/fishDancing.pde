// 定数
final int[] fishToLeft  = new int[] {    // 魚の形状 (左向き)
  0, 0, 70, 30, // 胴体の相対位置(x,y)・横幅・縦幅
  38, 0, 15, 25                          // 尾びれの相対位置(x,y)・横幅・縦幅
};
final int[] fishToRight = new int[] {    // 魚の形状 (右向き)
  0, 0, 70, 30, 
  -38, 0, 15, 25
};
final int [] vx = new int[]{
  3, 2, 1 
};

final int bodyX = 0;
final int bodyY = 1;
final int bodyLength = 2;
final int bodyWidth =3;
final int finX = 4;
final int finY = 5;
final int finLength = 6;
final int finWidth = 7;
final int end1 = 365;
final int end2 = 35;
// 変数
int [] x =new int[] {100, 100, 100};                             // 魚の中心の x座標
int [] y = new int [3];        // 魚の中心の y座標
int[] fish;                        // 現在の魚の形状
int baitXY;

void setup() {
  size(400, 400);             // ウィンドウのサイズ
  noStroke();                 // 輪郭線を無効に
  background(63, 63, 255);    // 背景色

  // 変数の初期値
  baitXY =10;
  fish = fishToRight;         // 変数 fish は 変数 fishToRight と同じ配列を参照
}

void draw() {
  background(63, 63, 255);
  for (int i = 0; i < 2; i++) {
    if (x[0] + fish[bodyX] < mouseX) {
      fish = fishToRight;
      x[0] += vx[0];
    } else if (x[0] + fish[bodyX] > mouseX) {
      fish = fishToLeft;
      x[0] -= vx[0];
    } 
    y[0] = i * 100 +100;
    fill(0, 0, 0, (i+1)*80);
    ellipse(x[0] + fish[bodyX], y[0] + fish[bodyY], fish[bodyLength], fish[bodyWidth]);
    ellipse(x[0] + fish[finX], y[0] + fish[finY], fish[finLength], fish[finWidth]);
  }

  for (int i = 0; i < 2; i++) {
    if (x[1] + fish[bodyX] < mouseX) {
      fish = fishToRight;
      x[1] += vx[1];
    } else if (x[1] + fish[bodyX] > mouseX) {
      fish = fishToLeft;
      x[1] -= vx[1];
    } 
    y[1] = i * 140 +150;
    fill(0, 0, 0, (i+1)*110);    
    ellipse(x[1] + fish[bodyX], y[1] + fish[bodyY], fish[bodyLength], fish[bodyWidth]);
    ellipse(x[1] + fish[finX], y[1] + fish[finY], fish[finLength], fish[finWidth]);
  }

  if (x[2] + fish[bodyX] < mouseX) {
    fish = fishToRight;
    x[2] += vx[2];
  } else if (x[2] + fish[bodyX] > mouseX) {
    fish = fishToLeft;
    x[2] -= vx[2];
  } 
  y[2] =240;
  fill(0, 0, 0, 185);
  ellipse(x[2] + fish[bodyX], y[2] + fish[bodyY], fish[bodyLength], fish[bodyWidth]);
  ellipse(x[2] + fish[finX], y[2] + fish[finY], fish[finLength], fish[finWidth]);
}