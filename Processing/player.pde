class Player {
  boolean outsideWalkable = false;

  PImage sprite;
  float x;
  float y;

  float moveX;
  float moveY;

  float walkspeed = 0.04;

  float angle = 0;

  Player(float startX, float startY) {
    x = startX;
    y = startY;
    moveX = x;
    moveY = y;
  }

  //gets called every frame
  void update() {
    //check if player is outside walkable area
    if (stateHandler.getState() instanceof Scene) {
      Scene scene = (Scene)stateHandler.getState();
      if (!scene.getWalkableArea().isPointInside((int)x, (int)y)) {
        if (!outsideWalkable) {
          moveTo(x + cos(angle+PI) * 10, y + sin(angle+PI) * 10);
          outsideWalkable = true;
        } else {
          moveTo(x + cos(angle) * 10, y + sin(angle) * 10);
          outsideWalkable = true;
        }
      } else {
        outsideWalkable = false;
      }
    }

    x=lerp(x, moveX, walkspeed);
    y=lerp(y, moveY, walkspeed);
    fill(150);
    ellipse(x, y, 50, 50);

    translate(x, y);
    rotate(angle);
    strokeWeight(4);
    line(0, 0, 25, 0);
    resetMatrix();
  }

  void handleMousePressed() {
    // check if point is inside the walkable area
    if (!outsideWalkable && stateHandler.getState() instanceof Scene) {
      Scene scene = (Scene)stateHandler.getState();
      WalkableArea area = scene.getWalkableArea();
      if (area.isPointInside(mouseX, mouseY)) {
        moveTo(mouseX, mouseY);
      }
    }
  }

  //check if player is inside a rect
  boolean isOn(int px, int py, int w, int h) {
    return isPointInRectangle( x, y, px, py, w, h );
  }

  void moveTo(float px, float py) {
    moveX=px;
    moveY=py;

    float dx=moveX-x;
    float dy=moveY-y;
    angle = atan2(dy, dx);
  }

  //debug rendering
  void debug() {
    strokeWeight(2);
    stroke(0);
    line(x, y, moveX, moveY);
  }
}
