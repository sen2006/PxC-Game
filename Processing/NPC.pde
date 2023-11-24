class NPC extends Object {
  ArrayList<Dialogue> dialogueList;
  NPC(int x, int y, String keyS, String newFilename, ArrayList<Dialogue> newDialogueList) {
    super(x, y, keyS, newFilename);
    dialogueList = newDialogueList;
  }

  void checkCol() {
    float distance = dist(objectX+sprite.height/2, objectY+sprite.width/2, player.getX(), player.getY());
    if (isPointInRectangle(mouseX, mouseY, objectX, objectY, sprite.height, sprite.width) && distance < player.getInteractionRadius()) {
      collected = !collected;
      for (Dialogue dialogue : dialogueList) {
        dialogue.resetTime();
      }
      dialogueHandler.addList(dialogueList);
    }
  }
}
