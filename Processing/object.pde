class Object {


  boolean collected = false;

  int objectX;
  int objectY;
  
  boolean hideOnCollect;
  boolean addToInvOnCollect;
  
  String filename;
  PImage sprite;
  
  String keyString;

  Object(int x, int y, boolean hideWhenCollected, boolean addToInv, String keyS, String newFilename) {
    objectX = x;
    objectY = y;
    hideOnCollect = hideWhenCollected;
    addToInvOnCollect = addToInv;
    keyString = keyS;
    filename = newFilename;
  }

  void draw() {
    if (sprite == null) {
       sprite = loadImage(dataPath(filename));
    }
    fill(0, 255, 0);
    rectMode(CORNER);
    if (!hideOnCollect || !collected) {
      image(sprite, objectX, objectY);
    }
  }
  
  void setPos(int newX, int newY) {
    objectX = newX;
    objectY = newY;
  }
  
  String getKeyString() {
    return keyString;
  }
  
  String getFilename() {
    return filename; 
  }
  
  boolean getCollected() {
    return collected;
  }
  
  boolean shouldMoveToInv() {
    return addToInvOnCollect;
  }
  
  void checkCol() {
    float distance = dist(objectX+sprite.height/2, objectY+sprite.width/2, player.getX(), player.getY());
    if (isPointInRectangle(mouseX, mouseY, objectX, objectY, sprite.height, sprite.width) && distance < player.getInteractionRadius()) {
      collected = true;
    }
  }
}
