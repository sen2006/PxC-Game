class Scene extends State
{
  PImage background;
  String filename;
  WalkableArea walkableArea; 

  Scene( String backgroundFilename, WalkableArea area) {
    filename = backgroundFilename;
    walkableArea = area;
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
  }
}
