int x, y;
int speed=5;
float xSpeed, ySpeed;
float ballX, ballY;
void setup() {
  //――――――――――――――――――――――――――――――
  size(500, 600);
  x=width/2;
  y=height-90;
  xSpeed = 3;
  ySpeed = -3;
  ballX = width/2;
  ballY = height/2;
  background(255, 255, 255);
  fill(0, 0, 0);
  rect(x, y, 100, 10);
  //――――――――――――――――――――――――――――――
}

void draw() {
  if (ballX-20>x && ballX+20<x+100) {
    if (ballY+20>y){
      ySpeed = ySpeed * -1.1;
      speed = speed * 1.1;
    }
  }

  if (ballX>=480) {
    xSpeed = xSpeed * -1;
    ballX=480;
  }
  if (ballY>=580) {
    ySpeed = ySpeed * -1;
    ballY=580;
    ySpeed = -3;
    speed = 5;
  }
  if (ballX<=20) {
    xSpeed = xSpeed * -1;
    ballX=20;
  }
  if (ballY<=20) {
    ySpeed = ySpeed * -1;
    ballY=20;
  }

  //――――――――――――――――――――――――――――――
  if (keyPressed&&key==CODED) {
    if (keyCode == LEFT && x>0)
      x-=speed;
    if (keyCode== RIGHT && x<400)
      x+=speed;
  }
  ballY += ySpeed;
  ballX += xSpeed; 
  background(255, 255, 255);
  rect(x, y, 100, 10);
  ellipse(ballX, ballY, 40, 40);
  //――――――――――――――――――――――――――――――
}

