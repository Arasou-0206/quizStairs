Stairs s;
Quiz q;
int goal = 0;
PFont font;
//setup
void setup(){
  size(700, 500);
  font = createFont("myFont.vlw", 64);
  textFont(font);
  textAlign(LEFT, TOP);
  s = new Stairs();
  q = new Quiz();
}

void draw(){
  s.backDisplay();
  s.stairs();
  s.gate(goal);
  if(keyPressed == true && key == 'q'){
    q.quiz5();
  }
}

void keyPressed(){
  if(key == 'o'){
    goal = 1;
  }else if(key == 'c'){
    goal = 0;
  }
}
