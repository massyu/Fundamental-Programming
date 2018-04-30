float x, y; 
float xSpeed, ySpeed;       
float gravity;

void setup() {
  size(480, 520);
  x = width/2;
  y = height/2;
  xSpeed = 3;
  ySpeed = -3; 
  noStroke();
  smooth();
  background(255, 255, 255);
  fill(0, 0, 0);
}

void draw() {
  if (x>=460) {
    xSpeed = xSpeed * -1;
    x=460;
  }
  if (y>=500) {
    ySpeed = ySpeed * -1;
    y=500;
  }
  if (x<=20) {
    xSpeed = xSpeed * -1;
    x=20;
  }
  if (y<=20) {
    ySpeed = ySpeed * -1;
    y=20;
  }
  y += ySpeed;
  x += xSpeed; 
  background(255, 255, 255);
  ellipse(x, y, 40, 40);
}

