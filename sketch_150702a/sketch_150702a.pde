float x, y;
float speedX, speedY;
float g;
int i;

g = 9.8;
x = 0;
y = 0;
speedX=40;
speedY=0;

size(480, 540);
noStroke();
smooth();
fill(0,0,0);
background(255, 255, 255);

for (i=0; i<100; i++) {
  ellipse(x, y, 30, 30);
  speedY += g;
  x += speedX; 
  y += speedY;
  println("i=" + i + ": " + x + ", " + y);
  if(y>height)
  break;
}

