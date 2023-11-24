class Door {

  int doorX;
  int doorY;
  int doorWidth;
  int doorHeight;
  State tDoor;
  int teleportX;
  int teleportY;

  Door(int x, int y, int w, int h, State tD, int tX, int tY) {
    doorX = x;
    doorY = y;
    doorWidth = w;
    doorHeight = h;
    tDoor = tD;
    teleportX = tX;
    teleportY = tY;
  }
  void Draw() {
    push();
    fill(0, 255, 255);
    rectMode(CORNER);
    rect(doorX, doorY, doorWidth, doorHeight);
    pop();
  }

  void debug() {
    rectMode(CORNER);
    strokeWeight(2);
    stroke(50);
    fill(#23F524, 50);
    rect(doorX, doorY, doorWidth, doorHeight);
    if (tDoor == null) {
      println("error door state is null");
    }
  }
  void isPlayerOnDoor() {
    if ( isPointInRectangle (player.getX(), player.getY(), doorX, doorY, doorWidth, doorHeight)) {
      stateHandler.changeStateTo(tDoor);
      player.teleport(teleportX, teleportY);
    }
  }
}
