class Scene{
  int data[] = null;
  int x = 150, y = 750, y0 = 750;
  int mcnt = 0;
  void scene(int s){
    background(255);
    if(s == 0){
      mcnt++;
      fill(0);
      textSize(60);
      text("クイズの都",190,60);
      textSize(35);
      if((mcnt % 60) < 40){
        text("press 'g' key",230,300);
      }
    }else if(s == 1){
      mcnt++;
      textSize(30);
      text("クイズの都・タンブリンに入るには",85,60);
      text("『クイズの階段』の試練に挑まねばならない。",25,150);
      text("間違えれば階段から転げ落ちるだろう・・・。",30,240);
      text("見事クイズに正解し、階段を駆け上がれ！！",40,330);
      if((mcnt % 60) < 40){
        text("'g' keyでスタート ",230,420);
      }
    }else if(s == 2){
      //game playing
    }else if(s == 3){
      fill(0);
      y -= 3;
      textSize(30);
      text("Thank you for the praying!!",x,y);
      if(y < 0) y = y0;
    }else if(s == 4){
      textSize(30);
      fill(255, 100, 50);
      text("残念！再挑戦するにはENTERを押してね♡", 0, height/2);
    }
  }
}
