

 class TestScene extends Scene
{
  

  TestScene() {
    super( "sprite/scene/test_scene.png", new WalkableArea(new ArrayList<WalkableSquare>()));
    
    walkableArea.add(new WalkableSquare(50, 50, 200, 400));
    walkableArea.add(new WalkableSquare(250, 250, 200, 200));
    objects.add(new Object(100,100, false , false, "", "sprite/object/placeholders/placeholder.png"));
    objects.add(new Object(100,300, true, false, "", "sprite/object/placeholders/placeholder.png"));
    objects.add(new Object(300,300, false, true, "", "sprite/object/placeholders/placeholder.png"));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();
    
    rectMode(CORNER);
    fill(#F54A4A);
    stroke(0,0);
    rect(25,25,250,450);
    rect(225,225,250,250);

    for(Object object : objects) {
      object.draw();
    }
  }
  
  void createDoors() {
    doorList.add(new Door(200,200,80,50,TEST_SCENE_TWO,160,160));
  }

  void handleMousePressed() {
    super.handleMousePressed();
  }
}
