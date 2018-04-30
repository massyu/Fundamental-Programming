size(825, 675);
smooth();
background(200,200,100);
int x, y;

for (x = 0; x <= 800; x = x + 150) {
  for (y = 0; y <= 600; y = y + 150) {
    fill(255, 0, 0);
    rect(x, y, 25, 25);
    rect(x+75, y+75, 25, 25);
    fill(0, 255, 0);   
    rect(x+50, y, 25, 25);
    rect(x+125, y+75, 25, 25);
    fill(0, 0, 255);
    rect(x, y+50, 25, 25);
    rect(x+75, y+125, 25, 25);
    fill(125, 125, 0);
    rect(x+50, y+50, 25, 25);
    rect(x+125, y+125, 25, 25);
    fill(0, 125, 125);
    rect(x+25, y+25, 25, 25);
    rect(x+100, y+100, 25, 25);
  }
}

