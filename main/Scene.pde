class Scene {
  String data[] = null;
  PImage img;
  int move;
  PImage backgroundOcean = loadImage("image/background_blue_ocean.png");
  PImage nightSea                 = loadImage("image/nightSea.jpg");
  int revueX  = width * 1/2;
  int revueY  = height - 160;
  int revueW = 120;
  int revueH  = 40;

  int genreX = 30;
  int genreY = 80;
  int genreW = width - genreX * 2;
  int genreH = height - genreY - 10 ;

  int genreButtonX = width -190;
  int genreButtonY = height -45;

  void scene(int s) {
    data = loadStrings("ending.txt"); 
    background(255);
    if (s == 0) {
      move = 0;
      mcnt++;
      textSize(90);
      img = loadImage("image/sora.jpeg");
      image(img, 0, 0, width, height);

      fill(0, 0, 255);
      text("クイズの都へ", 93, 133);
      fill(255, 0, 0);
      text("クイズの都へ", 90, 130);
      textSize(35);
      fill(0);
      if ((mcnt % 60) < 30) {
        text("Mouse Click", 240, 360);
      }


      textSize(30);
      if (genreButtonX < mouseX && genreButtonY < mouseY) {
        fill(255, 255, 0);
        rect(genreButtonX, genreButtonY, 180, 40);
        fill(0);
        text("ジャンル選択", width-185, height-40);
      } else {
        fill(255, 165, 0);
        rect(genreButtonX, genreButtonY, 180, 40);
        fill(0);
        text("ジャンル選択", width-185, height-40);
      }
    }
    if (s == 1) {
      mcnt++;
      fill(0);
      textSize(30);
      img = loadImage("data/image/kanban.jpg");
      image(img, 0, 0, width, height);
      text("クイズの都・タンブリンに入るには", 85, 60);
      text(" 『クイズの階段』の試練に挑まねばならない。", 25, 150);
      text("  間違えれば階段から転げ落ちるだろう・・・。", 30, 240);
      text("  見事クイズに正解し、階段を駆け上がれ！！", 40, 330);
      if ((mcnt % 60) < 30) {
        text("Click で次へ", 270, 420);
      }
    } else if (s == 2) {
      mcnt++;
      tint(255, 255, 255, 165);
      img = loadImage("image/sora.jpeg");
      image(img, 0, 0, width, height);
      tint(255, 255, 255, 255);
      q.button();
      fill(0);
      textSize(40);
      text("操作説明", width/2 - 80, 40);
      textSize(30);
      text("Clickをすると問題が出題されます。", 110, 110);
      text("下のような○Xボタンがでますので、", width/2 - 230, 150);
      text("正解と思う方をクリックしてください。", width/2 - 250, 190);
      text("正解すると階段を登り、", 200, 230);
      text("間違えると階段を滑り落ちていきます。", 100, 270);
      if ((mcnt % 60) < 40) {
        text("Clickで", width/2-100, 450);
        fill(255, 0, 0);
        textSize(50);
        text("スタート", width/2, 430);
      }
    } else if (s == 3) {
      //game playing
    } else if (s == 4) {
      fill(0);
      textSize(30);

      int x = 150;
      int y = height + move;
      image(backgroundOcean, 0, 0, width, height);
      for (int i = 0; i < data.length-1; i++) {

        text(data[i], x, y);
        y += 30;
      }
      textSize(50);
      text(data[data.length-1], 0, y);
      if (y < height/2) {
        textSize(30);
        text("Click to Restart", width*3/4-55, height-30);
        fill(0, 255, 255);
        rectMode(CENTER);
        rect(revueX, revueY, revueW, revueH, 2);
        rectMode(CORNER);
        fill(0);
        text("レビュー", revueX - revueW / 2, revueY - revueH / 2);
      } else {
        move -= 30;
      }
    } else if (s == 5) {
      mcnt++;
      fill(255, 100, 50);
      img = loadImage("image/haka.png");
      image(img, 0, 0, width/2, height);
      textSize(80);
      text("残念！！", width/2, 30);
      textSize(30);
      text("あなたは道半ばで", width/2, height/2 - 30);
      text("息絶えてしまったようだ・・・", width/2-60, height/2);
      if ((mcnt % 60) < 20) {
        text("Click to Retry", width*3/4 - 100, height-35);
      }
    } else if (s == 6) {
      image(nightSea, 0, 0, width, height);
      println(area.getText() );
      item[commentCount] = area.getText();
      saveStrings( fileName, item);
      fill(255);
      rectMode(CENTER);
      rect(revueX, height / 2 + 80, 100, 50, 5);
      fill(0); 
      text("送信", revueX - 30, height / 2 + 65);
      rectMode(CORNER);
    } else if (s == 7) {
      background(255, 165, 0);
      int gW = (genreX * 2 + genreW) / 2 - 20;
      int gH =  (genreY * 2 + genreH) / 2 - 80;

      if (genreX <= mouseX && mouseX <= (genreX * 2 + genreW) / 2 ) {
        if (genreY <= mouseY && mouseY <= (genreY * 2 + genreH) / 2) {
          fill(255, 255, 0);
          rect(genreX - 10, genreY, gW, gH);
        } else {
          fill(255, 255, 0);
          rect(genreX - 10, (genreY * 2 + genreH) / 2, gW, gH );
        }
      } else if (  (genreX * 2 + genreW) / 2 < mouseX && mouseX <= genreX + genreW) {
        if ((genreY * 2 + genreH) / 2 <= mouseY && mouseY <= genreY + genreH) {
          fill(255, 255, 0);
          rect((genreX * 2 + genreW) / 2, (genreY * 2 + genreH) / 2, gW, gH);
        } else {
          fill(255, 255, 0);
          rect(((genreX * 2 + genreW) / 2), genreY, gW, gH);
        }
      } else {
        fill(255, 165, 0);
        rect(genreX - 10, genreY, gW, gH);
        rect(((genreX * 2 + genreW) / 2), genreY, gW, gH);
        rect(genreX - 10, (genreY * 2 + genreH) / 2, gW, gH);
        rect((genreX * 2 + genreW) / 2, (genreY * 2 + genreH) / 2, gW, gH);
      }
      fill(0);
      line((genreX * 2 + genreW) / 2, genreY,(genreX  * 2+ genreW) / 2 , genreY + genreH);
      line(genreX - 10, (genreY * 2 + genreH) / 2, genreW + genreX , (genreY * 2 + genreH) / 2);
      noFill();
      rect(genreX - 10,genreY ,genreX+genreW - 10,genreY+genreH - 80);
      fill(0);
      text("ランダム", (((genreX * 2 + genreW) / 2)  / 2) - 100, ((((genreY * 2 + genreH) / 2) + genreY) / 2 ) - 30);
      text("生き物", ((((genreX * 2 + genreW) / 2) + genreX + genreW) / 2) - 90, ((((genreY * 2 + genreH) / 2) + genreY) / 2) - 30);
      text("食べ物", (((genreX * 2 + genreW) / 2)  / 2) - 70, ((((genreY * 2 + genreH) / 2) + genreY + genreH) / 2 ) - 30);
      text("道具", ((((genreX * 2 + genreW) / 2) + genreX + genreW) / 2) - 60, ((((genreY * 2 + genreH) / 2) + genreY + genreH) / 2 ) - 30);
      fill(255);
      textSize(60);
      text("ジャンルを選択してね！", 50, 0);
    }
  }
  boolean pushRevue() {
    if (revueX - revueW / 2 <= mouseX&& revueX + revueW / 2 >= mouseX&& mouseY >= revueY - revueH / 2 && mouseY <= revueY + revueH / 2) {
      return true;
    } else {
      return false;
    }
  }

  boolean pushGenre() {
    if (genreButtonX <= mouseX && mouseX <= genreButtonX + 100) {
      if (genreButtonY <= mouseY && mouseY <= genreButtonY + 30) {
        return true;
      }
    }
    return false;
  }

  void loadData() {
    if (genreX <= mouseX && mouseX <= (genreX * 2 + genreW) / 2 ) {
      if (genreY <= mouseY && mouseY <= (genreY * 2 + genreH) / 2) {
        data = loadStrings("quiz.txt");
        newData();
        println("1");
      } else {
        data = loadStrings("quiz.txt");
        newData();
        println("3");
      }
    } else if (  (genreX * 2 + genreW) / 2 < mouseX && mouseX <= genreX + genreW) {
      if ((genreY * 2 + genreH) / 2 <= mouseY && mouseY <= genreY + genreH) {
        data = loadStrings("quiz.txt");
        newData();
        println("4");
      } else {
        data = loadStrings("animal.txt");
        newData();
        println("2");
      }
    } else {
      data = loadStrings("quiz.txt");
      newData();
    }
  }

  void newData() {
    quesTime = 0;
    ansTime = 0;
    qCount = 0;

    if (data == null) {
      print("開発者に問い合わせてください");
      exit();
    }
    question = new String[data.length / 2];
    answer   = new int[data.length / 2];
    for (int i = 0; i < data.length; i++) {
      if (i % 2 == 0) {
        question[ansTime] = data[i];
        quesTime++;
      } else {
        answer[ansTime] = int(data[i]);
        if (answer[ansTime] == 0) {
          t++;
        }
        ansTime++;
      }
    }
    num = number(data.length / 2 - 1);
  }
}
