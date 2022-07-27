class HorizontaLine {

  float x1, y1, x2, y2, index;

  HorizontaLine(float x1_, float y1_, float x2_, float y2_) {
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
    index = 0;
  }

  void animatedLine(float speed) {
    float a = index * 200;
    line(x1 - a * 1.4, y1 + a, x2 + a * 1.4, y2 + a);
    index += speed / 50;
    // speed*=5;
    if (y1 + a > width) {
      index = 0;
      x1 = 237;
      y1 = 197;
      x2 = x1;
      y2 = y1;
    }
  }
}
