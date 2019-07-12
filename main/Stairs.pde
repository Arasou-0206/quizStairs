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

  PImage avatar = loadImage("image/character2.png");
  float sizeX = 50, sizeY = 80;
  PImage backgroundOcean = loadImage("image/background_blue_ocean.png");

  void backDisplay() {
    image(backgroundOcean, 0, 0, width, height);
    fill(200, 100, 0);
    ellipse(width/2, height/5, width/2, height/4);
    fill(50, 200, 0);
    rect(width/4 +5, 10, width/2 -10, height/5);
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
          sizeX --;
          sizeY --;
        }
      } else {
          scene = 4;
          playerY1 = pY;
          
          //リスタート時のエラーをなくす
          gateX1 ++;
          gateX2 --;
          sizeX = 50;
          sizeY = 80;
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
    int pSpeed = 2;
    int diff = int(shrinkY*3/2);
    playerY2 = pY-shrinkY*(n-1) - diff;

    fill(255, 150, 200);
    textSize(20);
    if (n <= 10) {
      text(int(n) + "段目", width/6, height/4);
    } else if (n == 11) {
      fill(255, 0, 0);
      text("クイズの都へようこそ", width/3, 30);
    }
    if (playerY1 < playerY2) {
      fill(255, 120, 200);
      if (timer%pSpeed == 0) {
        playerY1 += 3;
      }
    } else if (playerY1 > playerY2) {
      fill(255, 180, 200);
      if (timer%pSpeed == 0 && n <= 10) {
        playerY1 --;
      }
    }
  imageMode(CENTER);
    image(avatar, playerX, playerY1, sizeX, sizeY);
    imageMode(CORNER);
  }
}
