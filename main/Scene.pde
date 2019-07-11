class Scene {
  String data[] = null;
  int [] x = new int[10], y = new int[10];
  int i, mcnt = 0;
  void scene(int s) {
    background(255);
    //data = loadStrings("data/ending.txt");
    data = loadStrings("quiz.txt");  //↑元のやつ
    if (s == 0) {
      mcnt++;
      fill(0);
      textSize(60);
      //for (i = 0; i < data.length; i++) {
        for (i = 0; i < x.length; i++) {  //↑元のやつ
        x[i] = 150;
        y[i] = 600 + (i*30);
      }
      text("クイズの都", 180, 60);
      textSize(35);
      if ((mcnt % 60) < 40) {
        text("press 'Enter' key", 190, 300);
      }
    }if (s == 1) {
      mcnt++;
      fill(0);
      textSize(30);
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
      for (i = 0; i < data.length; i++) {
        y[i] -=1;
        text(data[i], x[i], y[i]);
      }
    }else if(s == 5){
      textSize(30);
      fill(255, 100, 50);
      text("残念！再挑戦するにはENTERを押してね♡", 0, height/2);
    }
  }
}
