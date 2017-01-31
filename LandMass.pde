float p = 0.1; 

void setup(){
 size(700,700);  
}

void draw(){
loadPixels();
float xoff = 0.2; 

for(int x = 0; x < width; x++){
  float yoff = 0.25; 
  for (int y = 0; y < height; y++){
    float bright = map(noise(xoff,yoff), 0,1,0,255); 
    pixels[x+y * width] = color(bright*2,random(255),random(255)); 
    yoff += 0.01 * p;
  }
  xoff += 0.01 * p; 
}
updatePixels(); 
}

void mousePressed(){
 p++;  
 if (p > 50) {
  p*= -1;  
 }
}