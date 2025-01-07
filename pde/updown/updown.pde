float x, y, esize, a, b, c, i;
float d, e, f;
int lastTime; // 前回の描画タイミングを記録

void setup() {
  size(375, 200);
  noStroke();
  esize = 10;
  i = 0;
  c = 0;
  b = 0;
  a = 0;
  d = 0;
  e = 0;
  f = 0;
  lastTime = millis(); // 初期化
}

void draw() {
  // 背景の初期化
  if (c == 0) {
    fill(255);
    c = 1;
  }

  // 現在の時間を取得
  int currentTime = millis();

  // アニメーションが選択されている場合
  if (a == 1) { // 上から下へのアニメーション
    if (i == 0) {
      y = 35;
      i = 1;
    }
    fill(255, b, 0);

    // 時間経過を確認して処理を制御
    if (currentTime - lastTime > 10) { // 50ミリ秒ごとに処理を進める
      for (x = 35; x <= 165; x += 10) {
        ellipse(x, y, esize, esize);
      }
      y += 10; // y座標を更新
      b -= 10; // 色の変化
      if (b <= 0) {
        b = 255;
      }
      if (y >= 175) {
        y = 35; // 初期位置に戻す
      }
      lastTime = currentTime; // 時間を更新
    }
  } else if (a == 2) { // 下から上へのアニメーション
    if (i == 0) {
      y = 165;
      i = 1;
    }
    fill(0, b, 255);

    if (currentTime - lastTime > 10) { // 50ミリ秒ごとに処理を進める
      for (x = 210; x <= 340; x += 10) {
        ellipse(x, y, esize, esize);
      }
      y -= 10; // y座標を更新
      b -= 10; // 色の変化
      if (b <= 0) {
        b = 255;
      }
      if (y <= 25) {
        y = 165; // 初期位置に戻す
      }
      lastTime = currentTime; // 時間を更新
    }
  }

  // 初期描画
  if (d == 0 || e == 0 || f == 0) {
    fill(255, 0, 0);
    rect(0, 0, 187, 200);

    // 右画面
    fill(0, 0, 255);
    rect(187, 0, 187, 200);

    // 手前の枠
    fill(255);
    rect(0, 0, 25, 375);
    rect(175, 0, 25, 375);
    rect(350, 0, 25, 375);
    rect(0, 0, 375, 25);
    rect(0, 175, 375, 25);

    d = e = f = 1; // 初期化完了
  }
}

// マウス押下時の処理
void mousePressed() {
  if (mouseX >= 25 && mouseX <= 175 && mouseY >= 25 && mouseY <= 175) {
    a = 1; // 上から下のアニメーション
    c = 0;
    i = 0;
    d = 0;
  } else if (mouseX > 200 && mouseX < 350 && mouseY > 25 && mouseY < 175) {
    a = 2; // 下から上のアニメーション
    c = 0;
    i = 0;
    e = 0;
  } else {
    a = 0;
    i = 0;
    f = 0;
  }
}
