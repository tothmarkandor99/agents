class Box implements GameObject {
  float topLeftX_, topLeftY_, bottomRightX_, bottomRightY_;

  Box(float topLeftX, float  topLeftY, float bottomRightX, float bottomRightY) {
    topLeftX_ = topLeftX;
    topLeftY_ = topLeftY;
    bottomRightX_ = bottomRightX;
    bottomRightY_ = bottomRightY;
  }

  void handleKeyPress(char key) {
  }
  void handleKeyRelease(char key) {
  }
  void update(float dt) {
  }

  void render() {
    fill(255, 160, 160);
    rectMode(CORNERS);
    rect(topLeftX_, topLeftY_, bottomRightX_, bottomRightY_);
  }

  float distanceFromPoint(float x, float y) {
    float cx = Math.max(Math.min(x, bottomRightX_ ), topLeftX_);
    float cy = Math.max(Math.min(y, bottomRightY_), topLeftY_);
    return sqrt( (x-cx)*(x-cx) + (y-cy)*(y-cy) );
  }
}
