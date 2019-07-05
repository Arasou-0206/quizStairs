class Quiz {
  void timer(int t) {
    background(255);
    fill(0);
    textSize(24);
    text("制限時間:" + t + "seconds", width/2, 24);
  }

  void button() {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noStroke();
    
    //土台
    fill(255, 0, 0);
    ellipse(width / 6, height * 4/5, 150, 50);
    rect(width / 6, height * 4/5 - 25/ 2, 150, 25);
    fill(0,0,255);
    ellipse(width * 5/6, height * 4/5, 150, 50);
    rect(width * 5/6, height * 4/5 - 25/2, 150, 25);
    fill(250, 255, 0);
    ellipse(width / 6, height * 4/5 - 25, 150, 50);
    ellipse(width * 5/6, height * 4/5 - 25, 150, 50);
    
    //○ボタン
    if(trueButton == 1){
      fill(150);
      ellipse(width / 6, height * 4/5 - 25,75,25);
      fill(255,0,0);
      ellipse(width / 6, height * 4/5 - 25,65,15);
      fill(200);
      ellipse(width / 6, height * 4/5 - 25,60,10);
    }else{
      fill(0);
      ellipse(width / 6, height * 4/5 - 25/2 -5,75,25);
      rect(width / 6, height * 4/5 - 30, 75, 25);
      fill(200);
      ellipse(width / 6, height * 4/5 - 43,75,25);
      fill(255,0,0);
      ellipse(width / 6, height * 4/5 - 43,65,15);  
      fill(200);
      ellipse(width / 6, height * 4/5 - 43,60,10);
    }
    
    //☓ボタン
    if(falseButton == 1){
      fill(150);
      ellipse(width *5/6, height * 4/5 - 25,75,25);
      stroke(0,0,255);
      strokeWeight(3);
      line(width *5/6 - 33, height * 4/5 - 30,width *5/6 + 30, height * 4/5 - 30 + 10);
      line(width *5/6 - 33 + 65,height * 4/5 - 30, width *5/6 + 30 - 65, height * 4/5 - 30 + 10);
    }else{
      fill(0);
      ellipse(width *5/6, height * 4/5 - 25/2 -5,75,25);
      rect(width *5/6, height * 4/5 - 30, 75, 25);
      fill(200);
      ellipse(width *5/6, height * 4/5 - 43,75,25);
      stroke(0,0,255);
      strokeWeight(3);
      line(width *5/6 - 33, height * 4/5 - 50,width *5/6 + 30, height * 4/5 - 36);
      line(width *5/6 - 33 + 65,height * 4/5-50, width *5/6 + 30 - 65, height * 4/5-36);
    }
  }

  void quiz1(int time) {
    timer(time);
    textSize(40);
    text("1,ヒグラシはカナカナカナと鳴く?", 0, height/3);
    button();
  }
  void quiz2(int time) {
    timer(time);
    textSize(40);
    text("2,ヒグラシはカナカナカナと鳴く?", 0, height/3);
    button();
  }
  void quiz3(int time) {
    timer(time);
    textSize(40);
    text("3,ヒグラシはカナカナカナと鳴く?", 0, height/3);
    button();
  }
  void quiz4(int time) {
    timer(time);
    textSize(40);
    text("4,ヒグラシはカナカナカナと鳴く?", 0, height/3);
    button();
  }
  void quiz5(int time) {
    timer(time);
    textSize(40);
    text("5,ヒグラシはカナカナカナと鳴く?", 0, height/3);
    button();
  }
  void quiz6(int time) {
    timer(time);
    textSize(40);
    text("6,ヒグラシはカナカナカナと鳴く?", 0, height/3);
    button();
  }
  void quiz7(int time) {
    timer(time);
    textSize(40);
    text("7,ヒグラシはカナカナカナと鳴く?", 0, height/3);
    button();
  }
  void quiz8(int time) {
    timer(time);
    textSize(40);
    text("8,ヒグラシはカナカナカナと鳴く?", 0, height/3);
    button();
  }
  void quiz9(int time) {
    timer(time);
    textSize(40);
    text("9,ヒグラシはカナカナカナと鳴く?", 0, height/3);
    button();
  }
  void quiz10(int time) {
    timer(time);
    textSize(40);
    text("10,ヒグラシはカナカナカナと鳴く?", 0, height/3);
    button();
  }
}
