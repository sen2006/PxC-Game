class CutScene extends State {
  PImage sprite;
  ArrayList<CutSceneFrame> frames;
  State endState;
  CutScene (State newEndState) {
    frames = new ArrayList<CutSceneFrame>();
    endState = newEndState;
  }

  public void doStepWhileInState() {
    if (frames.size() >0) {
      CutSceneFrame frame = frames.get(0);
      if (sprite == null) {
        sprite = loadImage(dataPath(frame.getFilename()));
      }
      image(sprite, 0, 0);
      noStroke();
      fill(0, max(0, 255f-frame.getScreenTimeLeft()/2)+max(0, 255f-(frame.getMaxTime()-frame.getScreenTimeLeft())/2));
      rect(0, 0, width, height);
      frame.decreaseTimer ();
      if (frame.getScreenTimeLeft() <= 0) {
        frames.remove(0);
        sprite = null;
      }
    } else {
      stateHandler.changeStateTo(endState);
    }
  }

  public void handleMousePressed() {
    if (frames.size()>0) {
      frames.remove(0);
    }
  }
}


class VideoCutScene extends State {
  String filename;
  Movie video;
  State endState;
  boolean played = false;
  VideoCutScene(State newEndState, String newFilename) {
    endState = newEndState;
    filename = newFilename;
  }

  public void doStepWhileInState() {
    if (video==null) {
      video = new Movie(main.this, dataPath(filename));
    }
    if (!played && !video.isPlaying()) {
      video.play();
      played = true;
    } else if (played && !video.isPlaying()) {
      stateHandler.changeStateTo(endState);
    }
    if (video.available()) {
      background(0);
      video.read();
      image(video, width/2-video.width/2, height/2-video.height/2);
    }
  }

  public void handleMousePressed() {
    stateHandler.changeStateTo(endState);
  }

  void loadVideo() {
    if (video==null) {
      video = new Movie(main.this, dataPath(filename));
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
