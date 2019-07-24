import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import javax.swing.*;
import java.awt.*;

Minim minim = new Minim(this);
AudioPlayer[] Answer;
Stairs s;
Quiz q;
Scene o;

JLayeredPane pane;
JTextField field;
JTextArea area;
JScrollPane scrollPane;

int goal = 0, game = 0, timer = 0;
int stairs = 10;
float n = 1; //何段目の階段のクイズか
float n0 = n; //直前のn
int scene = 0; //シーン切り替え値
PFont font;
int sec = 10; //制限時間
int quizLimit = sec;

int trueButton = 0;//○ボタン
int falseButton = 0;//☓ボタン
int judge;
int done = 0, isPush = 0; //押せるか押せないか
int mcnt = 0;


String[] data = null;//データ読み込み
String[] question;//クイズ問題格納
int quesTime = 0;
int[] answer;//正誤格納
int ansTime = 0;

//クイズ出題用
int[] number(int number) {
  IntList nums = new IntList(number);
  for (int i = 0; i < number; i++) {
    nums.append(i);
  };
  nums.shuffle();
  int[] result = nums.array();
  return result;
}
int qCount = 0;//出題済み総数
int[] num;
int t = 0;
//ここまで

//雲
color c1 = color(0, 0, 0);
color c2 = color(0, 255, 255);
PVector nOffset1, nOffset2;
float nScale = 0.007;
float tScale = 0.03;
float step = 5.0;

int br = 300;
int bx = int(random(300, width - 300));
int by = int(random(300, width - 300));
int bsX = 5; 
int bsY = 5;

//revue
String fileName;
String[] item;
int commentCount= 0;


void setup() {
  size(700, 500);
  font = createFont("myFont.vlw", 64);
  textFont(font);
  textAlign(LEFT, TOP);
  o = new Scene();
  s = new Stairs();
  q = new Quiz();

  //データの読み込み
  data = loadStrings("quiz.txt");
  if (data == null) {
    print("開発者に問い合わせてください");
    exit();
  }
  question = new String[data.length / 2];
  answer   = new int[data.length / 2];
  for (int i = 0; i < data.length; i++) {
    if (i % 2 == 0) {
      question[ansTime] = data[i];
      //println(question[quesTime]);
      quesTime++;
    } else {
      answer[ansTime] = int(data[i]);
      if (answer[ansTime] == 0) {
        t++;
      }
      //println(answer[ansTime]);
      ansTime++;
    }
  }
  //ここまで
  num = number(data.length / 2 - 1);

  //雲
  nOffset1 = new PVector(random(10000), random(10000));
  nOffset2 = new PVector(random(10000), random(10000));

  //正誤効果音
  Answer = new AudioPlayer[5];
  Answer[0] = minim.loadFile("BGM/incorrect1.mp3");
  Answer[1] = minim.loadFile("BGM/correct1.mp3");
  Answer[2] = minim.loadFile("BGM/info-girl1-zannen1.mp3");
  Answer[3] = minim.loadFile("BGM/plane-cloud.mp3");
  Answer[4] = minim.loadFile("BGM/wind1.mp3");


  // SmoothCanvasの親の親にあたるJLayeredPaneを取得
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();

  // 複数行のテキストボックスを作成
  area = new JTextArea();
  area.setLineWrap(true);
  area.setWrapStyleWord(true);
  scrollPane = new JScrollPane(area);
  fileName = "data/sample.txt";
  item = new String[10];
}

void draw() {
  o.scene(scene);
  if (scene == 3) {
    time();
    if (n == 0) {
      Answer[2].play();
      Answer[2].rewind();
      scene = 5;
    }
    if (game == 0 && n > 0) {
      s.stairs();
      s.gate();
      s.player();
      if (n > 0 && n <= stairs) {
        goal = 0;
        Answer[4].play();
      } else if (n == stairs + 1) {
        goal = 1;
        Answer[3].play();
      }
    } else if (game == 1) {
      Answer[4].pause();
      Answer[4].rewind();
      judge = -1;
      if (n == 1) {
        judge = q.quiz1(quizLimit);
      } else if (n == 2) {
        judge = q.quiz2(quizLimit);
      } else if (n == 3) {
        if (done == 0) {
          done = 1;
          isPush = 1;
        }
        judge = q.quiz3(quizLimit);
      } else if (n == 4) {
        if (done == 0) {
          done = 1;
          isPush = 1;
        }
        judge = q.quiz4(quizLimit);
      } else if (n == 5) {
        judge = q.quiz5(quizLimit);
      } else if (n == 6) {
        judge = q.quiz6(quizLimit);
      } else if (n == 7) {
        if (done == 0) {
          done = 1;
          isPush = 1;
        }
        judge = q.quiz7(quizLimit);
      } else if (n == 8) {
        if (done == 0) {
          done = 1;
          isPush = 1;
        }
        judge = q.quiz8(quizLimit);
      } else if (n == 9) {
        judge = q.quiz9(quizLimit);
      } else if (n == 10) {
        if (done == 0) {
          done = 1;
          isPush = 1;
        }
        judge = q.quiz10(quizLimit);
      }
      q.gimmick();
      action();
    }
  }
}

void keyPressed() {
  //main command
  /*
  if (keyCode == ENTER) {
   if (scene <= 2) {
   scene ++;
   } else if (scene == 3) {
   if (game == 0 && n <= 10) game = 1;
   } else if (scene == 4) {
   reset();
   n = 1;
   scene = 0;
   } else if (scene == 5) {
   reset();
   n = 1;
   scene = 0;
   }
   }
   */

  if (game == 1) {
    q.isButtonPushed();
  }

  //working command
  if (keyCode == UP) {
    n ++;
    reset();
  } else if (keyCode == DOWN) {
    n --;
    reset();
  } else if (key == 'd') {
    isPush = 0;
  } else if (key == 'D') {
    isPush = 1;
  } else if (key == 'b') {
    scene = 4;
  }
}

void mousePressed() {
  //main command
  if (game == 1) {
    q.isButtonPushed();
    game = 0;
  }
  if (isPush == 1) q.isClear();
  if (scene == 0) {
    if (o.pushGenre() == true) {
      scene = 7;
    } else {
      scene++;
    }
  } else if (1 <= scene&& scene <= 2) {
    scene ++;
  } else if (scene == 3) {
    if (game == 0 && n <= stairs) game = 1;
  } else if (scene == 4) {
    if (o.pushRevue() == true) {
      scrollPane.setBounds(width / 2 - 100, height / 2 - 50, 200, 100);
      pane.add(scrollPane);
      scene = 6;
    } else {
      reset();
      n = 1;
      scene = 0;
    }
  } else if (scene == 5) {
    reset();
    n = 1;
    scene = 0;
  } else if (scene == 6) {
    scrollPane.setBounds(-100, -100, 10, 10);
    pane.add(scrollPane);
    commentCount++;
    area.setText("");
    reset();
    n = 1;
    scene = 0;
  } else if (scene == 7) {
    o.loadData();
  }
  if (scene == 3 && n == 0) {
    reset();
    n = 1;
    scene = 0;
  }
}

void time() {
  timer ++;
  if (game == 1) {
    if (timer % 60 == 0) quizLimit--;
    if (quizLimit <= 0) {
      qCount++;
      n -= int(random(1, n));
      reset();
      Answer[0].play();
      Answer[0].rewind();
    }
  }
}

void action() {
  int fall = int(random(1, n));
  if (fall > 3) fall = 3;
  if (judge == 0) {
    reset();
    Answer[0].play();
    Answer[0].rewind();
    n -= fall;
  } else if (judge == 1) {
    reset();
    Answer[1].play();
    Answer[1].rewind();
    n ++;
  }
}

void reset() {
  game = 0;
  timer = 0;
  trueButton = 0;//○ボタン
  falseButton = 0;//☓ボタン
  done = 0;
  isPush = 0;
  quizLimit = sec;
  mcnt = 0;
  br = 300 - 28*int(n);
  bx = int(random(300, width - 300));
  by = int(random(300, width - 300));
  Answer[3].pause();
  Answer[3].rewind();
}

void stop() {
  for (int i = 0; i < Answer.length; i++) {
    Answer[i].close();
  }
  minim.stop();
  super.stop();
}
