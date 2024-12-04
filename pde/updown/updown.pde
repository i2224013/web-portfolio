int x, y, esize=10, a,b,c,i;
int d,e,f;
float over=0;

void setup() {
  size(375, 200);
  noStroke();
  
  i=c=b=a=0;
  d=e=f=0;
}

void draw() {
  if (mouseX > 25 && mouseX < 175 && mouseY > 25 && mouseY < 175)
  {
    over = 1;
  } else if (mouseX > 200 && mouseX < 350 && mouseY > 25 && mouseY < 175) {
    over = 2;
  } else {
    over =0;
  }

  if(c==0){
    fill(255);
    c=1;
  }
  
  if (a==1) {
    if(i==0){
      y=35;
      i=1;
    }
    fill(255,b,0);
    
    for(x=35;x<=165;x+=10){
      delay(1);
    ellipse(x, y, esize, esize);
    }
    y+=10;
    b-=10;
    
    if(b<=0){
      b=255;
    }
    if(y>=175){
      y=35;
    }
  } else if (a==2) {
    if(i==0){
      y=165;
      i=1;
    }
    fill(0,b,255);
    
    for(x=210;x<=340;x+=10){
      delay(1);
    ellipse(x, y, esize, esize);
    }
    y-=10;
    b-=10;
    
    if(b<=0){
      b=255;
    }
    if(y<=25){
      y=165;
    }
  }
  if(d==0 || e==0 || f==0){
    fill(255, 0, 0);
  rect(0, 0, ,187.5 200);

  //右画面
  fill(0, 0, 255);
  rect(187.5, 0, 187.5, 200);

  //手前の枠
  fill(255);
  rect(0, 0, 25, 375);
  rect(175, 0, 25, 375);
  rect(350, 0, 25, 375);
  rect(0, 0, 375, 25);
  rect(0, 175, 375, 25);
  
  d=e=f=1;
  }
}

void mousePressed() {
  if (over == 1) {
    a =1;
    c=0;
    i=0;
    d=0;
  } else if (over ==2) {
    a=2;
    c=0;
    i=0;
    e=0;
  } else {
    a=0;
    i=0;
    f=0;
  }
}
