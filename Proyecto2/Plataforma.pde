class Plataforma{
 float x,y,w,h,a,z;
 Body b,j,k;
 color l;
 
 Plataforma(float x_, float y_, float w_, float h_, float a_, float z_){
  this.x=x_; 
  this.y=y_; 
  this.w=w_; 
  this.h=h_;
  
  this.a=a_;
  this.z=z_;
  
  
  this.l=color(0);
  
  BodyDef bd=new BodyDef();
  bd.type=BodyType.STATIC;
  bd.position.set(box2d.coordPixelsToWorld(x_,y_));
  
  b=box2d.createBody(bd);
  
  PolygonShape ps=new PolygonShape();
  float anchoAjustado=box2d.scalarPixelsToWorld(w_/2);
  float altoAjustado=box2d.scalarPixelsToWorld(h_/2);
  ps.setAsBox(anchoAjustado,altoAjustado);
  
  b.createFixture(ps,1);
  
  
  
  BodyDef cd=new BodyDef();
  cd.type=BodyType.STATIC;
  cd.position.set(box2d.coordPixelsToWorld(x_-40,y_-50));
  
  j=box2d.createBody(cd);
  
  float anchoAjustado1=box2d.scalarPixelsToWorld(a_/2);
  float altoAjustado1=box2d.scalarPixelsToWorld(z_/2);
  PolygonShape cs=new PolygonShape();
  cs.setAsBox(anchoAjustado1,altoAjustado1);
  
  j.createFixture(cs,1);
  
  
  
  BodyDef dd=new BodyDef();
  dd.type=BodyType.STATIC;
  dd.position.set(box2d.coordPixelsToWorld(x_+40,y_-50));
  
  k=box2d.createBody(dd);
  
  PolygonShape ds=new PolygonShape();
  ds.setAsBox(anchoAjustado1,altoAjustado1);
  
  k.createFixture(cs,1);
  
   b.setUserData(this);
   j.setUserData(this);
   k.setUserData(this);
 
 }
 
 void display(){
    Vec2 pos = box2d.getBodyPixelCoord(b);
  rectMode(CENTER);
  fill(l);
  rect(this.x,this.y,this.w,this.h);
  rect(this.x-40,this.y-50,this.a,this.z);
  rect(this.x+40,this.y-50,this.a,this.z);
  
}

 
  
    
    
 



 
   
}
