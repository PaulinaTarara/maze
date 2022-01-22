class PoleTekstowe {
  
  Textarea czyt;
  
  PoleTekstowe (String etykietaPola, int pktX, int pktY, int szerokosc, int dlugosc) {
    czyt = cp5.addTextarea(etykietaPola)
                  .setPosition(pktX, pktY)
                  .setSize(szerokosc, dlugosc)
                  .setFont(createFont("fixedsys.ttf",20))
                  .setLineHeight(30)
                  .setColor(color(128))
                  ;
  }
  
void przypisanieTekstu(String tekst) {
  czyt.setText(tekst);
}

void dodanieTekstu(String tekst) {
  czyt.append(tekst,1);
}

void usuniecieTekstu() {
  czyt.clear();
}

}
