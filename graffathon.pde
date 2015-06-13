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
    double bg_green = moonlander.getValue("background_green");
    cam.rotateX(radians((float)bg_green));
    drawAxis();
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

