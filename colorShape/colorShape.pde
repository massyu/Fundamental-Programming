int r = 150;      
int theta;          
int dTheta = 5;     
float rad;            
int d = 8;            
int p = -10;
float x, y;   
float cor = 0;

void setup() {
  size(400, 400);
  noStroke();
  background(255, 255, 255);
  fill(0, 0, 0);
  theta = 0;
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  rad = radians(theta);
  x = r * cos(rad);
  y = -r * sin(rad);
  fill(cor, 100, 100);
  ellipse(x + 200, y + 200, d, d);    
  theta = theta + dTheta;
  cor += 2;
  if (cor>360)
    cor = 0;
  r+=p;
  if (r<0)
    p*=-1;
  if (r>150)
    p*=-1;
}

