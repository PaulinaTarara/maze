ball player;
wall[] walls; 

void setup() {

  size(1010, 1010);

  player = new ball(50,950);

  walls = new wall[58];
  //poziome ściany
  walls[0] = new wall(0,0,width+10,10);
  walls[1] = new wall(0,100,100,10);
  walls[2] = new wall(300,100,100,10);
  walls[3] = new wall(700,100,200,10);
  walls[4] = new wall(200,200,100,10);
  walls[5] = new wall(500,200,300,10);
  walls[6] = new wall(900,200,100,10);
  walls[7] = new wall(100,300,100,10);
  walls[8] = new wall(300,300,200,10);
  walls[9] = new wall(600,300,300,10);
  walls[10] = new wall(100,400,200,10);
  walls[11] = new wall(400,400,100,10);
  walls[12] = new wall(800,400,100,10);
  walls[13] = new wall(200,500,200,10);
  walls[14] = new wall(500,500,100,10);
  walls[15] = new wall(900,500,100,10);
  walls[16] = new wall(100,600,100,10);
  walls[17] = new wall(400,600,100,10);
  walls[18] = new wall(600,600,100,10);
  walls[19] = new wall(0,700,200,10);
  walls[20] = new wall(400,700,100,10);
  walls[21] = new wall(600,700,200,10);
  walls[22] = new wall(100,800,100,10);
  walls[23] = new wall(800,800,200,10);
  walls[24] = new wall(100,900,200,10);
  walls[25] = new wall(500,900,100,10);
  walls[26] = new wall(700,900,100,10);
  walls[27] = new wall(0,1000,1000,10);
  // pionowe ściany
  walls[28] = new wall(0,0,10,900);
  walls[29] = new wall(100,100,10,200);
  walls[30] = new wall(100,400,10,200);
  walls[31] = new wall(100,800,10,100);
  walls[32] = new wall(200,100,10,100);
  walls[33] = new wall(200,300,10,100);
  walls[34] = new wall(300,0,10,100);
  walls[35] = new wall(300,200,10,100);
  walls[36] = new wall(300,500,10,100);
  walls[37] = new wall(300,700,10,100);
  walls[38] = new wall(400,100,10,100);
  walls[39] = new wall(400,400,10,200);
  walls[40] = new wall(400,700,10,200);
  walls[41] = new wall(500,0,10,100);
  walls[42] = new wall(500,200,10,210);
  walls[43] = new wall(500,700,10,100);
  walls[44] = new wall(600,100,10,100);
  walls[45] = new wall(600,300,10,210);
  walls[46] = new wall(600,700,10,100);
  walls[47] = new wall(600,900,10,100);
  walls[48] = new wall(700,0,10,100);
  walls[49] = new wall(700,300,10,310);
  walls[50] = new wall(700,800,10,100);
  walls[51] = new wall(800,300,10,100);
  walls[52] = new wall(800,500,10,210);
  walls[53] = new wall(800,800,10,110);
  walls[54] = new wall(900,200,10,110);
  walls[55] = new wall(900,500,10,200);
  walls[56] = new wall(900,900,10,100);
  walls[57] = new wall(1000,100,10,1000);
} 

void draw() {

  background(255, 255, 255); 
  noStroke(); 

  player.draw();
  player.move(walls);
  
  for(int i = 0; i < walls.length; i++){
    walls[i].draw();
  }

}

class ball {

  float x;
  float y;

  ball(float _x, float _y){
    x = _x;
    y = _y;
  }

  void draw(){
    fill(128);
    ellipse(x,y,25,25);
  }

  void move(wall[] walls){

    float possibleX = x;
    float possibleY = y;

    if (keyPressed == true) {

     // println(key);

      if (keyCode == LEFT) { 
        possibleX= possibleX - 5;
      } 
      if (keyCode == RIGHT) { 
        possibleX = possibleX + 5;
      } 
      if (keyCode == UP) { 
        possibleY = possibleY - 5;
      } 
      if (keyCode == DOWN) { 
        possibleY = possibleY + 5;
      }
    }

    boolean didCollide = false;
    for(int i = 0; i < walls.length; i++){
      if(possibleX > (walls[i].x - 10) && possibleX < (walls[i].x + walls[i].w + 10) && (possibleY + 10) > walls[i].y && possibleY < (walls[i].y + walls[i].h + 10)){
        didCollide = true;
      }
    }

    if(didCollide == false){
      x = possibleX;
      y = possibleY;
    }

  }

}

class wall {

  float x;
  float y;
  float w;
  float h;

  wall(float _x, float _y, float _w, float _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }

  void draw(){
    fill(0);
    rect(x,y,w,h);
  }

}
