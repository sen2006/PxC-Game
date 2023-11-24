// ============ VARIABLES ============

Player player = new Player(100, 100);
boolean debugMode = false;
boolean gameOver = false;
ArrayList<Object> inventory;
int deltaTime = 0;
int oldMillis = 0;
float time = 10;


// ============ STATE HANDLER AND STATES ============
StateHandler stateHandler;
DialogueHandler dialogueHandler;

// ===STATES

final State  TEST_SCENE = new  TestScene();
final State  TEST_SCENE_TWO = new   TestSceneTwo();
final State  END_GAME_SCENE = new  EndGameScene();
//final State FOREST_SCENE = new ForestScene();

// ===CUT SCENES

final State FIRST_CUTSCENE = new BeginingCutScene();


void setup() {
  frameRate(60);
  size(1920, 1080);
  inventory = new ArrayList<Object>();

  stateHandler = new StateHandler( "Game" );
  stateHandler.changeStateTo( FIRST_CUTSCENE );
  //stateHandler.changeStateTo( TEST_SCENE );

  dialogueHandler = new DialogueHandler();
  dialogueHandler.add(new Dialogue("TEST", 50, 2000));
  dialogueHandler.add(new Dialogue("TEST2", 50, 2000));
  dialogueHandler.add(new ImageDialogue("TEST3", 50, 20000, "sprite/dialogue/placeholderMainCar.png"));

  //mention all scenes with doors here
  TEST_SCENE.createDoors();
  TEST_SCENE_TWO.createDoors();
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

void debug() {
  if (stateHandler.getState() instanceof Scene) {
    Scene scene = (Scene)stateHandler.getState();
    scene.getWalkableArea().render();
    scene.debug();
    player.debug();
  }
}

void Time () {
  fill (0);
  textSize(32);
  text(round(time), width/2, 40);
  if (time <= 0) {
    time = 0;
    push();
    textMode(CENTER);
    textSize(56);
    text("Game Over", width/2, height/2);
    gameOver = true;
    pop();
    stateHandler.changeStateTo( END_GAME_SCENE );
  } else if (stateHandler.getState() instanceof Scene){
    time -= deltaTime/1000f;
  }
}
