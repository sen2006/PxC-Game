// Collision detection
// copied and adapted from http://www.jeffreythompson.org/collision-detection/point-rect.php

// POINT/RECTANGLE
boolean isPointInRectangle(float px, float py, float rx, float ry, float rw, float rh) {
  return px >= rx && px <= rx + rw && py >= ry && py <= ry + rh;
}

boolean isKeyStringInInv(String keyString) {
  for (Object object : inventory) {
    if (object.getKeyString().equals(keyString)) {
      return true;
    }
  }
  return false;
}

boolean isKeyStringActiveInCurrentScene(String keyString) {
  return isKeyStringActiveInScene(keyString, stateHandler.getState());
}

boolean isKeyStringActiveInScene(String keyString, State state) {
  if (state instanceof Scene) {
    Scene scene = (Scene)state;
    for (Object object : scene.getObjects()) {
      if (object.getKeyString().equals(keyString)) {
        return true;
      }
    }
  }
  return false;
}

void drawInv() {
  int h=20;
  for (int i=0; i<inventory.size(); i++) {
    inventory.get(i).setPos(width-100, h);
    inventory.get(i).draw();
    h+=inventory.get(i).getHeight();
  }
}

// trace functions:
//    traceWithTime( String traceMessage )
//    traceIfChanged( String id , String logLine )

import java.util.Map;
import java.util.HashMap;

private static float start = System.nanoTime();


/**
 * Traces a string preceded with the current time.
 * @param traceMessage  Message to be traced.
 */
public static void traceWithTime( String traceMessage )
{
  float now = timeSinceStartInSeconds();

  println( now + " > " + traceMessage );
}

/**
 * Returns the number of seconds since the start of the execution.
 */
public static int timeSinceStartInSeconds()
{
  return (int) ( ( System.nanoTime() - start ) / 1e9 );
}

private static Map<String, String> logid2line = new HashMap<String, String>();

/**
 * Only logs data associated with an id, if and only if the *data* has changed.
 */
public static void traceIfChanged( String id, String logLine )
{
  if ( !logid2line.containsKey(id) || !logid2line.get(id).equals( logLine ) ) {
    println( id + " = " + logLine );
    logid2line.put( id, logLine );
  }
}
