final int fps = 24;          // フレーム数/秒  (1フレームごとにサイコロを振る前提)
final int dY = 60;           // 行の間隔
final int dH = 20;           // 度数1当りの棒グラフの長さ
final int w = 40;            // 棒の幅
final int m = 6;             // サイコロの目の最大値
final int marginTop = 50;    // 上の余白
final int marginLeft = 50;   // 左の余白 (文字を除く)
final int marginChar = 15;   // 文字の左余白
int[] freq;            // サイコロの目ごとの回数を格納

void setup () {
  size(640, 400);
  frameRate(fps);
  noStroke();
  background(255, 255, 255);
  colorMode(HSB, 360, 100, 100);
  freq = new int[m];
}

void draw() {
  background(0, 0, 100);
  freq[(int)random(0, m)]++;          // 0-(m-1) の乱数を添字とする(小数点以下切り捨て)
  for (int i = 0; i < freq.length; i++) {
    int y = marginTop + i * dY;       // 棒の中心のy座標
    int h = freq[i] * dH;             // 棒の高さ(x方向)
    if (marginLeft + h + dH > width) {    // 次が書けないほど右に来ているか? (width はウィンドウの幅)
      fill(0, 0, 0);                  // 色を黒に変更
      noLoop();                       // 次から draw() を呼び出さない
    } else {
      fill(360.0 * i / m, 100, 100);  // 棒ごとに色相を変更
    }
    rect(marginLeft, y - w / 2, h, w);
    fill(0, 0, 0);                    // 文字の色は黒
    textSize(16);
    text(i + 1, marginChar, y);       // 棒の左に i + 1 を表示
  }
  // 最大値を表す縦棒を描く
  rect(marginLeft + maximum(freq) * dH, 0, 3, height);
}

int maximum(int[] a) {
  int result = 0;
  for (int i = 0; i < a.length; i++) {
    if (a[i] > result) {
      result = a[i];
    }
  }
  return result;
}