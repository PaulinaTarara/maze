import controlP5.*;  // importowanie biblioteki z przyciskami

PImage start_screen;

ControlP5 cp5;

// definiowanie przycisków
Przycisk dalej;
Przycisk elektrycerz1;
Przycisk elektrycerz2;
Przycisk elektrycerz3;
Przycisk zasadyGry;
Przycisk rozpocznijGre;

// definiowanie pól tekstowych
PoleTekstowe instrukcja;
PoleTekstowe zasady;
PoleTekstowe nazwaPostaci;

// teksty do umieszczenia na przyciskach i ekranach zstartowych

String tekstInstrukcja = "                                 Witaj Awanturniku!"
                    +"\n\nUważasz, że szczęście Ci sprzyja? Czeka Cię podróż na Kryonię, lodową planetę, gdzie słońce nie sięga! W świetle zórz polarnych  i lodowych pałacy szukaj klejnotów i drogocennych kamieni!\n"
                    +"\nJednak strzeż się! Klejnotów pilnują Kryonidzi - olbrzymy wyciosani z górskich kryształów! Zastanów się dwa razy zanim podejmiesz z nimi walkę!\n"
                    +"\n                      Wybierz postać którą chcesz grać:";

String tekstZasady = "Zasady Gry:\n"
                        +"\n1. Na całą grę posiadasz 3 życia (czerwone diody)."
                        +"\n2. W sumie możesz zebrać 10 klejnotów (niebieskie diody)."
                        +"\n3. Celem gry jest zdobycie serca Kryonii, klejnotu ukrytego w pałacu królewskim (żółta dioda)."
                        +"\n4. Musisz ukończyć grę w 3 minuty - po tym czasie co 10 sekund tracisz jedno życie!";
                        
String tekstPostac = "";
   
// tablica images z lodowymi elementami
PImage[] ice_walls = new PImage[6];

// tablica lokująca lodowe elementy na miejsce
wall[] walls;

float x, y;      //współrzędne odpowiadające rycerzom
float speed = 5; //prędkość rycerza

int x_knight = 25;  //szerokość rycerza
   
void setup() {
  size(1000,1000);
  
  // ładowanie ekranu startowego
  start_screen = loadImage("ekran startowy.png");
  
  cp5 = new ControlP5(this);
  
  // tworzenie pól tekstowych
  zasady = new PoleTekstowe("Zasady gry", 250, 200, 500, 250);                
  nazwaPostaci = new PoleTekstowe("Wybrana Postać", 400, 720, 300,100);
  nazwaPostaci.przypisanieTekstu(tekstPostac);
  instrukcja = new PoleTekstowe("Instrukcja", 200, 100, 600, 450);
  instrukcja.przypisanieTekstu(tekstInstrukcja);
  
  // tworzenie pól przycisków
  dalej = new Przycisk("Dalej", 400, 600, 200, 50);
  elektrycerz1 = new Przycisk("Elektrycerz Mosiężny", 50, 600, 250, 50);
  elektrycerz2 = new Przycisk("Elektrycerz Żelazny", 375, 600, 250, 50);
  elektrycerz3 = new Przycisk("Elektrycerz Kwarcowy", 700, 600, 250, 50);
  zasadyGry = new Przycisk("Zasady Gry", 750, 900, 200, 50);
  rozpocznijGre = new Przycisk("rozpocznij Grę", 400, 800, 200, 50);
  
  //ładowanie images z lodowymi ścianami
  ice_walls[0] = loadImage("lodowe elementy_100_poz.png");
  ice_walls[1] = loadImage("lodowe elementy_200_poz.png");
  ice_walls[2] = loadImage("lodowe elementy_300_poz.png");
  ice_walls[3] = loadImage("lodowe elementy_100_pion.png");
  ice_walls[4] = loadImage("lodowe elementy_200_pion.png");
  ice_walls[5] = loadImage("lodowe elementy_300_pion.png");
  
  // grubość lodowej ściany
  float h_wall = 35;
  
  // tworzenie odpowiednich ścian labiryntu na odpowiednich miejscach
  walls = new wall[54];
  // poziome ściany
  walls[0] = new wall(ice_walls[0],0,100,100,h_wall);
  walls[1] = new wall(ice_walls[0],300,100,100,h_wall);
  walls[2] = new wall(ice_walls[1],700,100,200,h_wall);
  walls[3] = new wall(ice_walls[0],200,200,100,h_wall);
  walls[4] = new wall(ice_walls[2],500,200,300,h_wall);
  walls[5] = new wall(ice_walls[0],900,200,100,h_wall);
  walls[6] = new wall(ice_walls[0],100,300,100,h_wall);
  walls[7] = new wall(ice_walls[1],300,300,200,h_wall);
  walls[8] = new wall(ice_walls[2],600,300,300,h_wall);
  walls[9] = new wall(ice_walls[1],100,400,200,h_wall);
  walls[10] = new wall(ice_walls[0],400,400,100,h_wall);
  walls[11] = new wall(ice_walls[0],800,400,100,h_wall);
  walls[12] = new wall(ice_walls[1],200,500,200,h_wall);
  walls[13] = new wall(ice_walls[0],500,500,100,h_wall);
  walls[14] = new wall(ice_walls[0],900,500,100,h_wall);
  walls[15] = new wall(ice_walls[0],100,600,100,h_wall);
  walls[16] = new wall(ice_walls[0],400,600,100,h_wall);
  walls[17] = new wall(ice_walls[0],600,600,100,h_wall);
  walls[18] = new wall(ice_walls[1],0,700,200,h_wall);
  walls[19] = new wall(ice_walls[0],400,700,100,h_wall);
  walls[20] = new wall(ice_walls[1],600+h_wall,700,200,h_wall);
  walls[21] = new wall(ice_walls[0],100,800,100,h_wall);
  walls[22] = new wall(ice_walls[1],800,800,200,h_wall);
  walls[23] = new wall(ice_walls[1],100,900,200,h_wall);
  walls[24] = new wall(ice_walls[0],500,900,100,h_wall);
  walls[25] = new wall(ice_walls[0],700,900,100,h_wall);
  // pionowe ściany
  walls[26] = new wall(ice_walls[4],100,100,h_wall,200);
  walls[27] = new wall(ice_walls[4],100,400,h_wall,200);
  walls[28] = new wall(ice_walls[3],100,800,h_wall,100);
  walls[29] = new wall(ice_walls[3],200,100,h_wall,100);
  walls[30] = new wall(ice_walls[3],200,300,h_wall,100);
  walls[31] = new wall(ice_walls[3],300,0,h_wall,100);
  walls[32] = new wall(ice_walls[3],300,200,h_wall,100);
  walls[33] = new wall(ice_walls[3],300,500+h_wall,h_wall,100);
  walls[34] = new wall(ice_walls[3],300,700,h_wall,100);
  walls[35] = new wall(ice_walls[3],400,100,h_wall,100);
  walls[36] = new wall(ice_walls[4],400,400,h_wall,200);
  walls[37] = new wall(ice_walls[4],400,700+h_wall,h_wall,200);
  walls[38] = new wall(ice_walls[3],500,0,h_wall,100);
  walls[39] = new wall(ice_walls[4],500,200+h_wall,h_wall,200);
  walls[40] = new wall(ice_walls[3],500,700,h_wall,100);
  walls[41] = new wall(ice_walls[3],600,100,h_wall,100);
  walls[42] = new wall(ice_walls[4],600,300+h_wall,h_wall,200);
  walls[43] = new wall(ice_walls[3],600,700,h_wall,100);
  walls[44] = new wall(ice_walls[3],600,900,h_wall,100);
  walls[45] = new wall(ice_walls[3],700,0,h_wall,100);
  walls[46] = new wall(ice_walls[5],700,300+h_wall,h_wall,300);
  walls[47] = new wall(ice_walls[3],700,800,h_wall,100);
  walls[48] = new wall(ice_walls[3],800,300,h_wall,100);
  walls[49] = new wall(ice_walls[4],800,500,h_wall,200);
  walls[50] = new wall(ice_walls[3],800,800+h_wall,h_wall,100);
  walls[51] = new wall(ice_walls[3],900,200+h_wall,h_wall,100);
  walls[52] = new wall(ice_walls[4],900,500+h_wall,h_wall,200);
  walls[53] = new wall(ice_walls[3],900,900,h_wall,100);
}

void draw() {
  image(start_screen,0,0); // ekran startowy
  
  //ukrywanie przycisków, bo nie są potrzebne na ekranie startowym
  elektrycerz1.schowaj();
  elektrycerz2.schowaj();
  elektrycerz3.schowaj();
  zasadyGry.schowaj();
  rozpocznijGre.schowaj();
  instrukcja.usuniecieTekstu();
  
  //przejście do ekranu menu przez naciśnięcie przycisku "dalej"
    if(dalej.status() == true) {
      background(37, 26, 95);
      dalej.schowaj(); // ukrycie przycisku "dalej" bo na ekranie menu nie jest już potrzebny
      //ojawnienie przycisków, bo na ekranie menu są potrzebne
      elektrycerz1.ujawnij();
      elektrycerz2.ujawnij();
      elektrycerz3.ujawnij();
      zasadyGry.ujawnij();
      rozpocznijGre.ujawnij();
      instrukcja.usuniecieTekstu();
      
      // wyświetlenie nazwy i obrazka wybranej postaci po naciśnięciu przycisków z nazwami postaci
      if (elektrycerz1.status() == true) {
          nazwaPostaci.dodanieTekstu("Elektrycerz Mosiężny");
          print("1 on");
      }
  
      else if (elektrycerz2.status() == true) {
          nazwaPostaci.dodanieTekstu("Elektrycerz Żelazny");
          print("2 on");
      }
  
      else if (elektrycerz3.status() == true) {
          nazwaPostaci.dodanieTekstu("Elektrycerz Kwarcowy");
          print("3 on");
      }

      else {
        nazwaPostaci.usuniecieTekstu();
      }
  
      // wyświetlenie instrukcji gry po naciśnięciu przycisku "zasady gry"
      if (zasadyGry.status() == true) {
        instrukcja.usuniecieTekstu();
        fill(255);
        stroke(0);
        strokeWeight(2);
        rect(200,150, 600, 400);
        zasady.przypisanieTekstu(tekstZasady);
        }
      else if (zasadyGry.status() == false) {
        instrukcja.przypisanieTekstu(tekstInstrukcja);
        zasady.usuniecieTekstu();
       }
   
      // rozpoczęcie gry po naciśnięciu przycisku "rozpocznij grę"
      if (rozpocznijGre.status() == true) {
        // usunięcie przycisków i pól tekstowych
        elektrycerz1.schowaj();
        elektrycerz2.schowaj();
        elektrycerz3.schowaj();
        zasadyGry.schowaj();
        rozpocznijGre.schowaj();
        instrukcja.usuniecieTekstu();
        zasady.usuniecieTekstu();
        nazwaPostaci.usuniecieTekstu();
      
        background(37, 26, 95);
        // ograniczenie ruchów rycerza, żeby nie wypadł z planszy
        x = constrain(x, 0, width-30);
        y = constrain(y, 0, height-30);
  
        // wyświetlanie ścian
        for(int i = 0; i < walls.length; i++){
          walls[i].display();
        }
  
        float possibleX = x;
        float possibleY = y;

        // przypisanie klawiszy poruszających rycerzem
        if (keyPressed == true) {
     
          if (keyCode == LEFT) { 
            possibleX= possibleX - speed;
          } 
          if (keyCode == RIGHT) { 
             possibleX = possibleX + speed;
          } 
          if (keyCode == UP) { 
            possibleY = possibleY - speed;
          } 
          if (keyCode == DOWN) { 
            possibleY = possibleY + speed;
          }
        }

         // ograniczenie ruchu rycerza, gdy znajdzie się wewnętrz ściany
         boolean didCollide = false;
          for(int i = 0; i < walls.length; i++){
            if(possibleX > (walls[i].x_wall-x_knight) && possibleX < (walls[i].x_wall + walls[i].w_wall) && (possibleY + x_knight) > walls[i].y_wall && possibleY < (walls[i].y_wall + walls[i].h_wall)){
              didCollide = true; // poza polem ścian może się poruszać
            }
          }

         // jeśli rycerz znajdzie się w obrębie ściany to przypisuje się mu współrzędną poza obszarem ściany
         if(didCollide == false){
           x = possibleX;
           y = possibleY;
         }
  
         // wyświetlanie rycerza
         ellipseMode(CORNER);
         ellipse(x,y,25,25);
      
      
        }
     }
  
}
