class Object {

  ArrayList<Object> objectList;
  object (ArrayList<Object> nList) {
    objectList = nList;
  }

  int objectX, objectY, objectWidth, objectHeight;

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
