// constant
final float gravity = 9.8 / 60;
final int fps = 60;
final int d = 40;
final int x0 =d/2;
final int y0 =d/2;
final int vx0 = 2;
final int vy0 = 2;
final float elas = 0.98;
final int num = (int)random(2, 10);
final int X = 0;
final int Y = 1;
final int VX = 2;
final int VY = 3;
//変数
float[][] balls = new float[num][4];
void setup() {
  size(480, 480);
  noStroke();
  fill(0, 0, 0);
  frameRate(fps);
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < num; i++) {
    balls[i][X] = random(d / 2, width - d / 2);
    balls[i][Y] = random(d / 2, height - d / 2);
    balls[i][VX] = random(1, 10);
    balls[i][VY] = random(1, 15);
  }
}

void draw() {
  background(0, 0, 100);

  for (int i = 0; i < num; i++) {
    balls[i] = boundBalls(balls[i]);
    fill(calcHue(balls[i][VX], balls[i][VY]), 100, 100);
    ellipse(balls[i][X], balls[i][Y], d, d);
  }
}

float[] boundBalls(float[] balls) {
  balls[VY] += gravity;
  balls[X] += balls[VX];
  balls[Y] += balls[VY];

  if (balls[Y] > height - d / 2) {
    balls[VY] *=  -1*elas;
    balls[Y] = height - d / 2;
  }
  if (balls[X] < d / 2) {
    balls[VX] *= -1*elas;
    balls[X] = d / 2;
  } else if (balls[X] > width - d / 2) {
    balls[VX] *= -1*elas;
    balls[X] = width - d / 2;
  }

  return balls;
}

float calcHue(float vx, float vy) {
  return (360 * sqrt(vx*vx+vy*vy) / 13);
}