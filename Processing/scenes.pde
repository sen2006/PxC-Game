// =============================
// ---- ENTRANCE
// =============================

class Entrance extends Scene
{


  Entrance() {
    super( "sprite/scene/entranceplaceholder.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(650, 330, 550, 600));
    walkableArea.add(new Obstacle(1065, 850, 130,80));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();
    
    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(800, 320, 120, 50, HALL_LEFT, 1420, 740));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}


// =============================
// ---- HALL LEFT SIDE
// =============================
class HallLeft extends Scene
{


  HallLeft() {
    super( "sprite/scene/hallleftplaceholder.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(200, 650, 1350, 130));
    walkableArea.add(new WalkableSquare(200, 440, 240, 235));
    walkableArea.add(new WalkableSquare(1360, 750, 130, 50));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();
    
    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(1360, 750, 130, 50, ENTRANCE, 860, 380));
    doorList.add(new Door(1480, 650, 100, 130, HALL_RIGHT, 545, 760, false));
    ArrayList<Dialogue> dialogueList = new ArrayList<>();
    dialogueList.add(new ImageDialogue("I feel no need to go here.", 50, 1600, "sprite/dialogue/placeholdermaincar.png"));
    doorList.add(new DialogueLockedDoor(200, 440, 240, 235, dialogueList, 300, 680));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}

// =============================
// ---- HALL RIGHT SIDE
// =============================

class HallRight extends Scene
{


  HallRight() {
    super( "sprite/scene/hallrightplaceholder.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(480, 710, 955, 130));
    walkableArea.add(new WalkableSquare(1150, 600, 290, 140));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();
    
    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(480, 710, 60, 130, HALL_LEFT, 1470, 720,false));
    ArrayList<Dialogue> dialogueList = new ArrayList<>();
    dialogueList.add(new ImageDialogue("I feel no need to go here.", 50, 1600, "sprite/dialogue/placeholdermaincar.png"));
    doorList.add(new DialogueLockedDoor(1150, 600, 290, 140, dialogueList, 1280, 750));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}
