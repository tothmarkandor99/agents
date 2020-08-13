class Avatar extends Agent { //<>//
  boolean pressedW, pressedS, pressedA, pressedD;

  Avatar(Iterable<GameObject> gameObjects, float posX, float posY, float dir) {
    super(gameObjects, posX, posY, dir);
  }
  
  Avatar(Iterable<GameObject> gameObjects) {
    this(gameObjects, width / 2., height / 2., 0.);
  }


  @Override
    void update(float dt) {
    vX_ = 0.;
    vY_ = 0.;
    if (pressedW) {
      vY_ -= SPEED;
    }
    if (pressedS) {
      vY_ += SPEED;
    }
    if (pressedA) {
      vX_ -= SPEED;
    }
    if (pressedD) {
      vX_ += SPEED;
    }
    posX_ = max(min(posX_ + vX_ * dt, width), 0);
    posY_ = max(min(posY_ + vY_ * dt, height), 0);

    viewDir_ = atan2(mouseY - posY_, mouseX - posX_);

    int i = 0;
    for (VisionRay ray : rays_) {
      ray.update(gameObjects_, posX_, posY_, viewDir_ + (i - RAYS / 2) * (2 * FOV / RAYS));
      i++;
    }
  }

  @Override
    void handleKeyPress(char key) {
    if (key == 'w') {
      pressedW = true;
    } else if (key == 's') {
      pressedS = true;
    } else if (key == 'a') {
      pressedA = true;
    } else if (key == 'd') {
      pressedD = true;
    }
  }

  @Override
    void handleKeyRelease(char key) {
    if (key == 'w') {
      pressedW = false;
    } else if (key == 's') {
      pressedS = false;
    } else if (key == 'a') {
      pressedA = false;
    } else if (key == 'd') {
      pressedD = false;
    }
  }
}
