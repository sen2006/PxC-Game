class Player {
  Direction walkDirection;
  boolean outsideWalkable = false;

  int interactionRadius = 150;

  PImage sprite;
  float x;
  float y;

  float moveX;
  float moveY;

  float walkspeed = 4;

  float angle = 0;

  Player(float startX, float startY) {
    x = startX;
    y = startY;
    moveX = x;
    moveY = y;
  }

  //gets called every frame
  void update() {
    //check if state is a scene
    if (gameOver) {
      return;
    }
    if (stateHandler.getState() instanceof Scene) {
      setDirection();
      Scene scene = (Scene)stateHandler.getState();
      //check if player is outside walkable area
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
      // lerp to desired sertination
      move();

      switch (walkDirection) {
      case UP:
        break;
      case DOWN:
        break;
      case RIGHT:

        break;
      case LEFT:
        break;
      }

      // temporary player model
      stroke(0);
      strokeWeight(1);
      fill(150);
      ellipse(x, y, 50, 50);
      translate(x, y);
      rotate(angle);
      strokeWeight(4);
      stroke(0);
      line(0, 0, 25, 0);
      resetMatrix();
    }
  }

  void move() {
    PVector movePos = new PVector(moveX, moveY);

    movePos.sub(new PVector(x, y));
    movePos.normalize();
    movePos.mult(min(walkspeed*deltaTime/10f, dist(x, y, moveX, moveY)));

    x += movePos.x;
    y += movePos.y;
  }

  void setDirection() {
    if (angle>=(-PI/4)*3&&angle<(-PI/4)) {
      walkDirection = Direction.UP;
    } else if (angle>=(-PI/4)&&angle<(PI/4)) {
      walkDirection = Direction.RIGHT;
    } else if (angle>=(PI/4)&&angle<(PI/4)*3) {
      walkDirection = Direction.DOWN;
    } else {
      walkDirection = Direction.LEFT;
    }
    //println(walkDirection +" : " + angle);
  }

  void handleMousePressed() {
    // check if point is inside the walkable area
    if (!dialogueHandler.isPlaying() &&mouseButton == LEFT && !outsideWalkable && stateHandler.getState() instanceof Scene) {
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

  void teleport(float px, float py) {
    x = px;
    y = py;
    moveX=px;
    moveY=py;
  }

  int getInteractionRadius() {
    return interactionRadius;
  }

  float getX() {
    return x;
  }
  float getY() {
    return y;
  }

  float getMoveX() {
    return moveX;
  }
  float getMoveY() {
    return moveY;
  }

  //debug rendering
  void debug() {
    strokeWeight(2);
    stroke(0);
    line(x, y, moveX, moveY);

    color(#059EFA, 130);
    ellipse(x, y, 2*interactionRadius, 2*interactionRadius);
  }
}
