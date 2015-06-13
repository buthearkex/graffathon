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
    moonlander = Moonlander.initWithSoundtrack(this, "../common/tekno_127bpm.mp3", 127, 8);

    // Other initialization code goes here.
    size(800, 800, P3D);
      frameRate(60); 
noFill();
background(0);
stroke(255);
camera(10.0, 10.0, 10.0, 0.0, 0.0, 0.0, 
       0.0, 1.0, 0.0);
       drawAxis();
box(10);

  cam = new PeasyCam(this, 0, 200, 0, 1000);
  //cam.rotateX(radians(20));
  //cam.setActive(false);
    cam.setMaximumDistance(1000);

    // Last thing in setup; start Moonlander. This either
    // connects to Rocket (development mode) or loads data 
    // from 'syncdata.rocket' (player mode).
    // Also, in player mode the music playback starts immediately.
    moonlander.start();
}

void draw() {
    
    // Handles communication with Rocket. In player mode
    // does nothing. Must be called at the beginning of draw().
    moonlander.update();

    // This shows how you can query value of a track.
    // If track doesn't exist in Rocket, it's automatically
    // created.
    double bg_red = moonlander.getValue("background_red");
    
    drawAxis();
}


void drawAxis(){
  //x-axis 
  stroke(90);
  line(0, 100, 0, 0, 0, 0);
  //y-axis
  stroke(180);
  line(0,0,0,100,0,0);
  //z-axis
  stroke(250);
  line(0,0,0,0,100,0);
}

