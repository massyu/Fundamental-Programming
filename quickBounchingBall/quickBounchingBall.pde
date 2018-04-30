float x;
float y; 
float xSpeed;
float ySpeed;       
float gravity;   

void setup() {
  x = 0;
  y = 480;
  xSpeed = 3;
  ySpeed = -12;
  gravity = 9.8 / 60; 
  size(480, 520);
  noStroke();
  smooth();
  fill(0, 0, 0);
}

void draw() {
  if (x>=460) {
    xSpeed = xSpeed * -1.1;
    x=460;
  }
  if (y>=500) {
    ySpeed = ySpeed * -1.1;
    y=500;
  }
  if (x<0) {
    xSpeed = xSpeed * -1.1;
    x=0;
  }
  if (y<=0) {
    ySpeed = ySpeed * -1.1;
    y=0;
  }
  ySpeed += gravity;  
  y += ySpeed;
  x += xSpeed; 
  background(255, 255, 255);
  ellipse(x, y, 40, 40);
}