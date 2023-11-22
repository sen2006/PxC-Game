

class TestSceneTwo extends Scene
{

  TestSceneTwo() {
    super( "sprite/scene/test_scene.png", new WalkableArea(new ArrayList<WalkableSquare>()));
    
    walkableArea.add(new WalkableSquare(50, 50, 200, 400));
  }

  public void doStepWhileInState()
  {
    
    super.doStepWhileInState();
    //resetButton.display();
    rectMode(CORNER);
    fill(#F54A4A);
    stroke(0,0);
    rect(25,25,250,450);
    
    for(Object object : objects) {
      object.draw(); 
    }
   }

  void handleMousePressed() {
    super.handleMousePressed();
    if (mouseButton == RIGHT) {
      
    }
  }
}
