class Player {
  PImage sprite;
  float x;
  float y;
  
  float moveX;
  float moveY;
  
  float walkspeed = 0.1;

  Player(float startX, float startY) {
    x = startX;
    y = startY;
    moveX = x;
    moveY = y;
  }
  
  void update() {
    x=lerp(x, moveX, walkspeed);
    y=lerp(y, moveY, walkspeed);
    fill(150);
    ellipse(x,y,50,50);
  }
  
  void handleMousePressed(Scene scene) {
    // check if point is inside the walkable area
    WalkableArea area = scene.getWalkableArea();
    if (area.isPointInside(mouseX, mouseY)) {
      moveTo(mouseX, mouseY);
    }
  }
  
  boolean isOn(int px, int py, int w, int h) {
    return isPointInRectangle( x, y, px, py, w, h );
  }
  
  void moveTo(float px, float py) {
    moveX=px;
    moveY=py;
  }
}
