import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.collision.shapes.Shape;

Box2DProcessing box2d;
Particula bola;
Boundary boundaryIzq;
Boundary boundaryDer;
Boundary boundaryAbajo;
Boundary boundaryArriba;
Plataforma suelo;
PImage Inicio;
PImage Instrucciones;
PImage Juego;
PImage Chancla;
PImage empezar;
PImage empezar2;
PImage hijo;
PImage madre;

int pantallas;
int niveles;
ArrayList <Particula> bolas;

Enemigo uno;
Enemigo dos;
Enemigo tres;
Enemigo cuatro;
Enemigo cinco;


void setup(){
  
 
  size(1200,700);
  pantallas = 0;
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  box2d.listenForCollisions();
 
  bolas = new ArrayList<Particula>();
  
  uno= new Enemigo(random(900),random(50),20);
 uno= new Enemigo(random(900),random(50),20);
 dos= new Enemigo(random(900),random(50),20);
 tres= new Enemigo(random(900),random(50),20);
  cuatro = new Enemigo(random(900),500,20);
  cinco= new Enemigo(random(900),500,20);
  bola = new Particula (50,300 ,25);
  
  
  //Limite izquierdo
  boundaryIzq = new Boundary(0,height/2,10,700);
 //Limite derecho
  boundaryDer = new Boundary(1200, height/2,10,700);
 //Limite Abajo
  boundaryAbajo = new Boundary(600,700,1200,10);
//Limite Arriba
  boundaryArriba = new Boundary(600,0,1200,10);
 
  suelo=new Plataforma(1000,random(600),100,20,20,80);
  Juego=loadImage("Juego.png");
  Inicio = loadImage("Inicio.png");
  Instrucciones = loadImage("Instrucciones.png");
  Chancla = loadImage("chancla.png");
  empezar = loadImage("empezar.png");
  empezar2 = loadImage("2.png");
  hijo = loadImage("buen.png");
  madre = loadImage("decepcion.png");
}
void draw(){
background(255);

switch(pantallas){
  case 0:
          inicio();
  break;
  case 1:
          instrucciones();
  break;
  case 2:
  
          juego();
  break;
  case 3: 
          perdiste();
  break;
  case 4: 
          ganaste();
  break;
  
}


}
 
 void keyPressed()
 {
   //Pantalla de inicio a instrucciones
   if (pantallas == 0 && key == ENTER){pantallas = 1;}
   //Instrucciones a juego
   if (pantallas == 1 && key == BACKSPACE){  pantallas = 2; }
   //Reinicio  
   if (pantallas == 4 && key == BACKSPACE){setup(); pantallas = 2; }
   if (pantallas == 3 && key == BACKSPACE){setup(); pantallas = 2; }
  
   
  if(key == 'w' ){box2d.setGravity(0,70);}
  if(key == 's' ){box2d.setGravity(0,-70);}
   if(key == 'a' ){box2d.setGravity(-70,0);}
   if(key == 'd' ){box2d.setGravity(70,0);}
   
 }
 
 void beginContact(Contact cp) {
          // Get both fixtures
          Fixture f1 = cp.getFixtureA();
          Fixture f2 = cp.getFixtureB();
          // Get both bodies
          Body b1 = f1.getBody();
          Body b2 = f2.getBody();
        
          // Get our objects that reference these bodies
          Object o1 = b1.getUserData();
          Object o2 = b2.getUserData();
        
        //println(o1.getClass());
        //println(o2.getClass());
        
      //Si tocas los limites
          if (o1.getClass() == Boundary.class && o2.getClass() == Particula.class && pantallas == 2) {
 
            Particula bola = (Particula) o2;
            bola.display();
            pantallas = 3;
           
          }
      //Si se toca la cansta
           if (o1.getClass() == Plataforma.class && o2.getClass() == Particula.class && pantallas == 2 && niveles == 0) {
 
            Particula bola = (Particula) o2;
            bola.display();
            pantallas = 4;
           
          }
         
          
    }
    
void endContact(Contact cp) {
}


void inicio(){
 
   
    image (Inicio,0,0);
    scale(0.2);
    image (empezar, 2000,3000);
     
}
 
 void instrucciones(){
   
    
    image (Instrucciones, 0, 0);
    scale(0.4);
    fill(255);
    image (empezar2, 200,1500);    
 }

void juego()
{
          box2d.step();
          image(Juego,0,0);
          bola.display();
          boundaryIzq.display();
          boundaryDer.display();
          boundaryAbajo.display();
          boundaryArriba.display();
          suelo.display();
          uno.display();
          dos.display();
          tres.display();
          cuatro.display();
          cinco.display();
         
}

void ganaste()
{
  background(192,82,103);
  pushMatrix();
  scale(0.5);
  image(hijo,500,width/2);
  popMatrix();
  
  pushMatrix();
 scale(0.2);
 image(empezar2, 0,3200);
 popMatrix();
  
  
   box2d.step();
   box2d.setGravity(0,-10);
  if (random(1) < 0.1) {
    float sz = random(40);
    bolas.add(new Particula(random(width), 20, sz));
  }
  
  for (int i = bolas.size()-1; i >= 0; i--) {
    Particula p = bolas.get(i);
    p.display();
   
    
    }
  }
  

void perdiste()
{
 background(223,97,39);
 
 pushMatrix();
 scale(0.6);
 image(Chancla, 700,500);
 popMatrix();
 
 pushMatrix();
 scale(0.2);
 image(empezar2, 0,3200);
 popMatrix();
 
 pushMatrix();
 scale(0.5);
 image(madre, 300,160);
 popMatrix();

}
   
 
 
 
 
  
 
