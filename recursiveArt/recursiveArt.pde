int x0 = 0;       
int y0 = 200;           
int m0 = 10;
int a0 = 0;
void setup() {
  size(400, 400);
  noStroke();
  smooth();
  background(255, 255, 255);
  frameRate(10);
  fill(0, 0, 0);
  colorMode(HSB, 360, 100, 100);
  drawFigure(x0, y0, m0, a0);
}

void drawFigure(int x, int y, int m, int a) {
  fill(a, 100, 100);
  ellipse(x, y, m, m);
  ellipse(x, 400-y, m, m);
  ellipse(400-x, y, m, m);
  ellipse(400-x, 400-y, m, m);
  if (x<200)
    drawFigure(x+10, y+10, m, a+10);
}