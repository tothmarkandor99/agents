class Agent implements GameObject {
  float posX_, posY_;
  float vX_, vY_;
  float viewDir_;
  ArrayList<VisionRay> rays_ = new ArrayList<VisionRay>();
  Iterable<GameObject> gameObjects_;

  float RADIUS = 20;
  float SPEED = 0.2;
  float FOV = 0.3;
  int RAYS = 7;

  Agent(Iterable<GameObject> gameObjects, float posX, float posY, float dir) {
    gameObjects_ = gameObjects;
    posX_ = posX;
    posY_ = posY;
    viewDir_ = dir;
    for (int i = 0; i < RAYS; i++) {
      rays_.add(new VisionRay(this, posX_, posY_, viewDir_ + (i - RAYS / 2) * (2 * FOV / RAYS)));
    }
  }

  Agent(Iterable<GameObject> gameObjects) {
    this(gameObjects, width / 2., height / 2., 0.);
  }

  void update(float dt) {
    vX_ = 0.;
    vY_ = 0.;
    posX_ = max(min(posX_ + vX_ * dt, width), 0);
    posY_ = max(min(posY_ + vY_ * dt, height), 0);

    int i = 0;
    for (VisionRay ray : rays_) {
      ray.update(gameObjects_, posX_, posY_, viewDir_ + (i - RAYS / 2) * (2 * FOV / RAYS));
      i++;
    }
  }

  void render() {
    stroke(0);
    for (VisionRay ray : rays_) {
      ray.render();
    }

    ellipseMode(CENTER);
    fill(100, 100, 255);
    ellipse(posX_, posY_, RADIUS * 2, RADIUS * 2);
  }

  void handleKeyPress(char key) { }

  void handleKeyRelease(char key) { }

  float distanceFromPoint(float x, float y) {
    return sqrt((x - posX_) * (x - posX_) + (y - posY_) * (y - posY_)) - RADIUS;
  }
}
