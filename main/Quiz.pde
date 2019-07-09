class Quiz {

  int flag;

  void quizTimer(int t) {
    fill(0);
    textSize(24);
    text("制限時間:" + t + "seconds", width/2, 24);
  }

  void button() {
    rectMode(CENTER);
    noStroke();
    flag = -1;

    //土台
    fill(255, 0, 0);
    ellipse(width / 6, height * 4/5, 150, 50);
    rect(width / 6, height * 4/5 - 25/ 2, 150, 25);
    fill(0, 0, 255);
    ellipse(width * 5/6, height * 4/5, 150, 50);
    rect(width * 5/6, height * 4/5 - 25/2, 150, 25);
    fill(250, 255, 0);
    ellipse(width / 6, height * 4/5 - 25, 150, 50);
    ellipse(width * 5/6, height * 4/5 - 25, 150, 50);

    //○ボタン
    if (trueButton == 1) {
      fill(150);
      ellipse(width / 6, height * 4/5 - 25, 75, 25);
      fill(255, 0, 0);
      ellipse(width / 6, height * 4/5 - 25, 65, 15);
      fill(200);
      ellipse(width / 6, height * 4/5 - 25, 60, 10);
      flag = 1;
    } else {
      fill(0);
      ellipse(width / 6, height * 4/5 - 25/2 -5, 75, 25);
      rect(width / 6, height * 4/5 - 30, 75, 25);
      fill(200);
      ellipse(width / 6, height * 4/5 - 43, 75, 25);
      fill(255, 0, 0);
      ellipse(width / 6, height * 4/5 - 43, 65, 15);  
      fill(200);
      ellipse(width / 6, height * 4/5 - 43, 60, 10);
    }

    //☓ボタン
    if (falseButton == 1) {
      fill(150);
      ellipse(width *5/6, height * 4/5 - 25, 75, 25);
      stroke(0, 0, 255);
      strokeWeight(3);
      line(width *5/6 - 33, height * 4/5 - 30, width *5/6 + 30, height * 4/5 - 30 + 10);
      line(width *5/6 - 33 + 65, height * 4/5 - 30, width *5/6 + 30 - 65, height * 4/5 - 30 + 10);
      flag = 0;
    } else {
      fill(0);
      ellipse(width *5/6, height * 4/5 - 25/2 -5, 75, 25);
      rect(width *5/6, height * 4/5 - 30, 75, 25);
      fill(200);
      ellipse(width *5/6, height * 4/5 - 43, 75, 25);
      stroke(0, 0, 255);
      strokeWeight(3);
      line(width *5/6 - 33, height * 4/5 - 50, width *5/6 + 30, height * 4/5 - 36);
      line(width *5/6 - 33 + 65, height * 4/5-50, width *5/6 + 30 - 65, height * 4/5-36);
    }
    stroke(0);
    strokeWeight(1);
    rectMode(CORNER);
  }
  void quizWindow() {
    background(255);
    noStroke();
    fill(30, 0, 156);
    rect(5, 5, width - 10, height * 4/5-50);
    fill(250, 225, 0);
    rect(10, height / 3, width - 20, 50);
  }
  int quiz1(int time) {
    quizWindow();
    quizTimer(time);
    fill(0);
    textSize(40);
    text(question[0], 30, height/3);
    button();

    if (flag == answer[0]) {
      return 1;
    } else if (flag != answer[0] && flag != -1) {
      return 0;
    } else {
      return -1;
    }
  }
  int quiz2(int time) {
    quizWindow();
    quizTimer(time);
    fill(0);
    textSize(40);
    text(question[1], 30, height/3);
    button();

    if (flag == answer[1]) {
      return 1;
    } else if (flag != answer[1] && flag != -1) {
      return 0;
    } else {
      return -1;
    }
  }
  int quiz3(int time) {
    quizWindow();
    quizTimer(time);
    fill(0);
    textSize(40);
    text("3" + question[2], 30, height/3);
    button();

    if (flag == answer[2]) {
      return 1;
    } else if (flag != answer[2] && flag != -1) {
      return 0;
    } else {
      return -1;
    }
  }
  int quiz4(int time) {
    quizWindow();
    quizTimer(time);
    fill(0);
    textSize(40);
    text("4" + question[3], 30, height/3);
    button();

    if (flag == answer[3]) {
      return 1;
    } else if (flag != answer[3] && flag != -1) {
      return 0;
    } else {
      return -1;
    }
  }
  int quiz5(int time) {
    quizWindow();
    quizTimer(time);
    fill(0);
    textSize(40);
    text("5" + question[4], 30, height/3);
    button();

    if (flag == answer[4]) {
      return 1;
    } else if (flag != answer[4] && flag != -1) {
      return 0;
    } else {
      return -1;
    }
  }
  int quiz6(int time) {
    quizWindow();
    quizTimer(time);
    fill(0);
    textSize(40);
    text("6" + question[5], 30, height/3);
    button();

    if (flag == answer[5]) {
      return 1;
    } else if (flag != answer[5] && flag != -1) {
      return 0;
    } else {
      return -1;
    }
  }
  int quiz7(int time) {
    quizWindow();
    quizTimer(time);
    fill(0);
    textSize(40);
    text("7" + question[6], 30, height/3);
    button();

    if (flag == answer[6]) {
      return 1;
    } else if (flag != answer[6] && flag != -1) {
      return 0;
    } else {
      return -1;
    }
  }
  int quiz8(int time) {
    quizWindow();
    quizTimer(time);
    fill(0);
    textSize(40);
    text("8" + question[7], 30, height/3);
    button();

    if (flag == answer[7]) {
      return 1;
    } else if (flag != answer[7] && flag != -1) {
      return 0;
    } else {
      return -1;
    }
  }
  int quiz9(int time) {
    quizWindow();
    quizTimer(time);
    fill(0);
    textSize(40);
    text("9" + question[8], 30, height/3);
    button();

    if (flag == answer[8]) {
      return 1;
    } else if (flag != answer[8] && flag != -1) {
      return 0;
    } else {
      return -1;
    }
  }
  int quiz10(int time) {
    quizWindow();
    quizTimer(time);
    fill(0);
    textSize(40);
    text("10" + question[9], 30, height/3);
    button();

    if (flag == answer[9]) {
      return 1;
    } else if (flag != answer[9] && flag != -1) {
      return 0;
    } else {
      return -1;
    }
  }
}
