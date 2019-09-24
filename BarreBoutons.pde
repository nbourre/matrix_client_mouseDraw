class BarreBoutons {
  int nombreBoutons;
  boolean exclusif = false;
  
  // Espacement entre chaque bouton
  int spacingX;
  int spacingY;
  
  // Positionnement de la barre
  int x;
  int y;
  
  boolean horizontal = true;
  
  Bouton[] boutons;
  
  int clickAcc = 0;
  int clickInterval = 200;
  int clickPreviousTime = 0;
  
  BarreBoutons (int nbBoutons) {
    spacingX = 5;
    spacingY = 3;
    
    x = 10;
    y = 10;
    
    initialiser(nbBoutons);
  }
  
  BarreBoutons (int nbBoutons, int x, int y) {
    spacingX = 5;
    spacingY = 3;
    
    this.x = x;
    this.y = y;
    
    initialiser(nbBoutons);
  }
  
  void display () {
    for (int i = 0; i < nombreBoutons; i++) {
      boutons[i].display();
    }
  }
  
  void initialiser(int nbBoutons) {
    nombreBoutons = nbBoutons;
    boutons = new Bouton[nbBoutons];
    
    for (int i = 0; i < nombreBoutons; i++) {
      boutons[i] = new Bouton();
      
      if (horizontal) {
        boutons[i].x = x + (boutons[i].largeur + spacingX) * i;
        boutons[i].y = y;
      } else {
        boutons[i].x = x;
        boutons[i].y = y + (boutons[i].hauteur + spacingY) * i;
      }     
    }
  }
  
  void mettreAJour() {
    for (int i = 0; i < nombreBoutons; i++) {
      if (horizontal) {
        boutons[i].x = x + (boutons[i].largeur + spacingX) * i;
        boutons[i].y = y;
      } else {
        boutons[i].x = x;
        boutons[i].y = y + (boutons[i].hauteur + spacingY) * i;
      }     
    }
  }
  
  
  // Mettre à jour les clics de chaque bouton
  void updateClick () {
    clickAcc += millis() - clickPreviousTime;
    clickPreviousTime = millis();
    
    if (clickAcc >= clickInterval) {
    
      clickAcc = 0;
    
      if (!exclusif) {
        for (int i = 0; i < nombreBoutons; i++) {
          boutons[i].updateClick(mouseX, mouseY);
        }
      } else {
  
        int whichOne = -1;
        for (int i = 0; i < nombreBoutons; i++) {
          if (boutons[i].updateClick(mouseX, mouseY)) {
            whichOne = i;
            break;
          }
        }
        
        if (whichOne > 0) {
          for (int i = 0; i < nombreBoutons; i++) {
            if (i == whichOne) {
              boutons[i].actif = true;
            } else {
              boutons[i].actif = false;
            }
         
          }
        }
      }
    }
  }
  
  void setBackgroundColorAt(int index, color couleur) {
    boutons[index].couleurFond = couleur;
    boutons[index].couleurActif = couleur;
  }
  
  void setEnabledColorAt(int index, color couleur) {
    boutons[index].couleurActif = couleur;
  }
  
  void setBorderColorAt(int index, color couleur) {
    boutons[index].couleurBordure = couleur;
  }
  
  void setEnabledBorderColorAt(int index, color couleur) {
    boutons[index].couleurActifBordure = couleur;
  }
  
  ArrayList<Bouton> getActiveButtons() {
    ArrayList<Bouton> resultat = new ArrayList<Bouton>();
    
    for (Bouton b : boutons) {
      if (b.actif) {
        resultat.add(b);
      }
    }
    
    return resultat;
  }
}