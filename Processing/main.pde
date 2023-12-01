import processing.sound.*;
import processing.video.*;

// ============ VARIABLES ============

SoundFile doorSound;
SoundFile song;

PFont font;

PImage DialogueBox;

Animation rightWalkAnim;
Animation leftWalkAnim;
Animation downWalkAnim;
Animation upWalkAnim;

Player player = new Player(0, 0);
boolean debugMode = false;
boolean gameOver = false;
boolean GameEnded = false;
ArrayList<Object> inventory;
int deltaTime = 0;
int oldMillis = 0;
float time = 240;

// ============ ENUMS ============

enum Direction {
  UP, DOWN, LEFT, RIGHT
}

// ============ STATE HANDLER AND STATES ============
StateHandler stateHandler;
DialogueHandler dialogueHandler;

// ===STATES

final State  TEST_SCENE = new  TestScene();
final State  TEST_SCENE_TWO = new   TestSceneTwo();

final State ENTRANCE = new Entrance();
final State HALL_LEFT = new HallLeft();
final State HALL_RIGHT = new HallRight();
final State KITCHEN = new Kitchen();
final State LIVINGROOM = new LivingRoom();
final State BATHROOM = new Bathroom();
final State LIBRARY = new Library();
final State STUDY = new Study();
final State HUNTING = new Hunting();

// ===CUT SCENES

final State VIDEOSCENE = new VideoCutSceneOne();
final State FIRST_CUTSCENE = new BeginingCutScene();
final State FINAL_CUTSCENE_GOOD = new EndingCutSceneGood();
final State FINAL_CUTSCENE_BAD = new EndingCutSceneBad();



void setup() {

  frameRate(60);
  size(1920, 1080);

  // show loading screen
  textAlign(CENTER);
  textSize(100);
  background(0);
  fill(255);
  text("LOADING...", 0, height/2, width, height/2);

  inventory = new ArrayList<Object>();

  doorSound = new SoundFile(this, dataPath("sound/interaction/door.mp3"));
  song = new SoundFile(this, dataPath("sound/music/background_music.mp3"));

  font = createFont(dataPath("font/BASKVILL.ttf"), 128);
  textFont(font);

  //DialogueBox = loadImage(dataPath("sprite/ui/ui_text_box_small.png"));
  DialogueBox = loadImage(dataPath("sprite/ui/ui_text_box.png"));
  
  rightWalkAnim = new Animation("sprite/animations/right/", 8, 100);
  leftWalkAnim = new Animation("sprite/animations/left/", 8, 100);
  downWalkAnim = new Animation("sprite/animations/down/", 8, 100);
  upWalkAnim = new Animation("sprite/animations/up/", 8, 100);

  stateHandler = new StateHandler( "Game" );
  dialogueHandler = new DialogueHandler();

  // STARTING STATE and position
  stateHandler.changeStateTo( FIRST_CUTSCENE );
  player.teleport(900, 900);

  //Load all videos
  VIDEOSCENE.loadVideo();


  //mention all scenes with doors here
  TEST_SCENE.createDoors();
  TEST_SCENE_TWO.createDoors();

  ENTRANCE.createDoors();
  HALL_LEFT.createDoors();
  HALL_RIGHT.createDoors();
  KITCHEN.createDoors();
  LIVINGROOM.createDoors();
  BATHROOM.createDoors();
  LIBRARY.createDoors();
  STUDY.createDoors();
  HUNTING.createDoors();

  song.loop();
  dialogueHandler.add(new ImageDialogue("[That's quite the weather outside. I should hang my coat to dry.]", 40, "sprite/dialogue/Detective.png"));
  dialogueHandler.add(new ImageDialogue("Get close to objects to interact with them.", 40, "sprite/ui/movement.png"));
  dialogueHandler.add(new ImageDialogue("[I should talk to my superior…]", 40, "sprite/dialogue/Detective.png"));
}


void draw() {
  getDeltaTime();
  stateHandler.executeCurrentStateStep();
  player.update();
  drawInv();
  if (debugMode) debug();

  dialogueHandler.draw();
  if (!gameOver && stateHandler.getState() instanceof Scene) Time();
  
  if (GameEnded && stateHandler.getState() instanceof Entrance) exit();
}

void getDeltaTime() {
  deltaTime = millis() - oldMillis;
  oldMillis = millis();
}

// ============ EVENT HANDLERS ============

// only put stuff in here that is valid for all states
// otherwise use the handleKeyPressed in the state itself

void keyPressed() {
  stateHandler.handleKeyPressed();
  if (key == 'd') {
    debugMode=!debugMode;
  }
}
void keyReleased() {
  stateHandler.handleKeyReleased();
}
void keyTyped() {
  stateHandler.handleKeyTyped();
}
void mousePressed() {
  if (gameOver) {
    return;
  }
  stateHandler.handleMousePressed();
  player.handleMousePressed();
  dialogueHandler.handleMousePressed();
}
void mouseClicked() {
  stateHandler.handleMouseClicked();
}
void mouseReleased() {
  stateHandler.handleMouseReleased();
}
void mouseDragged() {
  stateHandler.handleMouseDragged();
}
void mouseMoved() {
  stateHandler.handleMouseMoved();
}
void mouseWheel(MouseEvent event) {
  stateHandler.handleMouseWheel( event );
}

// debugger
void debug() {
  if (stateHandler.getState() instanceof Scene) {
    Scene scene = (Scene)stateHandler.getState();
    scene.getWalkableArea().render();
    scene.debug();
    player.debug();

    textSize(40);
    fill(255);
    text ("FPS: "+nf(frameRate, 0, 2), 200, 50);

    text("X:" + nf(mouseX, 0, 2) + " - " + "Y:" + nf(mouseY, 0, 2), 200, 200);
  }
}

// end game timer
void Time () {
  textAlign(CENTER);
  fill (#D82934);
  textSize(64);
  imageMode(CENTER);
  image(DialogueBox, width/2, 40, 200, 60);
  imageMode(CORNER);
  text((floor(time/60)>0?(floor(time/60) + ":"):"") + (time%60 < 10&&floor(time/60)>0?"0":"") + floor(time % 60), width/2, 60);
  if (time <= 0) {
    gameOver = true;
    stateHandler.changeStateTo( FINAL_CUTSCENE_BAD );
    GameEnded=true;
  } else {
    time -= deltaTime/1000f;
    time = max(time, 0);
  }
}
