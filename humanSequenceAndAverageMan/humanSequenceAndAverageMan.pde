size(450, 400);             
background(255, 255, 255); 
noStroke();                 

int x = 50;                
int y = 300;             
int dx = 50;               
int[] h;                    
int w = 20;                
int d = 30;     
int sum = 0;
float aver;
h = new int[] {145, 186, 176, 168, 186, 156, 172};

fill(0, 0, 0);
for (int i = 0; i < h.length; i++) {
  ellipse(x, y - h[i], d, d);            
  rect(x - w / 2, y - h[i], w, h[i]);   
  x = x + dx;
  fill(0,0,0);
  sum += h[i]; 
}

aver = sum/h.length;
fill(0,255,0);
ellipse(x,y-aver,d,d);
rect(x-w/2,y-aver,w,aver);

