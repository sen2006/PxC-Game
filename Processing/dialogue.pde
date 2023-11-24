class Dialogue {
  String dialogueText;
  int screenTimeMS;
  int size;
  
  Dialogue(String text, int textSize, int onScreenTime) {
    dialogueText = text;
    screenTimeMS = onScreenTime;
    size = textSize;
  }
  
  int getScreenTimeLeft() {
    return screenTimeMS;
  }
  
  void decreaseTimer () {
    screenTimeMS-=deltaTime;
  }
  
  String getText() {
    return dialogueText;
  }
  
  int getSize() {
    return size;
  }
}

class ImageDialogue extends Dialogue {
  String filename;
  
  ImageDialogue(String text, int textSize, int onScreenTime, String newFilename) {
    super(text, textSize, onScreenTime);
    filename = newFilename;
  }
  
  String getFilename() {
    /*if (sprite == null) {
      sprite = loadImage(dataPath(filename));
    }*/
    return filename;
  }
}

class DialogueHandler {
  ArrayList<Dialogue> dialogueToDo = new ArrayList<Dialogue>();
  DialogueHandler() {}
  
  int boxX;
  int boxY;
  int boxH;
  int boxW;
  
  void draw() {
    if(gameOver){return;}
    if (boxH == 0 || boxW == 0 ) {
      boxX = 0;
      boxY = height-200;
      boxH = 200;
      boxW = width;
    }
    
    if (dialogueToDo.size() >0) {
      Dialogue dialogue = dialogueToDo.get(0);
      
      if (dialogue instanceof ImageDialogue) {
        ImageDialogue imageDialogue = (ImageDialogue) dialogue;
        PImage sprite = loadImage(dataPath(imageDialogue.getFilename()));
        image(sprite, 20, (height-boxH)-sprite.height);
      }
      
      fill(200);
      strokeWeight(2);
      stroke(0);
      rect(boxX, boxY, boxW, boxH);
      fill(0);
      textSize(dialogue.getSize());
      textAlign(CENTER);
      text(dialogue.getText(), boxX-10, boxY, boxW, boxH+10);
      
      dialogue.decreaseTimer();
      if (dialogue.getScreenTimeLeft() <= 0) {
        dialogueToDo.remove(0);
      }
    }
  }
  
  void add(Dialogue dialogue) {
    dialogueToDo.add(dialogue);
  }
}
