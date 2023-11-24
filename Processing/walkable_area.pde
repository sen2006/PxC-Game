class WalkableArea {
  ArrayList<WalkableSquare> squareList;

  WalkableArea(ArrayList<WalkableSquare> newList) {
    squareList = newList;
  }

  boolean isPointInside( int px, int py ) {
    for (WalkableSquare square : squareList) {
      if (square.isPointInside(px, py)) {
        return true;
      }
    }
    return false;
  }

  void add(WalkableSquare square) {
    squareList.add(square);
  }

  void render() {
    for (WalkableSquare square : squareList) {
      square.render();
    }
  }
}

class WalkableSquare {
  int x;
  int y;
  int w;
  int h;

  WalkableSquare(int newX, int newY, int newW, int newH) {
    x = newX;
    y = newY;
    w = newW;
    h = newH;
  }
  boolean isPointInside( int px, int py ) {
    return isPointInRectangle( px, py, x, y, w, h);
  }

  void render() {
    rectMode(CORNER);
    strokeWeight(2);
    stroke(50);
    fill(#E124FF, 50);
    rect(x, y, w, h);
  }
}
