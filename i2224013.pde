float []objX = new float [100];  //オブジェクトのx座標
float []objY = new float [100];  //オブジェクトのy座標
float []disX = new float [100];  //ｘ座標のmouseとオブジェクトの距離
float []disY = new float [100];  //ｙ座標のmouseとオブジェクトの距離
float []r = new float [100];
float []g = new float [100];
float delay;

float x, y;             //x,y座標
float ex;               //座標計算
float A=2.0;            //螺旋ふり幅
float A1, A2, A3;       //トロコイドふり幅
float w1, w2;           //角周派数
float R;                //回転半径
float k;                //回転率
float t;                //経過時間
float speed1, speed2;   //スピード
int c;

void setup() {
  size(375, 200);
  background(0);
  noStroke();
  delay=20.0;
  A1=5.0;
  A2=0.5;
  A3=1.0;
  w2=w1=1.0;
  k=0.05;
  t=0.0;
  speed1=0.05;
  speed2=0.1;
  c=255;
}

void draw() {
  //---------------左枠-----------------------------------------------------------------------------
  fill(0);
  rect(25, 25, 150, 150);

  for (int i=0; i<100; i++) {
    //マウス座標とオブジェクトの距離の計算
    disX[i] = mouseX - objX[i];
    disY[i] = mouseY - objY[i];

    //オブジェクトの移動量の計算
    objX[i] = objX[i] + disX[i]/delay;
    objY[i] = objY[i] + disY[i]/delay;

    //オブジェクトがマウス座標の+-5、左枠の上下左右に出たら
    if ((objX[i]<=mouseX+5 && mouseX-5<=objX[i] && objY[i]<=mouseY+5 && mouseY-5<=objY[i]) || 25>=objX[i] || 175<=objX[i] || 25>objY[i] || objY[i]>175) {
      if (i<=24) {                      //番号0～4の場合
        r[i]=random(100, 200);         //色を決める
        g[i]=random(100, 200);
        objX[i] = random(25, 100);     //枠内左上から生成
        objY[i] = random(25, 100);
      } else if (i>=25 && i<=49) {       //番号5～9の場合
        r[i]=random(100, 200);
        g[i]=random(100, 200);
        objX[i] = random(100, 175);    //枠内右上から生成
        objY[i] = random(25, 100);
      } else if (i>=50 && i<=74) {     //番号10～14
        r[i]=random(100, 200);
        g[i]=random(100, 200);
        objX[i] = random(25, 100);     //枠内左下から生成
        objY[i] = random(100, 175);
      } else if (i>=75) {              //番号15～19の場合
        r[i]=random(100, 200);
        g[i]=random(100, 200);
        objX[i] = random(100, 175);    //枠内右下から生成
        objY[i] = random(100, 175);
      }
    } else {
      fill(r[i], g[i], 255);
      ellipse(objX[i], objY[i], 5, 5);
    }
  }

  //-------------------------------------------------------------------------------------------------
  //------------右枠---------------------------------------------------------------------------------

  R=A*exp(k*t);    //半径

  //外トロコイド
  x = (A1 + A2)*cos(w1*t) - A3*cos(((A1 + A2)/A2)*t);
  y = (A1 + A2)*sin(w2*t) - A3*sin(((A1 + A2)/A2)*t);

  //ｘ座標の計算
  ex =x*R+275;

  //図形1（暖色）
  fill(255, c, random(255));
  ellipse(ex, y*R+height/2, 5, 5);

  //図形2（白）
  fill(255, random(50, 200));
  ellipse(ex*1.01, y*R+height/2*1.01, 3, 3);

  if (ex<185) {
    //x座標が370以下で初期化（背景以外）、色変え
    ex=0;
    R=0;
    x=y=0;
    t=0;
    c= int (random(255));
  }

  if (200<=mouseX && mouseX<=350 && 25<=mouseY && mouseY<=175) {
    t+=speed2;  //時間を進める、枠上だと早くなる
    speed2+=0.05;
    if (speed2>0.5) {  //0.3より早くはならない
      speed2=0.1;
    }
  } else {
    t+=speed1;  //時間を進める
  }
  //-----------------------------------------------------------------------------------------------
  //---------外枠--------------

  fill(255);
  rect(0, 0, 375, 25);
  rect(0, 175, 375, 25);
  rect(0, 0, 25, 200);
  rect(175, 0, 25, 200);
  rect(350, 0, 25, 200);
  //----------------------------
}

void mousePressed() {
  if (200<=mouseX && mouseX<=350 && 25<=mouseY && mouseY<=175) {
    //右側四角上でクリックで初期化
    fill(0);
    rect(200, 25, 150, 150);
    ex=0;
    R=0;
    x=y=0;
    t=0;
    c= int (random(255));
  }
   if (25<=mouseX && mouseX<=175 && 25<=mouseY && mouseY<=175) {
    //マウスを押している間、早くなる
    delay=10.0;
  }
}

void mouseDragged() {
  if (50<=mouseX && mouseX<=350 && 50<=mouseY && mouseY<=350) {
    //マウスを押している間、早くなる
    delay=10.0;
  }
}

void mouseReleased() {
  //元の速さに戻る
  delay=20.0;
}
