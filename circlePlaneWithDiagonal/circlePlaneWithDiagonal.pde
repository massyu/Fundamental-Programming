size(400, 400);
background(255, 255, 255);
fill(0, 0, 255);
noStroke();
int x=30;
int y=30;
int dx=30;
int d=3;
int dd=2;
int n=12;

for (int a=0; a<n; a++) {
  for (int i=0; i<n; i++) {
    if (i==a) {
      fill(255, 0, 0);
    } else {
      fill(0, 0, 255);
    }
    ellipse(x, y, d, d);
    x+=dx;
    d+=dd;
  }
  x=30;
  d=3;
  y+=30;
}

