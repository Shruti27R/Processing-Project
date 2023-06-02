PImage img;

void setup() {
  img = loadImage("lotus.jpeg");
  size (732,549);
  noStroke();
  img.loadPixels();
  
  color pink = color(217, 106, 136);
  color green = color(115, 163, 47);
  color blue = color(2, 82, 168);
  color ltpink = color(252, 194, 239);
  
  int t1=60;
  int t2=160;
  int t3=200;
  int pixelSize = 1;
  
   for( int x=0; x<img.width; x+=pixelSize) {
    for ( int y=0; y<img.height; y+=pixelSize) {
      int i = y * img.width + x;
      color c = img.pixels[i];
      int b = (int)brightness(c);
      if (b >=0 && b<t1) { //leaf
       fill(green);
        circle (x,y,2);
      } else if (b >= t1 && b< t2) { //pond
      
      fill(blue);
      circle (x,y,2);
      } else if (b>=t2 && b<t3) {//flower
        
        fill(pink);
        circle(x,y,2);
      } else if (b>=t3) {
        
        fill(ltpink);
        circle(x,y,2);
      } 
      }
    }  
  }
