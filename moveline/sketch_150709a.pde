int x=0,y=0;
char charx ='c';
char chary ='o';
void setup(){
size(800,400);
background(255,255,255);
fill(0,0,0);
}

void draw(){
if(keyPressed){
  if(key == charx){
    fill(0,0,0);
    line(x,y,x,y+400);
    x+=2;
  }else if(key == chary){
    fill(255,255,255);
    line(x,y,x,y+400);
    x-=2;
  }
}
}
