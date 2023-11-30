// =============================
// ---- ENTRANCE
// =============================

class Entrance extends Scene
{


  Entrance() {
    super( "sprite/scene/Entrance_ready_png.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(650, 330, 550, 600));
    //Hall Door V
    walkableArea.add(new WalkableSquare(800, 200, 135, 140));

    // Small Table V
    walkableArea.add(new Obstacle(1065, 850, 130, 80));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(800, 200, 135, 145, HALL_LEFT, 1420, 740));
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
    super( "sprite/scene/Hallwayleft_ready_png.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(200, 650, 1350, 130));
    // Blocked Door V
    walkableArea.add(new WalkableSquare(200, 440, 240, 235));
    //entrance door V
    walkableArea.add(new WalkableSquare(1360, 750, 140, 50));
    //Kitchen door V
    walkableArea.add(new WalkableSquare(940, 580, 140, 100));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(1360, 750, 140, 50, ENTRANCE, 860, 380));
    doorList.add(new Door(940, 580, 140, 110, KITCHEN, 500, 900));
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
    super( "sprite/scene/Hallwayright_ready_png.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(480, 710, 955, 130));
    // LOCKED DOOR
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
    doorList.add(new Door(480, 710, 60, 130, HALL_LEFT, 1470, 720, false));
    ArrayList<Dialogue> dialogueList = new ArrayList<>();
    dialogueList.add(new ImageDialogue("I feel no need to go here.", 50, 1600, "sprite/dialogue/placeholdermaincar.png"));
    doorList.add(new DialogueLockedDoor(1150, 600, 290, 130, dialogueList, 1280, 750));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}

// =============================
// ---- KITCHEN
// =============================

class Kitchen extends Scene
{


  Kitchen() {
    super( "sprite/scene/Kitchen_ready_png.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(240, 495, 1400, 480));
    // DINER DOOR V
    walkableArea.add(new WalkableSquare(240, 120, 540, 380));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(450, 940, 140, 50, HALL_LEFT, 990, 700));
    doorList.add(new Door(240, 120, 540, 150, DINER, 500, 700, false));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}

// =============================
// ---- Diner
// =============================

class DiningRoom extends Scene
{


  DiningRoom() {
    super( "sprite/scene/Livingroom_ready_png.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(290, 465, 1380, 330));
    // KITCHEN DOOR V
    walkableArea.add(new WalkableSquare(290, 790, 540, 100));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(290, 790, 540, 100, KITCHEN, 540, 300, false));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}
