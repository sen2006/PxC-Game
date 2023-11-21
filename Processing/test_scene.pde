

class TestScene extends Scene
{
  //TextButton resetButton = new TextButton( 320, 400, "Reset", 50 );

  TestScene() {
    super( "sprite/scene/test_scene.png", new WalkableArea(new ArrayList<WalkableSquare>()));
    
    walkableArea.add(new WalkableSquare(10, 10, 200, 200));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();
    //resetButton.display();
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}
