void setup() {
  size(480, 480);
  smooth();
  noStroke();
  smooth();
  fill(128, 128, 128, 128);
}

void draw() {
  background(255, 255, 255);

  /* fill in here */
  if (mouseX>=120 && mouseY>=120 && mouseX<=220 && mouseY<=220) {
    fill(0, 255, 255, 128);
  } else if (mouseX>=20 && mouseY>=20 && mouseX<=220 && mouseY<=220) {
    fill(255, 0, 0, 128);
  } else if (mouseX>120 && mouseY>120 && mouseX<=320 && mouseY<=320) {
    fill(0, 255, 0, 128);
  }  else {
    fill(128, 128, 128, 128);
  }
  rect(20, 20, 200, 200);
  rect(120, 120, 200, 200);
}