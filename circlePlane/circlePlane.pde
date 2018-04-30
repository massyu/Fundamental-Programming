size(400, 400);
background(255, 255, 255);
noStroke();
fill(0, 0, 0);
int x=30;
int y=30;
int dx=30;
int d=3;
int dd=2;
int n=12;

for (int a=0; a<n; a++) {
  for (int i=0; i<n; i++) {
    ellipse(x, y, d, d);
    x+=dx;
    d+=dd;
  }
  x=30;
  d=3;
  y+=30;
}

