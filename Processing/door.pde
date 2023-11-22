class Door {

  int doorX;
  int doorY;
  int doorWidth;
  int doorHeight;

  Door(int x, int y, int w, int h) {
    doorX = x;
    doorY = y;
    doorWidth = w;
    doorHeight = h;
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
    fill(#23F524,50);
    rect(doorX,doorY,doorWidth,doorHeight);
  }
//  boolean isPlayerOnDoor(){
//  isPointInRectangle Player
//  }
}
