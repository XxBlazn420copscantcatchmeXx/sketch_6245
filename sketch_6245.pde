ArrayList<Dyr> dyreliste = new ArrayList<Dyr>();

void setup(){
  size(500, 500);
}

public class Dyr {
  int posX, posY;
  int movementX, movementY;
  boolean out = false;
  
  Dyr(int x, int y, int movX, int movY){
    this.posX = x;
    this.posY = y;
    this.movementX = movX;
    this.movementY = movY;
  }
  
  void move(){
    posX += movementX;
    posY += movementY;
    
    if(posX > (width+100) || posX < -100 || posY > (height+100) || posY < -100)
      out = true;
  }
  
  void display(){
    //Tom, da base-klassen for Dyr ikke tegnes på en bestemt måde
  }
}

public class Fly extends Dyr {
  Fly(int x, int y){
    super(x, y, 3, -1);
  }
  
  void display(){
    fill(20);
    circle(posX, posY+(sin(posX)*10), 30);
  }
}

public class Pig extends Dyr {
  Pig(int x, int y){
    super(x, y, 2, 0);
  }
  
  void display(){
    fill(255, 237, 241);
    circle(posX, posY, 60);
    fill(255, 181, 196);
    circle(posX, posY+7, 20);
    fill(30);
    circle(posX-5, posY+7, 5);
    circle(posX+5, posY+7, 5);
  }
}

void draw (){
  background(55);
  fill(255);
  textSize(32);
  text("Antal dyr: " + dyreliste.size(), 10, 30); 
  
  for(Dyr d : dyreliste){
    d.display();
    d.move();
  }
  
  for(int i=0; i<dyreliste.size(); i++){
    Dyr d = dyreliste.get(i);
    if(d.out){
      dyreliste.remove(i);
      //Da der er fjernet et element fra listen, tælles i en ned, så vi ikke springer noget over
      i--;
    }
  }
}
    
void keyPressed(){
  int x = (int)random(width);
  int y = (int)random(height);
  if(key == 'a')
    dyreliste.add(new Fly(x, y));
  else if(key == 'b')
    dyreliste.add(new Pig(x, y));
}
