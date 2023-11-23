class CutScene extends State {
  ArrayList<CutSceneFrame> frames;
  State endState;
  CutScene (State newEndState) {
    frames = new ArrayList<CutSceneFrame>();
    endState = newEndState;
  }

  public void doStepWhileInState() {
    if (frames.size() >0) {
      CutSceneFrame frame = frames.get(0);
      PImage sprite = loadImage(dataPath(frame.getFilename()));
      image(sprite, 0, 0);
      noStroke();
      fill(0,max(0, 255f-frame.getScreenTimeLeft()/2)+max(0, 255f-(frame.getMaxTime()-frame.getScreenTimeLeft())/2));
      rect(0,0,width,height);
      frame.decreaseTimer ();
      if (frame.getScreenTimeLeft() <= 0) {
        frames.remove(0);
      }
    } else {
       stateHandler.changeStateTo(endState);
    }
  }
}

class CutSceneFrame {
  int screenTimeMS;
  int totalTime;
  String filename;
  CutSceneFrame(int time, String newFilename) {
    screenTimeMS = time;
    totalTime = time;
    filename = newFilename;
  }

  int getScreenTimeLeft() {
    return screenTimeMS;
  }
  
  int getMaxTime() {
    return totalTime;
  }

  void decreaseTimer () {
    screenTimeMS-=deltaTime;
  }

  String getFilename() {
    return filename;
  }
}
