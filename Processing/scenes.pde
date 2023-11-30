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
    
    ArrayList<Dialogue> dialogueList = new ArrayList<>();
    dialogueList.add(new ImageDialogue("There you are, you are late!", 50, "sprite/dialogue/Superior.png"));
    dialogueList.add(new ImageDialogue("I couldn't find my lighter, sorry about that. But what matters is that I am here.", 50, "sprite/dialogue/Detective.png"));
    dialogueList.add(new ImageDialogue("Have you read up on the file?", 50, "sprite/dialogue/Superior.png"));
    dialogueList.add(new ImageDialogue("I have, but it would be helpful to have it on me during the investigation.", 50, "sprite/dialogue/Detective.png"));
    dialogueList.add(new ImageDialogue("Here, don't lose it.", 50, "sprite/dialogue/Superior.png"));
    dialogueList.add(new ImageDialogue("you should talk to the family to see if they know something that could have happened.", 50, "sprite/dialogue/Superior.png"));
    dialogueList.add(new ImageDialogue("and hurry! This seems to be another case of the Ironwood serial killer, we won't have much time until the FBI takes over the case!", 50, "sprite/dialogue/Superior.png"));
    objects.add(new NPC(710, 300, "", "sprite/object/placeholders/placeholdernpc.png", dialogueList));
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
    
    
    ArrayList<Dialogue> WifeDialogueList = new ArrayList<>();
    WifeDialogueList.add(new ImageDialogue("Afternoon madam.", 50, "sprite/dialogue/Detective.png"));
    WifeDialogueList.add(new ImageDialogue("Afternoon.", 50, "sprite/dialogue/Wife.png"));
    WifeDialogueList.add(new ImageDialogue("I'm sorry for interviewing you so soon after your loss but may I ask for your whereabouts this morning?", 50, "sprite/dialogue/Detective.png"));
    WifeDialogueList.add(new ImageDialogue("I was shopping for groceries as I had seen we ran low on bread and greens, I also wanted to be alone for a little while as I was not feeling well. ", 50, "sprite/dialogue/Wife.png"));
    WifeDialogueList.add(new ImageDialogue("What happened after?", 50, "sprite/dialogue/Detective.png"));
    WifeDialogueList.add(new ImageDialogue("When i came home I saw a police car standing in front of the house so I panickily rushed in and left my groceries on the kitchen", 50, "sprite/dialogue/Wife.png"));
    WifeDialogueList.add(new ImageDialogue("I see, thank you for talking to me, it must be difficult.", 50, "sprite/dialogue/Detective.png"));
    WifeDialogueList.add(new ImageDialogue("[She said she dropped her groceries in the kitchen, i should see if they are there.]", 50, "sprite/dialogue/Detective.png"));
    objects.add(new NPC(470, 770, "", "sprite/object/placeholders/placeholdernpc.png", WifeDialogueList));
    
    ArrayList<Dialogue> HusbandDialogueList = new ArrayList<>();
    HusbandDialogueList.add(new ImageDialogue("Afternoon Sir.", 50, "sprite/dialogue/Detective.png"));
    HusbandDialogueList.add(new ImageDialogue("Afternoon.", 50, "sprite/dialogue/Husband.png"));
    HusbandDialogueList.add(new ImageDialogue("Sorry to bother you with an interview so soon after the incident. But I would be glad if you have any potentially helpful information to share.", 50, "sprite/dialogue/Detective.png"));
    HusbandDialogueList.add(new ImageDialogue("I can sadly not say much about the incident itself as i was out hunting in the morning although i seem to have lost my hunting dairy. It was a prized possession of mine.", 50, "sprite/dialogue/Husband.png"));
    HusbandDialogueList.add(new ImageDialogue("When did you return home?", 50, "sprite/dialogue/Detective.png"));
    HusbandDialogueList.add(new ImageDialogue("I made my way back to my home at around 10 this afternoon, arriving at 10:30 when i saw police vehicles standing outside my property and my wife completely shaken up in the hallway.", 50, "sprite/dialogue/Husband.png"));
    HusbandDialogueList.add(new ImageDialogue("Thank you for taking the time to talk. I'll be on my way now.", 50, "sprite/dialogue/Detective.png"));
    HusbandDialogueList.add(new ImageDialogue("[He said he lost his hunting dairy, maybe i can find it.]", 50, "sprite/dialogue/Detective.png"));
    objects.add(new NPC(470, 870, "", "sprite/object/placeholders/placeholdernpc.png", HusbandDialogueList));
    
    ArrayList<Dialogue> ButlerDialogueList = new ArrayList<>();
    ButlerDialogueList.add(new ImageDialogue("Afternoon.", 50, "sprite/dialogue/Detective.png"));
    ButlerDialogueList.add(new ImageDialogue("Is there anything you can tell me about the situation?", 50, "sprite/dialogue/Detective.png"));
    ButlerDialogueList.add(new ImageDialogue("I was in the cellar organizing the wine collection following a family reunion last week when i heard the maid screaming upstairs. and when i found her i called 112 as soon as i could.", 50, "sprite/dialogue/Butler.png"));
    ButlerDialogueList.add(new ImageDialogue("I'm sorry she couldn't be saved.", 50, "sprite/dialogue/Detective.png"));
    ButlerDialogueList.add(new ImageDialogue("They did their best…", 50, "sprite/dialogue/Butler.png"));
    ButlerDialogueList.add(new ImageDialogue("On another note. I found that some of the cutlery was missing from the kitchen, specifically a large meat-knife. There was also a sistinct smell of cigaret smoke in the livingroom.", 50, "sprite/dialogue/Butler.png"));
    ButlerDialogueList.add(new ImageDialogue("Thank you for the information.", 50, "sprite/dialogue/Detective.png"));
    ButlerDialogueList.add(new ImageDialogue("[He said there was a knife missing, maybe i can find it.]", 50, "sprite/dialogue/Detective.png"));
    ButlerDialogueList.add(new ImageDialogue("[Also a smell of smoke in the livingroom.]", 50, "sprite/dialogue/Detective.png"));
    objects.add(new NPC(340, 610, "", "sprite/object/placeholders/placeholdernpc.png", ButlerDialogueList));
   
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
