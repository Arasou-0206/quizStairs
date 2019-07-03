class Stairs {
  int stages = 10;
  float shrinkX = (width/3)/stages;
  float shrinkY = (height*3/4)/stages;
  void backDisplay() {
    background(200, 255, 255);

    fill(0, 0, 255);
    rect(0, height/3, width, height*2/3);

    fill(255, 210, 0);
    ellipse(60, 60, 80, 80);
  }

  void stairs() {
    float lineX1 = shrinkX-1;
    float lineX2 = width-shrinkX+1;
    float lineY = height-shrinkY;
    noStroke();
    fill(150);
    triangle(0, height, width/3, height/4, width, height);
    triangle(width/3, height/4, width*2/3, height/4, width, height);
    stroke(150);
    line(width/3, height/4, width, height);

    stroke(0);
    for (int i = 0; i < stages; i++) {
      line(lineX1+shrinkX*i, lineY-shrinkY*i, lineX2-shrinkX*i, lineY-shrinkY*i);
    }
  }

  void gate(int goal) {
    float len = width/3/4;
    float gateX1 = width/2 - len;
    float gateX2 = width/2;
    float gateY = height/8;
    float open = width/2 - len - len/2;
    float close = width/2 - len;
    if (goal == 1) {
      frameRate(1);
      while (gateX1 > open) {
        gateX1 -= 0.1;
        gateX2 += 0.1;
      }
    } else if (goal == 0) {
      frameRate(1);
      while (gateX1 < close) {
        gateX1 += 0.1;
        gateX2 -= 0.1;
      }
    }
    frameRate(60);
    fill(100);
    rect(width/3, height/8, width/3, height/8);
    fill(200);
    rect(gateX1, gateY, len, height/8);
    rect(gateX2, gateY, len, height/8);
  }
}
