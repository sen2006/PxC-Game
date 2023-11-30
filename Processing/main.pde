import processing.sound.*;
import processing.video.*;

// ============ VARIABLES ============

SoundFile doorSound;

Player player = new Player(0, 0);
boolean debugMode = false;
boolean gameOver = false;
ArrayList<Object> inventory;
int deltaTime = 0;
int oldMillis = 0;
float time = 300;

// ============ ENUMS ============

enum Direction{UP,DOWN,LEFT,RIGHT}

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
final State DINER = new DiningRoom();
final State BATHROOM = new Bathroom();
final State LIBRARY = new Library();
final State STUDY = new Study();
final State HUNTING = new Hunting();


final State  END_GAME_SCENE = new  EndGameScene();
//final State FOREST_SCENE = new ForestScene();

// ===CUT SCENES

final State FIRST_CUTSCENE = new BeginingCutScene();
final State TESTVIDEO = new TestVideoScene();


void setup() {
  
  frameRate(60);
  size(1920, 1080);

  // show loading screen
  textAlign(CENTER);
  textSize(100);
  background(0);
  fill(255);
  text("LOADING", 0, 0, width, height);

  inventory = new ArrayList<Object>();

  doorSound = new SoundFile(this, dataPath("sound/interaction/door.mp3"));

  stateHandler = new StateHandler( "Game" );
  dialogueHandler = new DialogueHandler();

  // STARTING STATE and position
  stateHandler.changeStateTo( ENTRANCE );
  player.teleport(900, 900);

  //Load all videos
  TESTVIDEO.loadVideo();


  //mention all scenes with doors here
  TEST_SCENE.createDoors();
  TEST_SCENE_TWO.createDoors();

  ENTRANCE.createDoors();
  HALL_LEFT.createDoors();
  HALL_RIGHT.createDoors();
  KITCHEN.createDoors();
  DINER.createDoors();
  BATHROOM.createDoors();
  LIBRARY.createDoors();
  STUDY.createDoors();
  HUNTING.createDoors();
}


void draw() {
  getDeltaTime();
  stateHandler.executeCurrentStateStep();
  player.update();
  drawInv();
  if (debugMode) debug();

  dialogueHandler.draw();
  if (!gameOver && stateHandler.getState() instanceof Scene) Time();
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
  }
}

// end game timer
void Time () {
  textAlign(CENTER);
  fill (255);
  textSize(32);
  text((floor(time/60)>0?(floor(time/60) + ":"):"") + (time%60 < 10&&floor(time/60)>0?"0":"") + floor(time % 60), width/2, 40);
  if (time <= 0) {
    textSize(56);
    text("Game Over", width/2, height/2);
    gameOver = true;
    stateHandler.changeStateTo( END_GAME_SCENE );
  } else {
    time -= deltaTime/1000f;
    time = max(time, 0);
  }
}
