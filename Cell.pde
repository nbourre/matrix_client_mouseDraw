class Cell {
  int x;
  int y;
  int w;
  int h;
  
  color fillColor;
  
  Cell (int _x, int _y) {
    init (_x, _y, 50, 50);
  }
  
  Cell (int _x, int _y, int _w, int _h) {
    init (_x, _y, _w, _h);
  }
  
  void init(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    fillColor = color (random (255), random (255), random (255));
  }
  
  void setFillColor (color c) {
    fillColor = c;
    
  }
  
  String toStringAs3bpp() {
    return int(red (fillColor)) + " " + int(green (fillColor)) + " " + int(blue (fillColor));
  }
  
  String toStringAs1bpp() {
    return "" + fillColor;
  }
 
  color getFillColor() {
    return fillColor;
  }
  
  void display () {
    pushMatrix();
    translate (x, y);
    fill (fillColor);
    stroke (0);
    rect (0, 0, w, h);
    popMatrix();
  }
  
}