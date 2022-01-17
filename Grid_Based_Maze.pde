//siatka
int rows = 20;
int columns = 20;

//jeśli komórka jest 'true' jest przeszkodą
//dwuwymiarowa array jako reprezentacja siatki
boolean[][] grid = new boolean[rows][columns];

//pozycja gracza na siatce
int playerIndexX = 10;
int playerIndexY = 10;

void setup() {
  size(300,300);
  
  //randomowe rozmieszczenie przeszkód na siatce
  for (int row = 0; row < grid.length; row++) {
    for (int column = 0; column < grid[row].length; column++) {
      //każda komórka ma 20% szansy na bycie przeszkodą)
      if(random(1) < 0.2) {
        grid[row][column] = true;
      }
    }
  }
}

void draw() {
  background(255);
  
  float cellWidth = width/columns;
  float cellHeight = height/rows;
  
  for (int row = 0; row < rows; row++) {
    for (int column = 0; column < columns; column++) {
      float cellX = cellWidth*column;
      float cellY = cellHeight*row;
      
      //kolorowanie przeszkód na czerwono
      if (grid[row][column]) {
        fill(255,0,0);
      } else {
        noFill();
      }
      rect(cellX, cellY, cellWidth, cellHeight);
    }
  }
  
  //kolorowanie gracza na zielono
  float playerX = playerIndexX * cellWidth;
  float playerY = playerIndexY * cellHeight;
  fill(0,255,0);
  rect(playerX, playerY, cellWidth, cellHeight);
}

void keyPressed() {
  if (keyCode == UP) {
    if (playerIndexY > 0&& !grid[playerIndexY-1][playerIndexX]) {
      playerIndexY--;
    }
  } else if (keyCode == DOWN) {
    if (playerIndexY < rows-1 && !grid[playerIndexY+1][playerIndexX]) {
      playerIndexY++;
    }
  } else if (keyCode == LEFT) {
    if (playerIndexX > 0 && !grid[playerIndexY][playerIndexX-1]) {
      playerIndexX--;
    }
  } else if (keyCode == RIGHT) {
    if (playerIndexX < columns-1 && !grid[playerIndexY][playerIndexX+1]) {
      playerIndexX++;
    }
  }
}
