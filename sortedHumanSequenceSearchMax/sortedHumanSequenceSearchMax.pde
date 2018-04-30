// 定数
final int x0 = 50;                          // 人の中心の x座標の初期値
final int y = 300;                          // 人の足元の y座標
final int dx = 50;                          // 人の中心線間の距離
final int humanBodyWidth = 20;              // 体の幅
final int faceDiameter = 30;                // 顔の直径
final int[] humanBodyHeight = new int[] {   // 胴体の長さ; 人数は7名
  145, 186, 176, 168, 186, 156, 172
};
int n = 0;

void setup() {
  size(400, 400);             // ウィンドウのサイズ
  background(255, 255, 255);  // 背景色(白)
  noStroke();                 // 輪郭線を無効に
  
  // 人の列を背の高い順に並び替える
  for(int a = 0; a < 6; a++){
  int index = searchMaximum(humanBodyHeight, n);
  int temp = humanBodyHeight[n];
  humanBodyHeight[n] = humanBodyHeight[index];
  humanBodyHeight[index] = temp;
  n++;
  }

  // 人の列を描く
  fill(0, 0, 0);                                                     // 塗る色 (黒)
  int x = x0;
  for (int i = 0; i < humanBodyHeight.length; i++) {
    ellipse(x, y - humanBodyHeight[i], faceDiameter, faceDiameter);      // 頭
    rect(x - humanBodyWidth / 2, y - humanBodyHeight[i], 
      humanBodyWidth, humanBodyHeight[i]);                            // 胴体
    x = x + dx;
  }
}

int searchMaximum(int[] a, int n) {
  int max = 0;                                // 最も高い値
  int index = n;                              // 最も高い値の位置
  for (int i = n; i < a.length; i++) {
    if (a[i] > max) {
      max = a[i];
      index = i;
    }
  }
  return index;
}