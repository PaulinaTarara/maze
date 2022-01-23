// klasa opisująca ścianę

class wall {
  
  float x_wall; //współrzędna x ściany
  float y_wall; //współrzędna y ściany
  float w_wall; //szerokość ściany
  float h_wall; //wysokość ściany
  
  PImage img;   //definiowanie obrazka
  
  // konstruktor klasy
  wall(PImage tempImg, float _x_wall, float _y_wall, float _w_wall, float _h_wall){
    x_wall = _x_wall;
    y_wall = _y_wall;
    w_wall = _w_wall;
    h_wall = _h_wall;
    img = tempImg;
  }

// wyświetlanie klasy wall
  void display(){
    image(img,x_wall,y_wall,w_wall,h_wall);
      
  }
}
