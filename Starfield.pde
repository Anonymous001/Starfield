//your code here
Particle []  star;
void setup()
{
  //your code here
  size(400,400);
  star = new Particle [500]; 
  for(int i = 0;i<star.length; i++) {
    if(i%2==0) {
      star[0] = new OddballParticle();
      star[i] = new NormalParticle();
    } else {
      star[1] = new OddballParticle();
      star[i] = new JumboParticle();      
    }
  }
}
void draw()
{
  //your code here
  background(0);
  for(int i = 0;i<star.length; i++){
    star[i].show();
      star[i].move();
      star[i].wrap();
  }
  noStroke();
    fill(0,0,0);
    ellipse(200,200,100,100);
}

class NormalParticle implements Particle
{
  //your code here
  double theX,theY,theAngle,theSpeed;
  int theSize;
  int[] theClr = new int[] {0,0,0};
  NormalParticle() {
    theX = (Math.random()*50)+175;
    theY = (Math.random()*50)+175;
    theAngle = Math.random()*(2*Math.PI);
    theSpeed = 5;
    theClr = new int[]{(int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255)};
    theSize = 5;
  }
  void move() {
        theX = theX + Math.cos(theAngle)*theSpeed;
        theY = theY + Math.sin(theAngle)*theSpeed;
  }
  void show() {
    noStroke();
    fill(theClr[0],theClr[1],theClr[2]);
    ellipse((float)theX,(float)theY,(float)theSize,(float)theSize);
  }
  void wrap() {
    if((theX<0)||(theX>400)||(theY<0)||(theY>400)) {
      theX = 200;
      theY = 200;
    }
  }
}
interface Particle
{
  //your code here
  public void move();
  public void show();
  public void wrap();
}
class OddballParticle implements Particle//uses an interface
{
  //your code here
  int oddX,oddY,odd1X,odd1Y;
  OddballParticle(){
    oddX = (int)(Math.random()*400);
    oddY = 100;
    odd1X = (int)(Math.random()*400);
    odd1Y = 300;
  }
  void move() {
    oddY = oddY - 1; 
    odd1Y = odd1Y + 1; 
  }
  void show() {
    fill(100,100,255);
    ellipse(oddX,oddY,15,15);
    ellipse(odd1X,odd1Y,15,15);
    ellipse(oddY,oddX,15,15);
    ellipse(odd1Y,odd1X,15,15);
  }
  void wrap() {
    if(oddY<0) {
      oddX = (int)(Math.random()*400);
      oddY = 100; 
    }
    if(odd1Y>400) {
      odd1X = (int)(Math.random()*400);
      odd1Y = 300;
    }
  }
}
class JumboParticle extends NormalParticle //uses inheritance
{
  //your code here
  JumboParticle() {
    theSize = 10;
  }
}

