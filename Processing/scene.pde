class Scene extends State
{
  PImage background;
  String filename;
  WalkableArea walkableArea; 
ArrayList<Door>doorList;

  Scene( String backgroundFilename, WalkableArea area) {
    filename = backgroundFilename;
    walkableArea = area;
    doorList = new ArrayList<Door>();
  }

  void enterState( State oldState )
  {
    if ( background == null ) {
      background = loadImage(dataPath(filename));
    }
  }
  
  WalkableArea getWalkableArea() {
    return walkableArea; 
  }


  public void doStepWhileInState()
  {
    image( background, 0, 0, width, height );
    if(debugMode){
    for(Door door: doorList){
    door.debug();
    }
    }
  }
  
  /*
  int getWitdh() {
    return background.width;
  }
  int getHeight() {
    return background.height;
  }
  */
}
