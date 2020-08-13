float lastTime = millis();

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

void update(float dt) {
  for (GameObject gameObject : gameObjects) {
    gameObject.update(dt);
  }
}


void render() {
  background(255, 255, 255);
  for (GameObject gameObject : gameObjects) {
    gameObject.render();
  } //<>//
}

void setup() {
  size(640, 480);
  gameObjects.add(new Avatar(gameObjects));
  gameObjects.add(new Agent(gameObjects, 200., 200., 0.0));
  gameObjects.add(new Box(20., 20., 500., 50.));
  gameObjects.add(new Box(400., 60., 430., 220.));
  gameObjects.add(new Box(400., 310., 430., 400.));
  gameObjects.add(new FpsBuffer(100));
}

void keyPressed() {
  for (GameObject gameObject : gameObjects) {
    gameObject.handleKeyPress(key);
  }
}

void keyReleased() {
  for (GameObject gameObject : gameObjects) {
    gameObject.handleKeyRelease(key);
  }
}

void draw() { //<>// //<>//
  float current = millis();
  float dt = current - lastTime;

  update(dt);
  render();

  lastTime = current;
}
