import moonlander.library.*;
import peasy.*;

// Minim must be imported when using Moonlander with soundtrack.
import ddf.minim.*;

Moonlander moonlander;
//cam-object, that moves the camera
PeasyCam cam;

void setup() {
    // Parameters: 
    // - PApplet
    // - soundtrack filename (relative to sketch's folder)
    // - beats per minute in the song
    // - how many rows in Rocket correspond to one beat
    moonlander = Moonlander.initWithSoundtrack(this, "Dreamland original Mix By Decepticons (FREE Creative Commons Music Allowed For Reuse & Monetization).mp3", 127, 8);

    // Other initialization code goes here.
    size(800, 800, P3D);
    frameRate(60); 
    background(0);



    cam = new PeasyCam(this, 0, 200, 0, 1000);
  //cam.rotateX(radians(20));
  //cam.setActive(false);
    cam.setMaximumDistance(500);

    // Last thing in setup; start Moonlander. This either
    // connects to Rocket (development mode) or loads data 
    // from 'syncdata.rocket' (player mode).
    // Also, in player mode the music playback starts immediately.
    moonlander.start();
}

void draw() {
    background(0);
    // Handles communication with Rocket. In player mode
    // does nothing. Must be called at the beginning of draw().
    moonlander.update();

    // This shows how you can query value of a track.
    // If track doesn't exist in Rocket, it's automatically
    // created.
    double treeLenDelta = moonlander.getValue("treeLenDelta");
    double suchFractals = moonlander.getValue("suchFractals");
    //cam.rotateX(radians((float)bg_green));
    drawAxis();
    drawFractalTree(treeLenDelta, suchFractals);
}


int unit = 4;
float treeLen = 1;
void drawFractalTree(double treeLenDelta, double suchFractals) {
  
    background(255);
    stroke(0);
    float asd = (float)treeLenDelta;
    int fractalAmount = (int)suchFractals;
    treeLen = treeLen + (float)treeLenDelta;
    println(treeLen);
    
    //trunk line
    line(0.0, 0.0, 0.0, 0.0, treeLen, 0.0);
    
    //branches
    if(treeLen > unit){
      branch(treeLen, new BranchingPoint(0.0, treeLen, 0.0));
    }
}

void branch(float ticker, BranchingPoint bp){
  if(ticker < unit*2){
    line(bp.x, bp.y, bp.z, bp.x + ticker, bp.y, bp.z);
    line(bp.x, bp.y, bp.z, bp.x - ticker, bp.y, bp.z);
  }
  else{
    line(bp.x, bp.y, bp.z, bp.x + unit*2, bp.y, bp.z);
    line(bp.x, bp.y, bp.z, bp.x - unit*2, bp.y, bp.z);

    line(bp.x + unit*2, bp.y, bp.z, bp.x + unit*2, bp.y + ticker, bp.z);
    line(bp.x - unit*2, bp.y, bp.z, bp.x - unit*2, bp.y + ticker, bp.z);
  }
}

class BranchingPoint{
  float x, y, z;
  BranchingPoint(float x1, float y1, float z1){
    x = x1; y = y1; z = z1;
  }
}

void drawAxis(){
  //x-axis 
  stroke(190);
  line(0, 100, 0, 0, 0, 0);
  //y-axis
  stroke(180);
  line(0,0,0,100,0,0);
  //z-axis
  stroke(250);
  line(0,0,0,0,0,100);
}

