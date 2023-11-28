class Door {

  int doorX;
  int doorY;
  int doorWidth;
  int doorHeight;
  State tDoor;
  int teleportX;
  int teleportY;
  boolean makesSound;

  Door(int x, int y, int w, int h, State tD, int tX, int tY, boolean sound) {
    doorX = x;
    doorY = y;
    doorWidth = w;
    doorHeight = h;
    tDoor = tD;
    teleportX = tX;
    teleportY = tY;
    makesSound = sound;
  }

  Door(int x, int y, int w, int h, State tD, int tX, int tY) {
    doorX = x;
    doorY = y;
    doorWidth = w;
    doorHeight = h;
    tDoor = tD;
    teleportX = tX;
    teleportY = tY;
    makesSound = true;
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
  }
  void isPlayerOnDoor() {
    if ( isPointInRectangle (player.getX(), player.getY(), doorX, doorY, doorWidth, doorHeight) && isPointInRectangle (player.getMoveX(), player.getMoveY(), doorX, doorY, doorWidth, doorHeight)) {
      if (makesSound) doorSound.play();
      stateHandler.changeStateTo(tDoor);
      player.teleport(teleportX, teleportY);
    }
  }
}

class DialogueDoor extends Door {
  ArrayList<Dialogue> dialogueList;
  int moveX;
  int moveY;
  boolean playOnce;
  boolean played = false;
  DialogueDoor(int x, int y, int w, int h, State tD, int tX, int tY, ArrayList<Dialogue> newDialogue) {
    super(x, y, w, h, tD, tX, tY, true);
    dialogueList = newDialogue;
    moveX = tX;
    moveY = tY;
    playOnce = true;
  }

  DialogueDoor(int x, int y, int w, int h, State tD, int tX, int tY, ArrayList<Dialogue> newDialogue, boolean playsOnce) {
    super(x, y, w, h, tD, tX, tY, true);
    dialogueList = newDialogue;
    moveX = tX;
    moveY = tY;
    playOnce = playsOnce;
  }

  void isPlayerOnDoor() {
    super.isPlayerOnDoor();
    if (!playOnce || !played) {
      if ( isPointInRectangle (player.getX(), player.getY(), doorX, doorY, doorWidth, doorHeight)) {
        for (Dialogue dialogue : dialogueList) {
          dialogue.resetTime();
        }
        dialogueHandler.addList(dialogueList);
        player.moveTo(moveX, moveY);
        played = true;
      }
    }
  }
}

class DialogueLockedDoor extends Door {
  ArrayList<Dialogue> dialogueList;
  int moveX;
  int moveY;
  DialogueLockedDoor(int x, int y, int w, int h, ArrayList<Dialogue> newDialogue, int tX, int tY) {
    super(x, y, w, h, null, 0, 0, false);
    dialogueList = newDialogue;
    moveX = tX;
    moveY = tY;
  }

  void isPlayerOnDoor() {
    if ( isPointInRectangle (player.getX(), player.getY(), doorX, doorY, doorWidth, doorHeight)) {
      for (Dialogue dialogue : dialogueList) {
        dialogue.resetTime();
      }
      dialogueHandler.addList(dialogueList);
      player.moveTo(moveX, moveY);
    }
  }
}
