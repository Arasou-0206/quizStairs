Stairs s;
Quiz q;
int goal = 0, gt = 0;
int n = 0; //何段階段を登っているか
PFont font;

void setup(){
  size(700, 500);
  font = createFont("myFont.vlw", 64);
  textFont(font);
  textAlign(LEFT, TOP);
  s = new Stairs();
  q = new Quiz();
}

void draw(){
  s.stairs();
  s.gate(goal, gt);
  if(n >= 0 && n < 10){
    goal = 0;
    s.player(n);
  }else if(n >= 10){
    goal = 1;
  }
  
  if(keyPressed == true && key == 'q'){
    q.quiz5();
  }
  gt ++;
}

//working command
void keyPressed(){
  if(key == 'o'){
    goal = 1;
  }else if(key == 'c'){
    goal = 0;
  }else if(keyCode == UP){
    n ++;
    gt = 0;
  }else if(keyCode == DOWN){
    n --;
    gt = 0;
  }
}
