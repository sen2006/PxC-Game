class Dialogue {
  String dialogueText;
  int size;

  Dialogue(String text, int textSize) {
    dialogueText = text;
    size = textSize;
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

  ImageDialogue(String text, int textSize, String newFilename) {
    super(text, textSize);
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
  DialogueHandler() {
  }

  int boxX;
  int boxY;
  int boxH;
  int boxW;

  PImage sprite;

  void draw() {
    if (gameOver) {
      return;
    }
    if (boxH == 0 || boxW == 0 ) {
      boxX = width/2-DialogueBox.width/2;
      boxY = height-DialogueBox.height;
      boxH = DialogueBox.height;
      boxW = DialogueBox.width;
    }

    if (dialogueToDo.size() >0) {
      if (!gameOver && stateHandler.getState() instanceof Scene) {
        Dialogue dialogue = dialogueToDo.get(0);

        if (dialogue instanceof ImageDialogue) {
          ImageDialogue imageDialogue = (ImageDialogue) dialogue;
          if (sprite == null) {
            sprite = loadImage(dataPath(imageDialogue.getFilename()));
          }
          image(sprite, 0, height-sprite.height);
        }
        imageMode(CENTER);
        image(DialogueBox, width/2, boxY+DialogueBox.height/2);
        imageMode(CORNER);
        fill(#fff6d3);
        textSize(dialogue.getSize());
        textAlign(CENTER);
        text(dialogue.getText(), boxX+40, boxY+40, boxW-80, boxH);
        textSize(20);
        text("Click to continue...", boxX+boxW-260, height-90, 300, 80);
      }
    }
  }

  void handleMousePressed() {
    if (mouseButton == LEFT && stateHandler.getState() instanceof Scene && dialogueToDo.size()>0) {
      dialogueToDo.remove(0);
      sprite = null;
    }
  }

  void add(Dialogue dialogue) {
    dialogueToDo.add(dialogue);
  }

  void addList(ArrayList<Dialogue> list) {
    for (Dialogue dialogue : list) {
      add(dialogue);
    }
  }

  boolean isPlaying() {
    return (dialogueToDo.size() > 0);
  }
}
