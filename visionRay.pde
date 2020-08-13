class VisionRay {
  float fromX_, fromY_;
  float toX_, toY_;
  float dir_;
  boolean hit_;
  GameObject parent_;

  int MAX_ITER = 22;
  float MIN_DIST = 0.1;

  VisionRay(GameObject parent, float fromX, float fromY, float dir) {
    parent_ = parent;
    fromX_ = fromX;
    fromY_ = fromY;
    dir_ = dir;
  }

  void update(Iterable<GameObject> gameObjects, float fromX, float fromY, float dir) {
    fromX_ = fromX;
    fromY_ = fromY;
    dir_ = dir;
    float currentX = fromX_;
    float currentY = fromY_;

    float minDist = 10000.; //<>//
    for (int i = 0; i < MAX_ITER; i++) { //<>//
      minDist = 10000.; //<>//
      for (GameObject gameObject : gameObjects) { //<>// //<>//
        if (gameObject != parent_) { //<>// //<>//
          float dist = gameObject.distanceFromPoint(currentX, currentY);
          minDist = min(dist, minDist);
        } //<>//
      } //<>//
      if ( minDist < MIN_DIST) { //<>//
        break; //<>//
      }
      currentX += cos(dir_) * minDist; //<>//
      currentY += sin(dir_) * minDist; //<>//
    } //<>//
    
    toX_ = currentX; //<>//
    toY_ = currentY; //<>//
    hit_ = minDist < MIN_DIST; //<>// //<>//
  }

  void render() {
    if (hit_) {
      stroke(200, 0, 0);
    } else {
      stroke(0, 200, 0);
    }
    line(fromX_, fromY_, toX_, toY_);
  }
}
