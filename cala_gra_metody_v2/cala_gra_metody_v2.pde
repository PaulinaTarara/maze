// Importowanie bibliotek
//import processing.serial.*;
import controlP5.*;
import processing.sound.*;

// Obiekty, z zaimportowanych bibliotek
//SoundFile blip;
//Serial myPort;
ControlP5 cp5;

// Zmienna globalna, w której będziemy przechowywać dane z Arduino
String swiatlo;

// Zmienne przechowujące obrazy
PImage start_screen, zagadka, zamek;

// Tablica zawierająca startowe kolory kryształów - jeden element to jeden kryształ
color[] krysztal = {color(0,255,0), color(0,255,0), color(0,255,0), color(0,255,0), color(0,255,0),color(255,0,0)};

// definiowanie przycisków
Przycisk dalej;
Przycisk elektrycerz1;
Przycisk elektrycerz2;
Przycisk elektrycerz3;
Przycisk zasadyGry;
Przycisk rozpocznijGre;
Przycisk zagrajJeszcze;
Przycisk zamknij;

// definiowanie pól tekstowych
PoleTekstowe instrukcja;
PoleTekstowe zasady;
PoleTekstowe wyborPostaci;
PoleTekstowe imieElektrycerz1;
PoleTekstowe imieElektrycerz2;
PoleTekstowe imieElektrycerz3;


// teksty do umieszczenia na przyciskach i ekranach startowych

String tekstInstrukcja = "                  Witaj Awanturniku!"
                    +"\n\nUważasz, że szczęście Ci sprzyja? Czeka Cię podróż na Kryonię, lodową planetę, gdzie słońce nie sięga! W świetle zórz polarnych  i lodowych pałacy szukaj klejnotów i drogocennych kamieni!\n"
                    +"\nJednak strzeż się! Klejnotów pilnują Kryonidzi - olbrzymy wyciosani z górskich kryształów! Zastanów się dwa razy zanim podejmiesz z nimi walkę!\n"
                    +"\n            Wybierz postać którą chcesz grać:";

String tekstZasady = "Zasady Gry:\n"
                        +"\n1. Na całą grę posiadasz 3 życia (czerwone diody)."
                        +"\n2. W sumie możesz zebrać 10 klejnotów (niebieskie diody)."
                        +"\n3. Celem gry jest zdobycie serca Kryonii, klejnotu ukrytego w pałacu królewskim (żółta dioda)."
                        +"\n4. Musisz ukończyć grę w 3 minuty - po tym czasie co 10 sekund tracisz jedno życie!";
                        
String tekstWyborPostaci = "Wybrana postać: ";
String tekstImieElektrycerz1 = "Elektrycerz Mosiężny";
String tekstImieElektrycerz2 = "Elektrycerz Żelazny";
String tekstImieElektrycerz3 = "Elektrycerz Kwarcowy";

// tablica images z lodowymi elementami
// Po co nam są te lodowe elementy
PImage[] ice_walls = new PImage[9];

// tablica images z elektrycerzami
PImage[] rycerze = new PImage[3];

// tablica images z ekranami zakońćzenia
PImage[] game_over = new PImage[3];

// tablica lokująca lodowe elementy na miejsce
wall[] walls;

wall sciana;

float x, y;      //współrzędne odpowiadające rycerzom
float speed = 5; //prędkość rycerza

int x_knight = 40;  //szerokość rycerza
int y_knight = 55;  //wysokość rycerza

void setup() {
  size(1035,1035);
  
  /*
  // Wgranie dźwięku
  blip = new SoundFile(this, "blip.mp3");
  
  // Połączenie z Arduino
  myPort = new Serial(this, Serial.list()[0], 9600);
  */
  
  // ładowanie ekranu startowego
  start_screen = loadImage("ekran startowy.png");
  
  // ładowanie zamku
  zamek = loadImage("zamek.png");
  zagadka = loadImage("zagadka.png");
  
  cp5 = new ControlP5(this);
  
  // tworzenie pól tekstowych
  zasady = new PoleTekstowe("Zasady gry", 250, 200, 500, 250);  
  zasady.przypisanieTekstu(tekstZasady);
  
  wyborPostaci = new PoleTekstowe("Wybrana Postać", 200, 720, 200, 60);
  wyborPostaci.przypisanieTekstu(tekstWyborPostaci);
  
  instrukcja = new PoleTekstowe("Instrukcja", 200, 100, 600, 450);
  instrukcja.przypisanieTekstu(tekstInstrukcja);
  
  imieElektrycerz1 = new PoleTekstowe("Wybrano Elektrycerz1", 405, 720, 300, 60);
  imieElektrycerz1.przypisanieTekstu(tekstImieElektrycerz1);
  
  imieElektrycerz2 = new PoleTekstowe("Wybrano Elektrycerz2", 405, 720, 300, 60);
  imieElektrycerz2.przypisanieTekstu(tekstImieElektrycerz2);
  
  imieElektrycerz3 = new PoleTekstowe("Wybrano Elektrycerz3", 405, 720, 300, 60);
  imieElektrycerz3.przypisanieTekstu(tekstImieElektrycerz2);
  
  // tworzenie pól przycisków
  dalej = new Przycisk("Dalej", 400, 600, 200, 50);
  elektrycerz1 = new Przycisk("Elektrycerz Mosiężny", 50, 600, 250, 50);
  elektrycerz2 = new Przycisk("Elektrycerz Żelazny", 375, 600, 250, 50);
  elektrycerz3 = new Przycisk("Elektrycerz Kwarcowy", 700, 600, 250, 50);
  zasadyGry = new Przycisk("Zasady Gry", 750, 900, 200, 50);
  rozpocznijGre = new Przycisk("rozpocznij Grę", 400, 800, 200, 50);
  zagrajJeszcze = new Przycisk("zagraj jeszcze raz", 400, 800, 200, 50);
  zamknij = new Przycisk("Zamknij",400, 800, 200, 50);
  
  //ładowanie images z lodowymi ścianami
  ice_walls[0] = loadImage("lodowe elementy_100_poz.png");
  ice_walls[1] = loadImage("lodowe elementy_200_poz.png");
  ice_walls[2] = loadImage("lodowe elementy_300_poz.png");
  ice_walls[3] = loadImage("lodowe elementy_100_pion.png");
  ice_walls[4] = loadImage("lodowe elementy_200_pion.png");
  ice_walls[5] = loadImage("lodowe elementy_300_pion.png");
  ice_walls[6] = loadImage("lodowe elementy_1035_pion.png");
  ice_walls[7] = loadImage("lodowe elementy_1035_poz.png");
  ice_walls[8] = loadImage("lodowe elementy_935_pion.png");
  
  //ładowanie images z elektrycerzami
  rycerze[0] = loadImage("elektrycerz mosiężny.png");
  rycerze[1] = loadImage("elektrycerz żelazny.png");
  rycerze[2] = loadImage("elektrycerz kwarcowy.png");
  
  //ładowanie images z ekranami zakończenia
  game_over[0] = loadImage("game over mosiądz.png");
  game_over[1] = loadImage("game over.png");
  game_over[2] = loadImage("game over kwarc.png");
  
  // grubość lodowej ściany
  float h_wall = 35;
  
  // tworzenie odpowiednich ścian labiryntu na odpowiednich miejscach
  walls = new wall[58];
  // poziome ściany
  walls[0] = new wall(ice_walls[7],0,0,1035,h_wall);
  walls[1] = new wall(ice_walls[0],0,100,100,h_wall);
  walls[2] = new wall(ice_walls[0],300,100,100,h_wall);
  walls[3] = new wall(ice_walls[1],700,100,200,h_wall);
  walls[4] = new wall(ice_walls[0],200,200,100,h_wall);
  walls[5] = new wall(ice_walls[2],500,200,300,h_wall);
  walls[6] = new wall(ice_walls[0],900,200,100,h_wall);
  walls[7] = new wall(ice_walls[0],100,300,100,h_wall);
  walls[8] = new wall(ice_walls[1],300,300,200,h_wall);
  walls[9] = new wall(ice_walls[2],600,300,300,h_wall);
  walls[10] = new wall(ice_walls[1],100,400,200,h_wall);
  walls[11] = new wall(ice_walls[0],400,400,100,h_wall);
  walls[12] = new wall(ice_walls[0],800,400,100,h_wall);
  walls[13] = new wall(ice_walls[1],200,500,200,h_wall);
  walls[14] = new wall(ice_walls[0],500,500,100,h_wall);
  walls[15] = new wall(ice_walls[0],900,500,100,h_wall);
  walls[16] = new wall(ice_walls[0],100,600,100,h_wall);
  walls[17] = new wall(ice_walls[0],400,600,100,h_wall);
  walls[18] = new wall(ice_walls[0],600,600,100,h_wall);
  walls[19] = new wall(ice_walls[1],0,700,200,h_wall);
  walls[20] = new wall(ice_walls[0],400,700,100,h_wall);
  walls[21] = new wall(ice_walls[1],600+h_wall,700,200,h_wall);
  walls[22] = new wall(ice_walls[0],100,800,100,h_wall);
  walls[23] = new wall(ice_walls[1],800,800,200,h_wall);
  walls[24] = new wall(ice_walls[1],100,900,200,h_wall);
  walls[25] = new wall(ice_walls[0],500,900,100,h_wall);
  walls[26] = new wall(ice_walls[0],700,900,100,h_wall);
  walls[27] = new wall(ice_walls[7],0,1000,1035,h_wall);
  // pionowe ściany
  walls[28] = new wall(ice_walls[6],0,0,h_wall,1035);
  walls[29] = new wall(ice_walls[4],100,100,h_wall,200);
  walls[30] = new wall(ice_walls[4],100,400,h_wall,200);
  walls[31] = new wall(ice_walls[3],100,800,h_wall,100);
  walls[32] = new wall(ice_walls[3],200,100,h_wall,100);
  walls[33] = new wall(ice_walls[3],200,300,h_wall,100);
  walls[34] = new wall(ice_walls[3],300,0,h_wall,100);
  walls[35] = new wall(ice_walls[3],300,200,h_wall,100);
  walls[36] = new wall(ice_walls[3],300,500+h_wall,h_wall,100);
  walls[37] = new wall(ice_walls[3],300,700,h_wall,100);
  walls[38] = new wall(ice_walls[3],400,100,h_wall,100);
  walls[39] = new wall(ice_walls[4],400,400,h_wall,200);
  walls[40] = new wall(ice_walls[4],400,700+h_wall,h_wall,200);
  walls[41] = new wall(ice_walls[3],500,0,h_wall,100);
  walls[42] = new wall(ice_walls[4],500,200+h_wall,h_wall,200);
  walls[43] = new wall(ice_walls[3],500,700,h_wall,100);
  walls[44] = new wall(ice_walls[3],600,100,h_wall,100);
  walls[45] = new wall(ice_walls[4],600,300+h_wall,h_wall,200);
  walls[46] = new wall(ice_walls[3],600,700,h_wall,100);
  walls[47] = new wall(ice_walls[3],600,900,h_wall,100);
  walls[48] = new wall(ice_walls[3],700,0,h_wall,100);
  walls[49] = new wall(ice_walls[5],700,300+h_wall,h_wall,300);
  walls[50] = new wall(ice_walls[3],700,800,h_wall,100);
  walls[51] = new wall(ice_walls[3],800,300,h_wall,100);
  walls[52] = new wall(ice_walls[4],800,500,h_wall,200);
  walls[53] = new wall(ice_walls[3],800,800+h_wall,h_wall,100);
  walls[54] = new wall(ice_walls[3],900,200+h_wall,h_wall,100);
  walls[55] = new wall(ice_walls[4],900,500+h_wall,h_wall,200);
  walls[56] = new wall(ice_walls[3],900,900,h_wall,100);
  walls[57] = new wall(ice_walls[8],1000,100,h_wall,935);
}

void draw() {
  ekran_startowy();
    
  //przejście do ekranu menu przez naciśnięcie przycisku "dalej"
  if(dalej.status() == true) {
    menu();
  }
   
  // rozpoczęcie gry po naciśnięciu przycisku "rozpocznij grę"
  if (rozpocznijGre.status() == true) {
    labirynt();
    if (millis()>15000 && elektrycerz1.status() == true){
    end_game1();
    } else if (millis()>45000 && elektrycerz3.status() == true){
     end_game3(); 
    }
  }
  
   if (x>400 && x<500 && y>400 && y<600){
     ekran_zagadka();
   }
   
   if (zamknij.status() == true){
   zamknij.schowaj();
   }
   
  if (x > width) {
    end_game2();
  } 
  
}

void ekran_startowy(){
  image(start_screen,0,0); // ekran startowy
  dalej.ujawnij();
  
  //ukrywanie przycisków, bo nie są potrzebne na ekranie startowym
  elektrycerz1.schowaj();
  elektrycerz2.schowaj();
  elektrycerz3.schowaj();
  zasadyGry.schowaj();
  rozpocznijGre.schowaj();
  zagrajJeszcze.schowaj();
  zamknij.schowaj();
  
  instrukcja.schowaj();
  zasady.schowaj();
  wyborPostaci.schowaj();
  imieElektrycerz1.schowaj();
  imieElektrycerz2.schowaj();
  imieElektrycerz3.schowaj();
  
  if(dalej.status() == true) {
    menu();
  }
}

void menu(){
  background(37, 26, 95);
      
  // ukrycie przycisku "dalej" bo na ekranie menu nie jest już potrzebny i przycisku "zagraj jeszcze" bo jeszcze nie jest potrzebny
  dalej.schowaj();
  zagrajJeszcze.schowaj();
      
  //ujawnienie przycisków, bo na ekranie menu są potrzebne
  elektrycerz1.ujawnij();
  elektrycerz2.ujawnij();
  elektrycerz3.ujawnij();
  zasadyGry.ujawnij();
  rozpocznijGre.ujawnij();
  zamknij.schowaj();
  
  instrukcja.ujawnij();
  wyborPostaci.ujawnij();
  zasady.schowaj();
  imieElektrycerz1.schowaj();
  imieElektrycerz2.schowaj();
  imieElektrycerz3.schowaj();
            
  // wyświetlenie nazwy i obrazka wybranej postaci po naciśnięciu przycisków z nazwami postaci
  if (elektrycerz1.status() == true) {
      imieElektrycerz1.ujawnij();
      image(rycerze[0],155,520);
   }
  
  else if (elektrycerz2.status() == true) {
      imieElektrycerz2.ujawnij();
      image(rycerze[1],480,520);
  }
  
  else if (elektrycerz3.status() == true) {
      imieElektrycerz3.ujawnij();
      image(rycerze[2],805,520);
  }
  
  else {
    imieElektrycerz1.schowaj();
    imieElektrycerz2.schowaj();
    imieElektrycerz3.schowaj();
  }
  
  // wyświetlenie instrukcji gry po naciśnięciu przycisku "zasady gry"
  if (zasadyGry.status() == true) {
    fill(255);
    stroke(0);
    strokeWeight(2);
    rect(200,150, 600, 400);
    zasady.ujawnij();;
    }
    
}


void labirynt(){
  // usunięcie przycisków i pól tekstowych
  elektrycerz1.schowaj();
  elektrycerz2.schowaj();
  elektrycerz3.schowaj();
  zasadyGry.schowaj();
  rozpocznijGre.schowaj();
  zagrajJeszcze.schowaj();
  zamknij.schowaj();
  
  instrukcja.schowaj(); 
  zasady.schowaj();
  wyborPostaci.schowaj();
  imieElektrycerz1.schowaj();
  imieElektrycerz2.schowaj();
  imieElektrycerz3.schowaj();
      
  background(37, 26, 95);
  // ograniczenie ruchów rycerza, żeby nie wypadł z planszy
  x = constrain(x, 35, width+40);
  y = constrain(y, 35, height+40);
  
  // wyświetlanie zamku
  image(zamek, 400, 400);
  
  // wyświetlanie ścian
  for(int i = 0; i < walls.length; i++){
    walls[i].display();
  }
  
  // Rysowanie kryształów
  for (int i = 0; i < 5; i++) {
  
  int[] xKrysztalu = {50,345,221,777,415};
  int[] yKrysztalu = {150,334,772,320,910};
  
  fill(krysztal[i]);
  noStroke();
  rect(xKrysztalu[i],yKrysztalu[i],10,10);
  }
  
  /*
  // Rysowanie wroga
  while (myPort.available() > 0) {
  swiatlo = myPort.readStringUntil('\n');
    
    if (swiatlo != null) {
      swiatlo = trim(swiatlo);
      println(swiatlo);
      
        if (int(swiatlo) > 900) {
        sciana = new wall(ice_walls[5],460,400,40,230);
        sciana.display(); 
        }
         
        else if (int(swiatlo) < 900) { 
        fill(krysztal[5]);
        noStroke();
        rect(450,450,20,20);
        
        if (x < 470 && x > 430 && y < 470 && y > 430) { 
    
         myPort.write(str(6));
           if (krysztal[5] == color(255,0,0)){
           blip.play();
           blip.amp(0.25);
           }
           krysztal[5] = color(255);
          }
      }
        else { 
        fill(0,0,255); rect(500,500,100,100); 
      }
  }   


    for (int a = 0; a < 5; a++) {
    
    int[] xwieksze = {50,345,221,777,415};
    int[] xmniejsze = {60, 355, 231, 787, 425};
    int[] ywieksze = {150,334,772,320,910};
    int[] ymniejsze = {160,344,782,330,920};
    
     
  if (x < xmniejsze[a]+10 && x > xwieksze[a]-10 && y < ymniejsze[a]+10 && y > ywieksze[a]-10) { 
    
     myPort.write(str(a+1));
     if (krysztal[a] == color(0,255,0)){
       blip.play();
       blip.amp(0.25);
     }
     krysztal[a] = color(255);
   }
  }
  */
  
  // Zmienne określające położenie, w jakim gracz może się znaleźć, którym przypisujemy jego aktualne położenie
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
       if(possibleX > (walls[i].x_wall-x_knight) && possibleX < (walls[i].x_wall + walls[i].w_wall) && (possibleY + y_knight) > walls[i].y_wall && possibleY < (walls[i].y_wall + walls[i].h_wall)){
          didCollide = true; // poza polem ścian może się poruszać
       }
    }

  // jeśli rycerz znajdzie się w obrębie ściany to przypisuje się mu współrzędną poza obszarem ściany
  if(didCollide == false){
    x = possibleX;
    y = possibleY;
   }
  
  // wyświetlanie rycerza
  if (elektrycerz1.status() == true){
       image(rycerze[0],x,y);
  }
     else if (elektrycerz2.status() == true) {
       image(rycerze[1],x,y);
     } 
     else if (elektrycerz3.status() == true) {
       image(rycerze[2],x,y);
     }
      
}

void ekran_zagadka(){
zamknij.ujawnij();
   if (!zamknij.status() == true) image(zagadka,92,321);
} 
     
void end_game1(){
// wyświetlenie ekrany końcowego  
 image(game_over[0],0,0);
 zagrajJeszcze.ujawnij();
     
 if (zagrajJeszcze.status() == true) {
   menu(); 
   zagrajJeszcze.schowaj();
 }   
}

void end_game2(){
// wyświetlenie ekrany końcowego  
 image(game_over[1],0,0);
 zagrajJeszcze.ujawnij();
     
 if (zagrajJeszcze.status() == true) {
   menu(); 
   zagrajJeszcze.schowaj();    
 }
}

void end_game3(){
// wyświetlenie ekrany końcowego  
 image(game_over[2],0,0);
 zagrajJeszcze.ujawnij();

if (zagrajJeszcze.status() == true) {
  menu(); 
  zagrajJeszcze.schowaj();
}
}
