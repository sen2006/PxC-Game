class Object {

  ArrayList<Object> objectList;
  
  int objectX;
  int objectY;
  int objectWidth;
  int objectHeight;
  
  Object (ArrayList<Object> nList) {
    objectList = nList;
  }

  Object(int x, int y, int w, int h) {
    objectX = x;
    objectY = y;
    objectWidth = w;
    objectHeight = h;
  }

  void draw() {
    fill(0, 255, 0);
    rectMode(CENTER);
    rect(objectX, objectY, objectWidth, objectHeight);
  }
}
