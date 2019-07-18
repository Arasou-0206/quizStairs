class Scene {
  String data[] = null;
  PImage img;
  int move;
  PImage backgroundOcean = loadImage("image/background_blue_ocean.png");
   
  void scene(int s) {
    data = loadStrings("ending.txt"); 
    background(255);
    if (s == 0) {
      move = 0;
      mcnt++;
      textSize(90);
      img = loadImage("image/sora.jpeg");
      image(img,0,0,width,height);

      fill(0,0,255);
      text("クイズの都へ", 93, 133);
      fill(255,0,0);
      text("クイズの都へ", 90, 130);
      textSize(35);
      fill(0);
      if ((mcnt % 60) < 30) {
        text("Mouse Click",240,360);
      }
    }
    if (s == 1) {
      mcnt++;
      fill(0);
      textSize(30);
      img = loadImage("data/image/kanban.jpg");
      image(img,0,0,width,height);
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
      image(img,0,0,width,height);
       tint(255,255,255,255);
      q.button();
      fill(0);
      textSize(40);
      text("操作説明",width/2 - 80,40);
      textSize(30);
      text("Clickをすると問題が出題されます。",110,110);
      text("下のような○Xボタンがでますので、",width/2 - 230,150);
      text("正解と思う方をクリックしてください。",width/2 - 250,190);
      text("正解すると階段を登り、",200,230);
      text("間違えると階段を滑り落ちていきます。",100,270);
      if ((mcnt % 60) < 40) {
        text("Clickで", width/2-100, 450);
        fill(255,0,0);
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
      text(data[data.length-1],0,y);
      if(y < height/2){
        textSize(30);
        text("Click to Restart",width*3/4-55,height-30);
      }else{
        move -= 1;
      }
    } else if (s == 5) {
      mcnt++;
      fill(255, 100, 50);
      img = loadImage("image/haka.png");
      image(img,0,0,width/2,height);
      textSize(80);
      text("残念！！",width/2,30);
      textSize(30);
      text("あなたは道半ばで",width/2,height/2 - 30);
      text("息絶えてしまったようだ・・・", width/2-60, height/2);
      if((mcnt % 60) < 20){
        text("Click to Retry",width*3/4 - 100,height-35);
      }
    }
  }
}
