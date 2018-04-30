// constant
final float gravity = 9.8 / 60;
final int fps = 60;
final int d = 40;
final int x0 =d/2;
final int y0 =d/2;
final int vx0 = 2;
final int vy0 = 2;
final float elas = 0.98;
final int num = 6;

//変数
Ball[] balls = new Ball[6];

void setup() {
  size(480, 480);
  noStroke();
  fill(0, 0, 0);
  frameRate(fps);
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
  for (int i = 0; i < num; i++) {
    balls[i].X = random(d / 2, width - d / 2);
    balls[i].Y = random(d / 2, height - d / 2);
    balls[i].VX = random(1, 10);
    balls[i].VY = random(1, 15);
  }
}

void draw() {
  background(0, 0, 100);
  for (int i = 0; i < num; i++) {
    boundBalls(i, balls);
    fill(calcHue(balls[i].VX, balls[i].VY), 100, 100);
    ellipse(balls[i].X, balls[i].Y, d, d);
  }
}

void boundBalls(int i, Ball[] balls) {
  balls[i].VY += gravity;
  balls[i].X += balls[i].VX;
  balls[i].Y += balls[i].VY;

  if (balls[i].Y > height - d / 2) {
    balls[i].VY *=  -1*elas;
    balls[i].Y = height - d / 2;
  }
  if (balls[i].X < d / 2) {
    balls[i].VX *= -1*elas;
    balls[i].X = d / 2;
  } else if (balls[i].X > width - d / 2) {
    balls[i].VX *= -1*elas;
    balls[i].X = width - d / 2;
  }
}

float calcHue(float vx, float vy) {
  return (360 * sqrt(vx*vx+vy*vy) / 13);
}

class Ball {
  float X;
  float Y;
  float VX;
  float VY;
}