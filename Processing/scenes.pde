// =============================
// ---- ENTRANCE
// =============================

class Entrance extends Scene
{


  Entrance() {
    super( "sprite/scene/Entrance_ready_png.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(640, 280, 650, 720));
    //Hall Door V
    walkableArea.add(new WalkableSquare(790, 80, 165, 210));

    // Small Table V
    walkableArea.add(new Obstacle(1130, 910, 200, 150));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(790, 80, 165, 210, HALL_LEFT, 1500, 740));
    
    ArrayList<Dialogue> dialogueList = new ArrayList<>();
    dialogueList.add(new ImageDialogue("I feel no need to go here.", 50, "sprite/dialogue/Detective.png"));
    doorList.add(new DialogueLockedDoor(1120, 240, 190, 140, dialogueList, 1150, 400));
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

    walkableArea.add(new WalkableSquare(190, 595, 1700, 160));
    // Blocked door V
    walkableArea.add(new WalkableSquare(190, 440, 295, 180));
    //entrance door V
    walkableArea.add(new WalkableSquare(1410, 750, 190, 50));
    //Kitchen door V
    walkableArea.add(new WalkableSquare(1120, 400, 160, 200));
    //BATHROOM door V
    walkableArea.add(new WalkableSquare(190, 750, 190, 50));
    //STUDY door V
    walkableArea.add(new WalkableSquare(650, 750, 190, 50));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(1410, 750, 190, 50, ENTRANCE, 860, 300  ));
    doorList.add(new Door(1120, 400, 160, 200, KITCHEN, 500, 900));
    doorList.add(new Door(1780, 595, 200, 160, HALL_RIGHT, 425, 660, false));
    doorList.add(new Door(190, 750, 190, 50, BATHROOM, 1110, 320));
    doorList.add(new Door(650, 750, 190, 50, STUDY, 860, 300));

    ArrayList<Dialogue> dialogueList = new ArrayList<>();
    dialogueList.add(new ImageDialogue("I feel no need to go here.", 50, "sprite/dialogue/Detective.png"));
    doorList.add(new DialogueLockedDoor(190, 440, 295, 180, dialogueList, 300, 680));
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

    walkableArea.add(new WalkableSquare(330, 590, 1090, 160));
    // LOCKED DOOR
    walkableArea.add(new WalkableSquare(1120, 310, 300, 280));
    // HUNTING DOOR
    walkableArea.add(new WalkableSquare(1415, 620, 50, 130));
    // LIBRARY DOOR
    walkableArea.add(new WalkableSquare(700, 730, 190, 50));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(330, 590, 70, 160, HALL_LEFT, 1770, 670, false));
    doorList.add(new Door(700, 730, 190, 50, LIBRARY, 1010, 305));
    doorList.add(new Door(1415, 620, 50, 130, HUNTING, 775, 660));
    
    ArrayList<Dialogue> dialogueList = new ArrayList<>();
    dialogueList.add(new ImageDialogue("I feel no need to go here.", 50, "sprite/dialogue/Detective.png"));
    doorList.add(new DialogueLockedDoor(1120, 310, 300, 280, dialogueList, 1270, 600));
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

    walkableArea.add(new WalkableSquare(105, 240, 1700, 730));
    // DINER DOOR V
    walkableArea.add(new WalkableSquare(345, 960, 250, 50));
    // HALL DOOR V
    walkableArea.add(new WalkableSquare(105, 0, 660, 240));
    
    objects.add(new Object(1300, 550, true, true, "groceries", "sprite/object/placeholders/placeholder.png"));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(345, 960, 250, 50, HALL_LEFT, 1200, 610));
    doorList.add(new Door(105, 0, 660, 200, LIVINGROOM, 380, 910, false));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}

// =============================
// ---- LIVING ROOM
// =============================

class LivingRoom extends Scene
{
  
 boolean lighterAdded=false;
 boolean playedScene=false;

  LivingRoom() {
    super( "sprite/scene/Livingroom_ready_png.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(100, 455, 1710, 500));
    // KITCHEN DOOR V
    walkableArea.add(new WalkableSquare(100, 925, 660, 100));
    
    objects.add(new Object(1245, 615, true, true, "ashtray", "sprite/object/placeholders/placeholder.png"));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
    if((!lighterAdded) && 
    isKeyStringInInv("knife") &&
    isKeyStringInInv("ashtray") &&
    isKeyStringInInv("gun") &&
    isKeyStringInInv("glass") &&
    isKeyStringInInv("groceries")) {
      objects.add(new Object(1130, 560, true, true, "lighter", "sprite/object/placeholders/placeholder.png"));
      lighterAdded=true;
    }
    
    if(!playedScene && isKeyStringInInv("lighter")) {
      stateHandler.changeStateTo( FINAL_CUTSCENE_GOOD );
      playedScene=true;
    }
  }

  void createDoors() {
    doorList.add(new Door(100, 925, 660, 100, KITCHEN, 540, 300, false));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}

// =============================
// ---- BATHROOM
// =============================

class Bathroom extends Scene
{


  Bathroom() {
    super( "sprite/scene/Bathroom_ready_png.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(560, 295, 790, 740));
    //Hall Door V
    walkableArea.add(new WalkableSquare(1030, 105, 160, 200));
    
    objects.add(new Object(1305, 495, true, true, "knife", "sprite/object/placeholders/placeholder.png"));

  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }
  void createDoors() {
    doorList.add(new Door(1030, 105, 160, 200, HALL_LEFT, 280, 740));
  }
    void handleMousePressed() {
      super.handleMousePressed();
    }
  }

// =============================
// ---- STUDY
// =============================

class Study extends Scene
{


  Study() {
    super( "sprite/scene/Study_ready_png.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(635, 285, 660, 725));
    //Hall Door V
    walkableArea.add(new WalkableSquare(790, 95, 160, 190));

  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(790, 95, 160, 190, HALL_LEFT, 740, 740));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}

// =============================
// ---- LIBRARY
// =============================

class Library extends Scene
{
  

  Library() {
    super( "sprite/scene/Library_ready_png.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(260, 290, 985, 735));
    walkableArea.add(new WalkableSquare(1280, 290, 370, 735));
    walkableArea.add(new WalkableSquare(1230, 520, 70, 150));
    //Hall Door V
    walkableArea.add(new WalkableSquare(930, 100, 160, 200));

    objects.add(new Object(1600, 600, true, true, "glass", "sprite/object/placeholders/placeholder.png"));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(930, 100, 160, 200, HALL_RIGHT, 790, 715));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}

// =============================
// ---- HUNTING
// =============================

class Hunting extends Scene
{


  Hunting() {
    super( "sprite/scene/Hunting_room_ready_png.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(735, 400, 455, 500));
    //Hall Door V
    walkableArea.add(new WalkableSquare(715, 550, 50, 200));

    objects.add(new Object(1080, 710, true, true, "gun", "sprite/object/placeholders/placeholder.png"));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(715, 550, 50, 200, HALL_RIGHT, 1390, 680));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}
