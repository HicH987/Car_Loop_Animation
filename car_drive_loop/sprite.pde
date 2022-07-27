class Sprite {

  float x, y, w, speed, index, yStart;
  int len;
  ArrayList<PImage> animation;

  Sprite(ArrayList<PImage> animation_, float x_, float y_) {
    x = x_;
    y = y_;
    animation = animation_;
    w = animation.get(0).width;
    len = animation.size();
    index = 0;
    yStart = y;
  }

  void show() {
    int index = floor(this.index) % len;
    image(animation.get(index), x, y);
  }

  void animate(float speed) {
    this.index += speed;
  }
}
