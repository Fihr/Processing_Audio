import ddf.minim.*;
import ddf.minim.signals.*; 
import ddf.minim.analysis.*;


Minim minim;
FFT fft;
AudioPlayer mp3;

void setup()
{
   
  size(900,500,P3D);
  background(0);
  frameRate(60);
  
  minim = new Minim(this);
  mp3 = minim.loadFile("rick.mp3",2048);
  fft = new FFT(mp3.bufferSize(),mp3.sampleRate()); 
  mp3.loop();
}
void draw(){
  colorMode(RGB);
  rectMode(CENTER);
  fft.forward(mp3.mix); 
  for(int i = 0; i < fft.specSize(); i ++)
  {
    ellipse(width/2,height/2, i, height - fft.getFreq(i/2)*5); 

  }
}
 

