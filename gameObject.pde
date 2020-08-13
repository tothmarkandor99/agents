interface GameObject {
  void handleKeyPress(char key);
  void handleKeyRelease(char key);
  void update(float dt);
  void render();
  float distanceFromPoint(float x, float y);
}
