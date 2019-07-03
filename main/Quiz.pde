class Quiz {
  void quiz5(){
    background(255);
    fill(0);
    textSize(24);
    text("制限時間: 30 seconds", width/2, 24);
    textSize(40);
    text("もんじゅは実は人間ではない?", 0, height/3);
    
    textSize(80);
    fill(255, 0, 0);
    text("○", width/6, height*4/5);
    text("☓", width*5/6, height*4/5);
  }
  
}
