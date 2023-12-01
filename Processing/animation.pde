// Class for animating a sequence of GIFs

//stolen fom google :P

class Animation {
  PImage[] images;
  int imageCount;
  int animatinTimePerFrame;
  int frame;
  int time;

  Animation(String imagePrefix, int count, int timePerFrame) {
    imageCount = count;
    animatinTimePerFrame = timePerFrame;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i+1, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    if (time>=animatinTimePerFrame) {
      frame = (frame+1) % imageCount;
      time=0;
    }
    time+=deltaTime;
    image(images[frame], xpos, ypos,images[frame].width/4,images[frame].height/4);
  }
  
   void displayOne(float xpos, float ypos) {
    image(images[0], xpos, ypos,images[0].width/4,images[0].height/4);
  }

  int getWidth() {
    return images[0].width;
  }
}
