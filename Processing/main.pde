import processing.sound.*;
// ============ VARIABLES ============

SoundFile doorSound;

Player player = new Player(0, 0);
boolean debugMode = false;
boolean gameOver = false;
ArrayList<Object> inventory;
int deltaTime = 0;
int oldMillis = 0;
float time = 300;


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

final State  END_GAME_SCENE = new  EndGameScene();
//final State FOREST_SCENE = new ForestScene();

// ===CUT SCENES

final State FIRST_CUTSCENE = new BeginingCutScene();


void setup() {
  frameRate(60);
  size(1920, 1080);
  //fullScreen();
  inventory = new ArrayList<Object>();

  doorSound = new SoundFile(this, dataPath("sound/interaction/door.mp3"));

  stateHandler = new StateHandler( "Game" );

  dialogueHandler = new DialogueHandler();

  // STARTING STATE and position
  stateHandler.changeStateTo( ENTRANCE );
  player.teleport(900, 900);

  //mention all scenes with doors here
  TEST_SCENE.createDoors();
  TEST_SCENE_TWO.createDoors();

  ENTRANCE.createDoors();
  HALL_LEFT.createDoors();
  HALL_RIGHT.createDoors();
  KITCHEN.createDoors();
  DINER.createDoors();
}


void draw() {
  getDeltaTime();
  stateHandler.executeCurrentStateStep();
  player.update();
  drawInv();
  if (debugMode) debug();

  dialogueHandler.draw();

  Time();
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
  } else if (stateHandler.getState() instanceof Scene) {
    time -= deltaTime/1000f;
    time = max(time, 0);
  }
}
