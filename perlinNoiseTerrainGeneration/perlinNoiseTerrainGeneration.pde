int cols, rows;
int scl = 20;
int w = 1600;
int h = 1200;
float flying = 0.0;
float [][] terrain;  
void setup() {
  size(600, 600, P3D);
  cols = w / scl;
  rows = h / scl;
  
}

void draw() {
  flying -=0.01;
  terrain = new float[cols][rows];
  
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff + flying), 0, 1, -25, 25);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  
  background(0);
  //stroke(255);
  //noFill();
  PImage img = loadImage("laDefense.jpg");

    translate(width/2, height/2);

  rotateX(0.2);
  translate(-w/3, -h/3);

  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    texture(img);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y + 1]);

    }
    endShape(TRIANGLE_STRIP);
  }
}
