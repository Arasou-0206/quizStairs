class Scene {
  String data[] = null;
  PImage img;
  int i, mcnt = 0;
  int move;
  void scene(int s) {
    //data = loadStrings("data/ending.txt");
    //↑本来のやつ　pullでtxtファイルがなくエラーが出たので.
    data = loadStrings("quiz.txt"); 
    
    /* 一応消さないでおいた
    int [] x = new int[data.length];
    int [] y = new int[data.length];
    */

    background(255);
    if (s == 0) {
      move = 0;
      mcnt++;
      fill(0);
      textSize(60);
      /*
      for (i = 0; i < data.length; i++) {
        x[i] = 150;
        y[i] = height + 100;
      }
      */
      text("クイズの都", 180, 60);
      textSize(35);
      if ((mcnt % 60) < 40) {
        text("press 'Enter' key", 190, 300);
      }
    }
    if (s == 1) {
      mcnt++;
      fill(0);
      textSize(30);
      img = loadImage("data/image/kanban.jpg");
      image(img,0,0,width,height);
      text("クイズの都・タンブリンに入るには", 85, 60);
      text("『クイズの階段』の試練に挑まねばならない。", 25, 150);
      text("間違えれば階段から転げ落ちるだろう・・・。", 30, 240);
      text("見事クイズに正解し、階段を駆け上がれ！！", 40, 330);
      if ((mcnt % 60) < 40) {
        text("'Enter' keyで次へ", 200, 420);
      }
    } else if (s == 2) {
      mcnt++;
      fill(0);
      textSize(40);
      text("操作説明", 230, 60);
      textSize(30);
      if ((mcnt % 60) < 40) {
        text("'Enter' keyで次へ", 200, 420);
      }
    } else if (s == 3) {
      //game playing
    } else if (s == 4) {
      fill(0);
      textSize(30);
      
      //配列の値が変わってロールするわけではないから, 
      //int[] y は使わないと思う.
      int x = 150;
      int y = height + move;
      for (i = 0; i < data.length; i++) {
        text(data[i], x, y);
        y += 30;
      }
      move -= 1;
    } else if (s == 5) {
      textSize(30);
      fill(255, 100, 50);
      img = loadImage("data/image/haka.png");
      image(img,0,0,width*3/4,height/2);
      text("あなたは道半ばで息絶えてしまったようだ・・・", 0, height/2);
      text("Press 'Enter' to Retry",width/2,height-30);
    }
  }
}
