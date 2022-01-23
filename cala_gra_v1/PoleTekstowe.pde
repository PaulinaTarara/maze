// klasa opisująca pole tekstowe

class PoleTekstowe {
  
  Textarea czyt;
  
  // konstruktor pola tekstowego
  PoleTekstowe (String etykietaPola, int pktX, int pktY, int szerokosc, int dlugosc) {
    czyt = cp5.addTextarea(etykietaPola)
                  .setPosition(pktX, pktY)                 // współrzędne lewego górnego rogu pola tekstowego
                  .setSize(szerokosc, dlugosc)             // szerokość i długość pola tekstowego
                  .setFont(createFont("fixedsys.ttf",20))  // font tekstu
                  .setLineHeight(25)                       // interlinia
                  .setColor(color(#8d9daf))                // kolor tekstu
                  ;
  }

// przypisanie tekstu do pola tekstowego, przycisku
void przypisanieTekstu(String tekst) {
  czyt.setText(tekst);
}

// wyświetlenie tekstu
void dodanieTekstu(String tekst) {
  czyt.append(tekst,1);
}

// ukrycie tekstu
void usuniecieTekstu() {
  czyt.clear();
}

}
