class Bouton {
  int x;
  int y;
  
  int largeur;
  int hauteur;
  
  boolean actif;
  
  color couleurBordure;
  color couleurFond;
  
  color couleurActif;
  color couleurActifBordure;
  

  
  Bouton () {
    largeur = 50;
    hauteur = 20;
    
    x = width / 2 - (largeur / 2);
    y = height / 2 - (hauteur / 2);
    
    couleurBordure = color (0);
    couleurFond = color (127, 0, 0);
    couleurActif = color (230, 0, 0);
  
  }
  
  Bouton (int _x, int _y) {
    largeur = 50;
    hauteur = 20;
    
    x = _x;
    y = _y;
    
    couleurBordure = color (0);
    couleurFond = color (127, 0, 0);
    couleurActif = color (230, 0, 0);
  }
  
  void display() {
    
    
    if (actif) {
      fill (couleurActif);
      stroke (couleurActifBordure);
    }
    else {
      fill (couleurFond);
      stroke (couleurBordure);
    }
    
    rect (x, y, largeur, hauteur);    
  }
  
  boolean updateClick(int _mouseX, int _mouseY) {
    boolean clicked = false;
    if (_mouseX > x && _mouseX < x + largeur && _mouseY > y && _mouseY < y + hauteur) {
      actif = !actif;
      clicked = true;
    }
    
    return clicked;
    
  }
}