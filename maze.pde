boolean move_right, move_left, move_down, move_up;
int x, y;
int speed = 1;

void setup() {
  size(800,800);
  }

void draw() {
  if(move_down) {
    y+=speed;
  }
  if(move_up) {
    y-=speed;
  }
  if(move_right) {
    x+=speed;
  }
  if(move_left) {
    x-=speed;
  }
  background(100);
  fill(0);
  rect(10,10,width-20,height-20);
  fill(255,255,255);
  rect(100,100,100,10);
  
  x = constrain(x, 20, width-20);
  y = constrain(y, 20, height-20);
  color colorFromMousePosition = get(x,y);
    if (brightness(colorFromMousePosition) == 255) {
      fill(0,200,0);
      rect(x,y,20,20);
    } else {
      ellipse (x-1,y-1,20,20);
    }
}
  
void keyPressed() {
  if(keyCode == RIGHT) {
    move_right = true;
  }
  if(keyCode == LEFT) {
    move_left = true;
  }
  if(keyCode == DOWN) {
    move_down = true;
  }
  if(keyCode == UP) {
    move_up = true;
  }
}

void keyReleased() {
  if(keyCode == RIGHT){
    move_right = false;
  }
  if(keyCode == LEFT){
    move_left = false;
  }
  if(keyCode == DOWN){
    move_down = false;
  }
  if(keyCode == UP){
    move_up = false;
  }
}
