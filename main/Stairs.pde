class Stairs {
  int stages = stairs;
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
  int diff = int(shrinkY*3/2); //画像をキャラに使用しているために生じるズレ
  float top = pY-shrinkY*(stages);

  PImage avatar = loadImage("image/character2.png");
  float sizeX = 50, sizeY = 80;
  PImage backgroundOcean = loadImage("image/background_blue_ocean.png");
  PImage city            = loadImage("image/city.png");

  void cloud() {
    background(255);
    noStroke();
    float time = frameCount * tScale;
    for (int w = 0; w < width; w += step) {
      for (int h = 0; h < height; h += step) {
        float n = noise(w * nScale + nOffset1.x + time, h * nScale + nOffset1.y - time, time);
        float r = map(n, 0, 1, red(c1), red(c2));
        float g = map(n, 0, 1, green(c1), green(c2));
        float b = map(n, 0, 1, blue(c1), blue(c2));
        fill(r, g, b);
        rect(w, h, step, step);
        fill(255, 255, 255, map(abs(n - 0.5) + 0.5, 0, 1, 255, 0));
        rect(w, h, step, step);
      }
    }
  }

  void backDisplay() {
    cloud();
    tint(255, 255, 255, 165);
    image(backgroundOcean, 0, 0, width, height);
    image(city, 0, 0, width, 150);
    tint(255, 255, 255, 255);
    stroke(0);
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

  void gate() {
    if (goal == 1) {
      if (gateX1 > open) {
        if (playerY1 <= top) {
          gateX1 --;
          gateX2 ++;
          sizeX --;
          sizeY --;
        }
      } else {
        scene = 4;

        //リスタート時のエラーをなくす
        gateX1 ++;
        gateX2 --;
        sizeX = 50;
        sizeY = 80;
        playerY1 = pY;
      }
    } else if (goal == 0) {
      if (gateX1 < close) {
        gateX1 ++;
        gateX2 --;
      }
    }
    fill(100);
    rect(width/3, height/8, width/3, height/7);
    fill(255, 255, 200);
    rect(width/2 - len/2, gateY, len*3/2, height/7);
    fill(#C1191F);
    rect(gateX1, gateY, len, height/7);
    rect(gateX2, gateY, len, height/7);
  }

  void player() {
    playerY2 = pY-shrinkY*(n-1) - diff;
    textSize(20);
    if (n <= stairs) {
      fill(255);
      rect(width/6 -5, height/4, 75, 20 +2);
      fill(255, 150, 200);
      text(int(n) + "段目", width/6, height/4);
    } else if (n == stairs + 1) {
      fill(255);
      rect(width/3 -5, 30, 210, 20 +2);
      fill(255, 0, 0);
      text("クイズの都へようこそ", width/3, 30);
    }
    if (playerY1 < playerY2) {
      playerY1 += 7;
    } else if (playerY1 > playerY2) {
      if (playerY1 > top) playerY1 -= 4;
    }
    imageMode(CENTER);
    image(avatar, playerX, playerY1, sizeX, sizeY);
    imageMode(CORNER);
  }
}
