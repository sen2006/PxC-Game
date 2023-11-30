class NPC extends Object {
  ArrayList<Dialogue> dialogueList;
  NPC(int x, int y, String keyS, String newFilename, ArrayList<Dialogue> newDialogueList) {
    super(x, y, keyS, newFilename);
    dialogueList = newDialogueList;
  }

  void checkCol() {
    float distance = dist(objectX+sprite.width/2, objectY+sprite.height/2, player.getX(), player.getY());
    if (isPointInRectangle(mouseX, mouseY, objectX, objectY, sprite.width, sprite.height) && distance < player.getInteractionRadius()) {
      collected = !collected;
      dialogueHandler.addList(dialogueList);
    }
  }
}
