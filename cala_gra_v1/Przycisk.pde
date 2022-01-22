class Przycisk {
  
  Button klik;
  
  Przycisk(String etykietaPrzycisku, int pktX, int pktY, int szerokosc, int dlugosc) {
    
    klik = cp5.addButton(etykietaPrzycisku)
     .setPosition(pktX, pktY)
     .setSize(szerokosc, dlugosc)
     .activateBy(ControlP5.PRESSED)
     .setSwitch(true)
     ;
  }
  
boolean status() {
  if (klik.isOn()) {
    return true;
  }
  else {return false;}
}
}
