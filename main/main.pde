Stairs s;
Quiz q;
Scene o;

int goal = 0, game = 0, gateTimer = 0;
int n = 1; //何段階段を登っているか
int scene = 0; //シーン切り替え値
PFont font;
int quizLimit = 10;//制限時間
int delay = 2;

void setup() {
  size(700, 500);
  font = createFont("myFont.vlw", 64);
  textFont(font);
  textAlign(LEFT, TOP);
  o = new Scene();
  s = new Stairs();
  q = new Quiz();
}

void draw() {
  if (scene == 0) {
    o.scene(0);
  } else if (scene == 1) {
    o.scene(1);
  } else if (scene == 2) {
    s.stairs();
    s.gate(goal, gateTimer);
    if (n > 0 && n <= 10) {
      goal = 0;
      s.player(n);
    } else if (n > 10) {
      goal = 1;
    }
    time();
    if (game == 1) {
      if (n == 1) {
        q.quiz1(quizLimit);
      } else if (n == 2) {
        q.quiz2(quizLimit);
      } else if (n == 3) {
        q.quiz3(quizLimit);
      } else if (n == 4) {
        q.quiz4(quizLimit);
      } else if (n == 5) {
        q.quiz5(quizLimit);
      } else if (n == 6) {
        q.quiz6(quizLimit);
      } else if (n == 7) {
        q.quiz7(quizLimit);
      } else if (n == 8) {
        q.quiz8(quizLimit);
      } else if (n == 9) {
        q.quiz9(quizLimit);
      } else {
        q.quiz10(quizLimit);
      }
    }

    gateTimer ++;
  } else if (scene == 3) {
    o.scene(3);
  }
}

//working command
void keyPressed() {
  if (key == 'o') {
    goal = 1;
  } else if (key == 'c') {
    goal = 0;
  } else if (keyCode == UP) {
    n ++;
    quizLimit = 15;
    gateTimer = 0;
  } else if (keyCode == DOWN) {
    n --;
    quizLimit = 15;
    gateTimer = 0;
  } else if (key == 'g') {
    if (scene < 3) {
      scene ++;
    }
  }else if(key == 'G'){
    if(scene > 0){
      scene --;
    }
  } else if (keyCode == ENTER) {
    game = 1;
  } else if (key == 'q') {
    game = 0;
  }
}

void time() {
  if (gateTimer % 60 == 0) {
    quizLimit--;
  }
  if ((keyPressed == true) && (key == 't')) {
    quizLimit = 30;
  }
}
