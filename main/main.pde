PFont font;
int fontSize = 10;   //zzは任意の整数

void setup(){
  font = createFont("myFont.vlw", 64);
  textFont(font);
  textAlign(LEFT, TOP);
}

void draw(){
  textSize(fontSize);
  text("日本語でも表示されるよ！",width,height);
}
