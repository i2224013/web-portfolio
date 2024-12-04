let x, y, esize = 10.5; // サイズも半分に調整
let a, b, c, i;
let d, e, f;
let over = 0;

function setup() {
  const canvas = createCanvas(375, 200); // キャンバスを新サイズに
  canvas.parent("canvas1"); // キャンバスを指定したdivに配置
  noStroke();

  i = c = b = a = 0;
  d = e = f = 0;
  b = 255;
}

function draw() {
  // マウスが左または右の領域にあるか判定
  if (mouseX > 25 && mouseX < 175 && mouseY > 25 && mouseY < 175) {
    over = 1; // 左エリア
  } else if (mouseX > 200 && mouseX < 350 && mouseY > 25 && mouseY < 175) {
    over = 2; // 右エリア
  } else {
    over = 0;
  }

  // 左画面 (赤)
  if (d == 0 || e == 0 || f == 0) {
    fill(255, 0, 0);
    rect(0, 0, 187.5, 200); // 幅と高さを半分に調整

    // 右画面 (青)
    fill(0, 0, 255);
    rect(187.5, 0, 187.5, 200);

    // 手前の枠
    fill(255);
    rect(0, 0, 25, 200);     // 左枠
    rect(175, 0, 25, 200);   // 中央枠
    rect(350, 0, 25, 200);   // 右枠
    rect(0, 0, 375, 25);     // 上枠
    rect(0, 175, 375, 25);   // 下枠

    d = e = f = 1;
  }

  if (a == 1) {
    if (i == 0) {
      y = 35; // 初期位置を半分に調整
      i = 1;
    }
    fill(255, b, 0);

    for (x = 35; x <= 165; x += 10) { // ループ範囲を調整
      ellipse(x, y, esize, esize);
    }
    y += 10; // Y座標を調整
    b -= 10;

    if (b <= 0) {
      b = 255;
    }
    if (y >= 175) {
      y = 35;
    }
  } else if (a == 2) {
    if (i == 0) {
      y = 165; // 初期位置を半分に調整
      i = 1;
    }
    fill(0, b, 255);

    for (x = 210; x <= 340; x += 10) { // ループ範囲を調整
      ellipse(x, y, esize, esize);
    }
    y -= 10; // Y座標を調整
    b -= 10;

    if (b <= 0) {
      b = 255;
    }
    if (y <= 25) {
      y = 165;
    }
  }
}

function mousePressed() {
  // 左エリアをクリック
  if (over == 1) {
    a = 1;
    c = 0;
    i = 0;
    d = 0;
  } 
  // 右エリアをクリック
  else if (over == 2) {
    a = 2;
    c = 0;
    i = 0;
    e = 0;
  } 
  // どちらでもない
  else {
    a = 0;
    i = 0;
    f = 0;
  }
}
