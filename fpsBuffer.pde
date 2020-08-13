import java.util.LinkedList;

class FpsBuffer implements GameObject {
  LinkedList<Float> buffer_ = new LinkedList<Float>();

  FpsBuffer() {
    this(10);
  }
  FpsBuffer(int length) {
    for (int i = 0; i < length; i++) {
      buffer_.add(0.);
    }
  }

  void handleKeyPress(char _) {
  }
  void handleKeyRelease(char _) {
  }

  void update(float dt) {
    buffer_.remove();
    buffer_.add(dt);
  }

  void render() {
    float sum = 0;
    for (float fps : buffer_) {
      sum += fps;
    }
    float avg = sum / buffer_.size();
    fill(0);
    textSize(12);
    text(str(round(avg)) + " FPS", 5, 12);
  }
  
  float distanceFromPoint(float _, float __) {
    return 10000.;
  }
}
