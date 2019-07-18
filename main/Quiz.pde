class Quiz {
  int flag = -1;

  void quizTimer(int t) {
    fill(255, 0, 255);
    rect(width-30, 40, -t*20, 25);
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

  void isButtonPushed() {
    if (isPush == 0) {
      int w = 75, h = 50;
      int tx = width/6 - w/2, ty = height * 4/5 - 25 - w/2;
      int fx = width *5/6 - h/2, fy = height * 4/5 - 25/2 -5 - h/2;
      if (((mouseX >= tx && mouseX <= tx + w) && (mouseY >= ty && mouseY <= ty + h)) || key == 'o') {
        trueButton = 1;
        falseButton = 0;
      } else if (((mouseX >= fx && mouseX <= fx + w) && (mouseY >= fy && mouseY <= fy + h)) || key == 'x') {
        trueButton = 0;
        falseButton = 1;
      } else {
        trueButton = 0;
        falseButton = 0;
      }
    }
  }

  void gimmick() {
      
    if (isPush == 1) {
      fill(255, 200, 150);
      ellipse(bx, by, br, br);
      if (bx < br / 2 || bx > width - br / 2) {
        bsX *= -1;
      }
      if (by < br / 2 || by > height - br / 2) {
        bsY *= -1;
      }
      bx += bsX;
      by += bsY;
      }
  }
  
  void isClear(){
    if ((mouseX-bx)*(mouseX-bx) + (mouseY-by)*(mouseY-by) <= br*br) isPush = 0;
  }

  void quizWindow() {
    background(255);
    noStroke();
    fill(30, 0, 156);
    rect(5, 5, width - 10, height * 4/5-50);
    fill(250, 225, 0);
    rect(10, height / 3, width - 20, 50);
  }

  void questionText() {
    int s = question[num[qCount]].length();
    fill(0);
    if (s < 15) {
      textSize(50 - s);
    } else {
      textSize(45 - s);
    }
    text(int(n) + ":" + question[num[qCount]], 30, height/3);
  }
  int quiz1(int time) {
    quizWindow();
    quizTimer(time);
    questionText();
    button();
    if (flag == answer[num[qCount]]) {
      qCount++;
      return 1;
    } else if (flag != answer[num[qCount]] && flag != -1) {
      qCount++;
      return 0;
    } else {
      return -1;
    }
  }
  int quiz2(int time) {
    quizWindow();
    quizTimer(time);
    questionText();
    button();

    if (flag == answer[num[qCount]]) {
      qCount++;
      return 1;
    } else if (flag != answer[num[qCount]] && flag != -1) {
      qCount++;
      return 0;
    } else {
      return -1;
    }
  }
  int quiz3(int time) {
    quizWindow();
    quizTimer(time);
    questionText();
    button();

    if (flag == answer[num[qCount]]) {
      qCount++;
      return 1;
    } else if (flag != answer[num[qCount]] && flag != -1) {
      qCount++;
      return 0;
    } else {
      return -1;
    }
  }
  int quiz4(int time) {
    quizWindow();
    quizTimer(time);
    questionText();
    button();

    if (flag == answer[num[qCount]]) {
      qCount++;
      return 1;
    } else if (flag != answer[num[qCount]] && flag != -1) {
      qCount++;
      return 0;
    } else {
      return -1;
    }
  }
  int quiz5(int time) {
    String [] back = question[num[qCount]].split("");
    quizWindow();
    quizTimer(time);
    int s = question[num[qCount]].length();
    fill(0);
    if (s < 15) {
      textSize(50 - s);
    } else {
      textSize(45 - s);
    }
    text(5, 30, height/3);
    for (int i = back.length-1; i  >= 0; i--) {
      text(back[i], 30 + (back.length - i)*20, height/3);
    }
    button();

    if (flag == answer[num[qCount]]) {
      qCount++;
      return 1;
    } else if (flag != answer[num[qCount]] && flag != -1) {
      qCount++;
      return 0;
    } else {
      return -1;
    }
  }
  int quiz6(int time) {
    quizWindow();
    quizTimer(time);
    questionText();
    button();

    if (flag == answer[num[qCount]]) {
      qCount++;
      return 1;
    } else if (flag != answer[num[qCount]] && flag != -1) {
      qCount++;
      return 0;
    } else {
      return -1;
    }
  }
  int quiz7(int time) {
    quizWindow();
    quizTimer(time);
    questionText();
    button();

    if (flag == answer[num[qCount]]) {
      qCount++;
      return 1;
    } else if (flag != answer[num[qCount]] && flag != -1) {
      qCount++;
      return 0;
    } else {
      return -1;
    }
  }
  int quiz8(int time) {
    quizWindow();
    quizTimer(time);
    questionText();
    button();

    if (flag == answer[num[qCount]]) {
      qCount++;
      return 1;
    } else if (flag != answer[num[qCount]] && flag != -1) {
      qCount++;
      return 0;
    } else {
      return -1;
    }
  }
  int quiz9(int time) {
    quizWindow();
    quizTimer(time);
    questionText();
    button();

    if (flag == answer[num[qCount]]) {
      qCount++;
      return 1;
    } else if (flag != answer[num[qCount]] && flag != -1) {
      qCount++;
      return 0;
    } else {
      return -1;
    }
  }
  int quiz10(int time) {
    quizWindow();
    quizTimer(time);
    questionText();
    button();

    if (flag == answer[num[qCount]]) {
      qCount++;
      return 1;
    } else if (flag != answer[num[qCount]] && flag != -1) {
      qCount++;
      return 0;
    } else {
      return -1;
    }
  }
}
