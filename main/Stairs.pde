class Stairs {
  int stages = 10;
  float shrinkX = (width/3)/stages;
  float shrinkY = (height*3/4)/stages;

  float len = width/3/4;
  float open = width/2 - len - len/2;
  float close = width/2 - len;
  float gateX1 = width/2 - len;
  float gateX2 = width/2;
  float gateY = height/8;

  float pY = height-shrinkY/2;
  float playerX = width/2, playerY1 = pY-shrinkY*(n0-1), playerY2;


  void backDisplay() {
    background(200, 255, 255);

    fill(0, 0, 255);
    rect(0, height/3, width, height*2/3);

    fill(200, 100, 0);
    ellipse(width/2, height/5, width/2, height/4);
    fill(50, 200, 0);
    rect(width/4 +5, 10, width/2 -10, height/5);

    fill(255, 210, 0);
    ellipse(60, 60, 80, 80);
  }

  void stairs() {
    backDisplay();
    float rectX = width/3;
    float rectY = height-shrinkY*stages;
    float rectLen = width/3;

    fill(150);
    for (int i = 0; i < stages; i++) {
      rect(rectX - shrinkX*i, rectY+shrinkY*i, rectLen + shrinkX*(i*2), rectY);
    }
  }

  void gate(int gateTimer) {
    int gSpeed = 5;
    if (goal == 1) {
      if (gateX1 > open) {
        if (gateTimer%gSpeed == 0) {
          gateX1 --;
          gateX2 ++;
        }
      }
    } else if (goal == 0) {
      if (gateX1 < close) {
        if (gateTimer%gSpeed == 0) {
          gateX1 ++;
          gateX2 --;
        }
      }
    }
    fill(100);
    rect(width/3, height/8, width/3, height/7);
    fill(255, 255, 200);
    rect(width/2 - len/2, gateY, len*3/2, height/7);
    fill(200);
    rect(gateX1, gateY, len, height/7);
    rect(gateX2, gateY, len, height/7);
  }

  void player() {
    int pSpeed = 3;
    playerY2 = pY-shrinkY*(n-1);

    fill(255, 150, 200);
    textSize(20);
    if (n <= 10) {
      text(int(n) + "段目", width/6, height/4);
    } else if (n == 11) {
      text("クイズの都へようこそ", width/3, 30);
    }
    if (playerY1 < playerY2) {
      fill(255, 120, 200);
      if (timer%pSpeed == 0) playerY1 += 3;
    } else if (playerY1 > playerY2) {
      fill(255, 180, 200);
      if (timer%pSpeed == 0) playerY1 --;
    }
    ellipse(playerX, playerY1, 30, 50);
    ending();
  }

  void ending() {
    float end = pY-shrinkY*(10);
    if (playerY1 <= end) {
      scene = 4;
    }
  }
}
