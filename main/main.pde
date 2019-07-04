Stairs s;
Quiz q;
int goal = 0, gateTimer = 0;
int n = 0; //何段階段を登っているか
PFont font;
int quizLimit = 10;//制限時間
int delay = 2;

void setup() {
  size(700, 500);
  font = createFont("myFont.vlw", 64);
  textFont(font);
  textAlign(LEFT, TOP);
  s = new Stairs();
  q = new Quiz();
}

void draw() {
  s.stairs();
  s.gate(goal, gateTimer);
  if (n >= 0 && n < 10) {
    goal = 0;
    s.player(n);
  } else if (n >= 10) {
    goal = 1;
  }
  
  time();
  
  if (n == 1 && quizLimit >= 0) {
    q.quiz1(quizLimit);
  }else if(n == 2&& quizLimit >= 0){
    q.quiz2(quizLimit);
  }else if(n == 3&& quizLimit >= 0){
    q.quiz3(quizLimit);
  }else if(n == 4&& quizLimit >= 0){
    q.quiz4(quizLimit);
  }else if(n == 5&& quizLimit >= 0){
    q.quiz5(quizLimit);
  }else if(n == 6&& quizLimit >= 0){
    q.quiz6(quizLimit);
  }else if(n == 7&& quizLimit >= 0){
    q.quiz7(quizLimit);
  }else if(n == 8&& quizLimit >= 0){
    q.quiz8(quizLimit);
  }else if(n == 9&& quizLimit >= 0){
    q.quiz9(quizLimit);
  }else{
    q.quiz10(quizLimit);
  }
  
  gateTimer ++;
}

//working command
void keyPressed() {
  if (key == 'o') {
    goal = 1;
  } else if (key == 'c') {
    goal = 0;
  } else if (keyCode == UP) {
    n ++;
    gateTimer = 0;
  } else if (keyCode == DOWN) {
    n --;
    gateTimer = 0;
  }
}

void time() {
  if(gateTimer % 60 == 0){
    quizLimit--;
  }
  if((keyPressed == true) && (key == 't')) {
    quizLimit = 30;
  }
}
