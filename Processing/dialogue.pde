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
      boxX = 0;
      boxY = height-200;
      boxH = 200;
      boxW = width;
    }

    if (dialogueToDo.size() >0) {
      Dialogue dialogue = dialogueToDo.get(0);

      if (dialogue instanceof ImageDialogue) {
        ImageDialogue imageDialogue = (ImageDialogue) dialogue;
        if (sprite == null) {
          sprite = loadImage(dataPath(imageDialogue.getFilename()));
        }
        image(sprite, 20, (height-boxH)-sprite.height);
      }

      fill(200);
      strokeWeight(2);
      stroke(0);
      rect(boxX, boxY, boxW, boxH);
      fill(0);
      textSize(dialogue.getSize());
      textAlign(CENTER);
      text(dialogue.getText(), boxX, boxY+20, boxW, boxH);
    }
  }

  void handleMousePressed() {
    if (dialogueToDo.size()>0) {
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
