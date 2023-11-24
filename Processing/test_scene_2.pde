class TestSceneTwo extends Scene
{

  TestSceneTwo() {
    super( "sprite/scene/test_scene.png", new WalkableArea(new ArrayList<WalkableSquare>()));

    walkableArea.add(new WalkableSquare(50, 50, 200, 400));
    walkableArea.add(new WalkableSquare(250, 250, 200, 200));

    objects.add(new HighlightObject(100, 100, "", "sprite/object/placeholders/placeholder.png", 255));
    objects.add(new HighlightObject(100, 300, false, "", "sprite/object/placeholders/placeholder.png", 255));
    objects.add(new HighlightObject(300, 300, false, true, "", "sprite/object/placeholders/placeholder.png", 255));
    objects.add(new TogleableObject(175, 300, "", "sprite/object/placeholders/placeholder.png"));
    
    ArrayList<Dialogue> dialogueList = new ArrayList<>();
    dialogueList.add(new Dialogue("NPC TEST", 50, 2000));
    dialogueList.add(new Dialogue("NPC TEST 2", 50, 2000));
    objects.add(new NPC(160,160, "", "sprite/object/placeholders/placeholdernpc.png" , dialogueList));
  }

  public void doStepWhileInState()
  {
    super.doStepWhileInState();
    rectMode(CORNER);
    fill(#326fd1);
    stroke(0, 0);
    rect(25, 25, 250, 450);
    rect(225, 225, 250, 250);

    for (Object object : objects) {
      object.draw();
    }
  }

  void createDoors() {
    doorList.add(new Door(40, 60, 40, 100, TEST_SCENE, 220, 100));
  }
}
