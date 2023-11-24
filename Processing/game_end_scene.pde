

 class EndGameScene extends Scene
{
  

  EndGameScene() {
    super( "sprite/scene/test_scene.png", new WalkableArea(new ArrayList<WalkableSquare>()));
    

  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();
    
    rectMode(CORNER);
    fill(#2DB209);
    stroke(0,0);
    rect(25,25,250,450);
    rect(225,225,250,250);
    
    for(Object object : objects) {
      object.draw();
    }
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}
