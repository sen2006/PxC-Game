class Scene extends State
{
  PImage background;
  String filename;
  ArrayList<Object> objects;
  ArrayList<Door> doorList;
  WalkableArea walkableArea;


  Scene( String backgroundFilename, WalkableArea area) {
    filename = backgroundFilename;
    walkableArea = area;
    doorList = new ArrayList<Door>();
    objects = new ArrayList<Object>();
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

    for (int i = objects.size()-1; i>=0; i--) {
      Object object = objects.get(i);
      if (object.getCollected() && object.shouldMoveToInv()) {
        inventory.add(new Object(0, 0, false, true, object.getKeyString(), object.getFilename()));
        objects.remove(i);
      }
    }


    if (debugMode) {
      for (Door door : doorList) {
        door.debug();
      }
    }
  }

  void handleMousePressed() {
    super.handleMousePressed();
    if (mouseButton == RIGHT) {
      for (Object object : objects) {
        object.checkCol();
      }
    }
  }
}
