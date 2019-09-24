import processing.net.*;

Matrix mat;
BarreBoutons bb;

ArrayList <Bouton> clickedButton;

Bouton btnSend;

int matWidth = 64;
int matHeight = 64;
int matW;
int matH;

int bpp = 3;

int currentColor = color (255);

void setup () {
  size (800, 800);
  
  initMat();
  initBB();
  //initButtons();
  
}

void update() {
  manageMouse();
  
}

void initMat() {
  matW = 640;
  matH = 640;
  
  mat = new Matrix (matWidth, matHeight, bpp, matW, matH);
  mat.clear(color (0, 0, 0));
}

void initBB() { //<>//
  bb = new BarreBoutons(5, 650, 10);
  
  bb.setBackgroundColorAt(0, color(255));
  bb.setEnabledBorderColorAt(0, color(255));
  
  bb.setBackgroundColorAt(1, color(0));
  bb.setEnabledBorderColorAt(1, color(255));
  
  bb.setBackgroundColorAt(2, color(255, 0, 0));
  bb.setEnabledBorderColorAt(2, color(255));
  
  bb.setBackgroundColorAt(3, color(0, 255, 0));
  bb.setEnabledBorderColorAt(3, color(255));
  
  bb.setBackgroundColorAt(4, color(0, 0, 255));
  bb.setEnabledBorderColorAt(4, color(255));
  
  bb.horizontal = false;
  bb.exclusif = true;
  bb.mettreAJour();
}

void initButtons() {
  btnSend = new Bouton(width - 75, 50);
  btnSend.couleurActif = color(200);
  btnSend.couleurFond = color (127);
  
}

void display() {
  mat.display();
  bb.display();
  
}


void manageMouse() {
  if (mousePressed) {
    int mX = mouseX;
    int mY = mouseY;
    
    if (mouseButton == LEFT) {
      bb.updateClick();
      
      manageButtonBar();
      
            
      
      if (mX < mat.w && mX > 0 && mY < mat.h && mY > 0) {
        int i = mat.getCellColFromMouse(mX); //<>//
        int j = mat.getCellRowFromMouse(mY);
        
        mat.setCellColor(i, j, currentColor);
      }
      
      
      
    } else if (mouseButton == RIGHT) {
      println (mat.toString());
    }
    
  }  
}

void manageButtonBar() {
  clickedButton = bb.getActiveButtons();
  
  if (clickedButton.size() > 0) {
    currentColor = clickedButton.get(0).couleurFond;
  }
}

void draw () {
  update();
  display();
}

void keyPressed () {
  if (key == 's') {
    println ("sending...");
    sendData();
  }
}

void sendData() {
  Client c;
  String ipAddress = "127.0.0.1";
  int port = 32999;


  c = new Client (this, ipAddress, port);
  
  JSONObject json = new JSONObject();
  
  String data = "";
  int bpp = 3;
  
  json.setString ("command", "pushData");
  json.setInt("bytePerPixel", bpp);
  json.setString("data", mat.toString());
  json.setInt("cols", mat.cols);
  json.setInt("rows", mat.rows);
  
  c.write(json.toString() + "~");
  //c.stop();
  c = null;
}
