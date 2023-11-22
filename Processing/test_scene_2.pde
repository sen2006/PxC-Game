

class TestSceneTwo extends Scene
{

  TestSceneTwo() {
    super( "sprite/scene/test_scene.png", new WalkableArea(new ArrayList<WalkableSquare>()));
    
    walkableArea.add(new WalkableSquare(50, 50, 200, 400));
    walkableArea.add(new WalkableSquare(250, 250, 200, 200));
  }

  public void doStepWhileInState()
  {
    
    super.doStepWhileInState();
    //resetButton.display();
    rectMode(CORNER);
    fill(#326fd1);
    stroke(0,0);
    rect(25,25,250,450);
    }
   }

  void handleMousePressed() {
    super.handleMousePressed();
    if (mouseButton == RIGHT) {
      
    }
  }
}
