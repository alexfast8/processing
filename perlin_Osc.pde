import processing.sound.*; 
SinOsc sine;
PImage shiffman, shiffmantwo, shiffmanthree, shiffmanfour;
float t = 3; 

PImage [] photos = new PImage[4];
Walker w; 
float xoff; 

 
void setup(){
 size(640, 360); 
 background(0); 
 w = new Walker();
 sine = new SinOsc(this);
 photos[0] = loadImage("shiffman.jpg"); 
 photos[1] = loadImage("shiffmantwo.jpg"); 
 photos[2] = loadImage("shiffmanthree.jpg"); 
 photos[3] = loadImage("shiffmanfour.jpg"); 
}

void draw(){

 w.step();
 w.display();
}

class Walker{
 int x,y;
 
 Walker(){
   x = width/2;
   y = height/2;
 }
 
void display(){
 stroke(255);
 point(x, y); 
}
 
void step(){
  float choice = map(noise(xoff),0,1,0,width);
  float sound =  map(noise(t), 0, 1, 0, 1); 
  xoff += 0.75; 
  t += 0.9; 
  println("choice" + choice); 
  println("sound" + sound); 
  if(choice > 512){
   x++;
   clear();
  } else if(choice >384) {
   x--;  
   clear(); 
  } else if(choice > 256){
   y++;
   clear();
  } else if (choice > 128){
   y--; 
  } else {
    sine.play();
    sine.freq(100);
    sine.amp(sound); 
    int index = int(random(0, photos.length)); 
    image(photos[index],50,50,550,280); 
}
  if(x > width || x < 0 || y > height || y < 0){
    w = new Walker(); 
  }
  }
}
  