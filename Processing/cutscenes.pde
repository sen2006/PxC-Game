class BeginingCutScene extends CutScene {
  BeginingCutScene() {
    super(VIDEOSCENE);
    frames.add(new CutSceneFrame(2000000, "sprite/ui/Illustration_menu.png"));
  }
}

class EndingCutSceneGood extends CutScene {
  EndingCutSceneGood() {
    super(FIRST_CUTSCENE);
    frames.add(new CutSceneFrame(2000, "sprite/ui/goodEndWithoutText.jpg"));
  }
}

class EndingCutSceneBad extends CutScene {
  EndingCutSceneBad() {
    super(FIRST_CUTSCENE);
    frames.add(new CutSceneFrame(2000, "sprite/ui/Bad_ending_newspaper.png"));
  }
}

class VideoCutSceneOne extends VideoCutScene {
  VideoCutSceneOne(){
    super(ENTRANCE, "video/cutscene/cutscene1.mp4");
  }
}
