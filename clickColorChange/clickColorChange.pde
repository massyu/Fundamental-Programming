void setup() {
  size(480, 480);
  smooth();
  noStroke();
  smooth();
  fill(128, 128, 128);
  background(255, 255, 255);
  rect(20, 20, 200, 100);
  ellipse(320, 320, 100, 100);
}

void draw() {
  fill(128, 128, 128);
  if (mouseX>=20 && mouseY>=20 && mouseX<=220 && mouseY<=120 && mousePressed)
    fill(255, 0, 255);
  rect(20, 20, 200, 100);

  fill(128, 128, 128);
  if ((mouseX-320)*(mouseX-320) + (mouseY-320)*(mouseY-320) <= 50*50 && mousePressed)
    fill(255, 255, 0);
  ellipse(320, 320, 100, 100);
}