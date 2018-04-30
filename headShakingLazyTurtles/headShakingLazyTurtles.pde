final float turtleD  = 100;        // 亀の大きさ(甲羅の直径)
final int numTurt = 3;
final float distTurt = 140;
Turtle[] turtle = new Turtle[numTurt];
boolean count = false;
boolean isShaking = false;
void setup() {
  size(480, 480);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i<turtle.length; i++) {
    turtle[i] = new Turtle(turtleD, width / 7 + distTurt*i, height - turtleD);
  }
}

void draw() {
  background(0, 0, 100);
  for (int i=0; i<turtle.length; i++) {
    turtle[i].drawFigure();
    turtle[i].move();
  }
}

class Turtle {
  final float vx0 = 0;
  final float vy0 = -0.3;
  float x;
  float y;
  float vx;
  float vy;
  float d;
  Shell shell;
  Head head;
  Foot[] foot;
  Turtle(float d, float x, float y) {  // 甲羅の直径と中心の初期位置
    this.d = d;
    this.x = x;
    this.y = y;
    vx = vx0;
    vy = vy0;
    foot = new Foot[numTurt];
    head = new Head(d / 3, 0, - d / 2);
    shell = new Shell(d, 0, 0);
    for (int i = 0; i < numTurt; i++) {
      foot[i] = new Foot(d/3, d/2, -d/4);      // オブジェクトの生成
    }
  }
  void drawFigure() {
    shell.judge(x, y);
    for (int i=0; i<turtle.length; i++) {
      foot[i].drawFigure(x, y);
    }
    head.drawFigure(x, y);         // 頭を描画する
    shell.drawFigure(x, y);        // 甲羅を描画する
  }
  void move() {
    x += vx;
    if (count) {
      if (head.getTopY(y) > 0) {
        y += vy;
        count = false;
        isShaking=false;
      }
    }
  }
}

/** 甲羅 */
class Shell {
  float d;                 // 甲羅の直径
  float offsetX;           // 体の中心からのx方向のoffset
  float offsetY;           // 体の中心からのy方向のoffset
  Shell(float d, float offsetX, float offsetY) { //
    this.d = d;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
  }
  void drawFigure(float baseX, float baseY) {
    fill(150, 50, 50);
    ellipse(baseX + offsetX, baseY + offsetY, d, d);
  }
  void judge(float baseX, float baseY) {
    if (sqrt(pow(mouseX - baseX + offsetX, 2)+pow(mouseY - baseY + offsetY, 2))<d/2) {
      count=true;
      isShaking=true;
    }
  }
}

/** 頭 */
class Head {
  float d;                 // 頭の直径
  float offsetX;           // 体の中心からのx方向のoffset
  float offsetY;           // 体の中心からのy方向のoffset
  float shakingOffset = 1;
  float shCo = 1;
  float shCoCo = 1;
  Head(float d, float offsetX, float offsetY) {
    this.d = d;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
  }
  /** 頭頂のy座標を返す */
  float getTopY(float baseY) {
    return baseY + offsetY - d / 2;
  }
  void drawFigure(float baseX, float baseY) {
    if (sqrt(pow(mouseX - (baseX + offsetX), 2)+pow(mouseY - (baseY + offsetY), 2))<d/2) {
      count=true;
      isShaking = true;
    }
    fill(50, 50, 70);
    if (isShaking) {
      offsetX += shakingOffset ;
      shCo+=shCoCo;
      if (shCo>4) {
        shakingOffset*=-1;
        shCoCo*=-1;
      } else if (shCo<-4) {
        shakingOffset*=-1;
        shCoCo*=-1;
      }
    }
    ellipse(baseX + offsetX, baseY + offsetY, d, d);
  }
}

class Foot {
  float d;
  float offsetX;
  float offsetY;
  Foot(float d, float offsetX, float offsetY) {
    this.d = d;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
  }
  void drawFigure(float baseX, float baseY) {
    if (sqrt(pow(mouseX - (baseX + offsetX), 2)+pow(mouseY - (baseY + offsetY), 2))<d/2) {
      count=true;
      isShaking = true;
    }
    if (sqrt(pow(mouseX - (baseX - offsetX), 2)+pow(mouseY - (baseY + offsetY), 2))<d/2) {
      count=true;
      isShaking = true;
    }
    if (sqrt(pow(mouseX - (baseX + offsetX), 2)+pow(mouseY - (baseY - offsetY), 2))<d/2) {
      count=true;
      isShaking = true;
    }
    if (sqrt(pow(mouseX - (baseX - offsetX), 2)+pow(mouseY - (baseY - offsetY), 2))<d/2) {
      count=true;
      isShaking = true;
    }
    fill(50, 50, 70);
    ellipse(baseX + offsetX, baseY + offsetY, d, d);
    ellipse(baseX - offsetX, baseY + offsetY, d, d);
    ellipse(baseX + offsetX*0.7, baseY - offsetY*1.2, d, d);
    ellipse(baseX - offsetX*0.7, baseY - offsetY*1.2, d, d);
  }
}