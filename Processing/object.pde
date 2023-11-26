class Object {


  boolean collected = false;

  int objectX;
  int objectY;

  boolean hideOnCollect;
  boolean addToInvOnCollect;

  String filename;
  PImage sprite;

  String keyString;


  // constructor for variable hide and variable add to inventory
  Object(int x, int y, boolean hideWhenCollected, boolean addToInv, String keyS, String newFilename) {
    objectX = x;
    objectY = y;
    hideOnCollect = hideWhenCollected;
    addToInvOnCollect = addToInv;
    keyString = keyS;
    filename = newFilename;
  }

  // constructor for never hide and never add to inventory
  Object(int x, int y, String keyS, String newFilename) {
    objectX = x;
    objectY = y;
    hideOnCollect = false;
    addToInvOnCollect = false;
    keyString = keyS;
    filename = newFilename;
  }

  // constructor for always hide and variable variable to inventory
  Object(int x, int y, boolean addToInv, String keyS, String newFilename) {
    objectX = x;
    objectY = y;
    hideOnCollect = true;
    addToInvOnCollect = addToInv;
    keyString = keyS;
    filename = newFilename;
  }

  //eevery frame when : scene is loaded or item is in inventory
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

  //set object position
  void setPos(int newX, int newY) {
    objectX = newX;
    objectY = newY;
  }

  //get the key code string
  String getKeyString() {
    return keyString;
  }

  //get the filename for the immage
  String getFilename() {
    return filename;
  }

  //see if item has been clicked (always false in inv, use keycode for this)
  boolean getCollected() {
    return collected;
  }

  //get if the item should be moved to inv when collected
  boolean shouldMoveToInv() {
    return addToInvOnCollect;
  }

  //check if the player is close enough and if the mouse is on the object
  void checkCol() {
    float distance = dist(objectX+sprite.height/2, objectY+sprite.width/2, player.getX(), player.getY());
    if (isPointInRectangle(mouseX, mouseY, objectX, objectY, sprite.height, sprite.width) && distance < player.getInteractionRadius()) {
      collected = true;
    }
  }
}

class TogleableObject extends Object {
  TogleableObject(int x, int y, String keyS, String newFilename) {
    super(x, y, keyS, newFilename);
  }

  void checkCol() {
    float distance = dist(objectX+sprite.height/2, objectY+sprite.width/2, player.getX(), player.getY());
    if (isPointInRectangle(mouseX, mouseY, objectX, objectY, sprite.height, sprite.width) && distance < player.getInteractionRadius()) {
      collected = !collected;
    }
  }
}

//class HighlightObject extends Object {
//  color hColor;

//  HighlightObject(int x, int y, boolean hideWhenCollected, boolean addToInv, String keyS, String newFilename, color hilightColor) {
//    super(x, y, hideWhenCollected, addToInv, keyS, newFilename);
//    hColor = hilightColor;
//  }

//  HighlightObject(int x, int y, String keyS, String newFilename, color hilightColor) {
//    super(x, y, keyS, newFilename);
//    hColor = hilightColor;
//  }

//  HighlightObject(int x, int y, boolean addToInv, String keyS, String newFilename, color hilightColor) {
//    super(x, y, addToInv, keyS, newFilename);
//    hColor = hilightColor;
//  }

//  void draw() {
//    super.draw();
//    float distance = dist(objectX+sprite.height/2, objectY+sprite.width/2, player.getX(), player.getY());
//    if (isPointInRectangle(mouseX, mouseY, objectX, objectY, sprite.height, sprite.width) && distance < player.getInteractionRadius()) {
//      noFill();
//      strokeWeight(3);
//      stroke(hColor, 205+ (50*sin(millis()/500f)));
//      rect(objectX, objectY, sprite.height, sprite.width);
//    }
//  }
//}

//class HighlightTogleableObject extends TogleableObject {
//  color hColor;
//  HighlightTogleableObject(int x, int y, String keyS, String newFilename, color hilightColor) {
//    super(x, y, keyS, newFilename);
//    hColor = hilightColor;
//  }

//  void checkCol() {
//    float distance = dist(objectX+sprite.height/2, objectY+sprite.width/2, player.getX(), player.getY());
//    if (isPointInRectangle(mouseX, mouseY, objectX, objectY, sprite.height, sprite.width) && distance < player.getInteractionRadius()) {
//      collected = !collected;
//    }
//  }

//  void draw() {
//    super.draw();
//    float distance = dist(objectX+sprite.height/2, objectY+sprite.width/2, player.getX(), player.getY());
//    if (isPointInRectangle(mouseX, mouseY, objectX, objectY, sprite.height, sprite.width) && distance < player.getInteractionRadius()) {
//      noFill();
//      strokeWeight(3);
//      stroke(hColor, 205+ (50*sin(millis()/500f)));
//      rect(objectX, objectY, sprite.height, sprite.width);
//    }
//  }
//}
