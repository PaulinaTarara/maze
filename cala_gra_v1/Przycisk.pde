// klasa opisująca przycisk

class Przycisk {
  
  Button klik;
  
  boolean display = false;
  
  // konstruktor przycisku
  Przycisk(String etykietaPrzycisku, int pktX, int pktY, int szerokosc, int dlugosc) {
    
    klik = cp5.addButton(etykietaPrzycisku)
     .setPosition(pktX, pktY)                  // współrzędne lewego górnego rogu pola tekstowego
     .setSize(szerokosc, dlugosc)              // szerokość i długość przycisku
     .setColorLabel(color(#2c1f70))            // kolor fontu na przycisku
     .setFont(createFont("fixedsys.ttf",20))   // font tekstu
     .setColorBackground(color(255, 255, 255)) // kolor przycisku
     .setColorForeground(color(#c2cbd4))       // kolor przycisku po najechaniu myszką
     .setColorActive(color(#c2cbd4))           // kolor przycisku po kliknięciu
     .activateBy(ControlP5.PRESSED)            // sposób aktywacji przycisku (po kliknięciu)
     .setSwitch(true)
     ;
     
  }

// funkcja definiująca włączanie przycisku
boolean status() {
  if (klik.isOn()) {
    return true;
  }
  else {return false;}
}

// funkcja chowająca przycisk
void schowaj() {
 if (display == false) {
    klik.hide();
 } else {
   klik.show();
}    
} 

// funkcja wyświetlająca przycisk
void ujawnij() {
 if (display == false) {
    klik.show();
 } else {
   klik.hide();
}    
}   

}
