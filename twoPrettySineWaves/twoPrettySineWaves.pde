import gifAnimation.*;

GifMaker gifExport;
int frames = 0;
int totalFrames = 120;

int xspacing = 5;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 40.5;  // Height of wave
float period = 250.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(400, 400);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.05;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  //noStroke();
  fill(0);
  background(19, 48, 70);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    float firstLineHeight = height/ 2.5 + yvalues[x];
    float secondLineHeight = height / 2.5 +yvalues[x];
    stroke(x * 3, 150, 166+x);

    fill(255);
    line(x * xspacing, secondLineHeight, height / 2, 0);
    //line(x * xspacing, firstLineHeight, width, height);
    //ellipse(x*xspacing, firstLineHeight, 2, 2);
    //line(x * xspacing, secondLineHeight, width, 0);
    //line(x * xspacing, secondLineHeight, 0, 0);
    
    line(x * xspacing, firstLineHeight, 0, 800);
    line(x * xspacing, secondLineHeight, width, 800);

    //ellipse(x*xspacing, secondLineHeight, 2,2);
  }
}
