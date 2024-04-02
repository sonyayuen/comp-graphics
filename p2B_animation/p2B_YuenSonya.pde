// The object being instanced is the record player
// rotating: the 1st and 3rd record players, all of the records
// translation: the arm on the record player, at the end of the animation, they all move
// camera moves throughout
// 2A's object was the record player
// there are different light settings used throughout






// Object Modeling Example Code
float time = 0;   // time is used to move objects from one frame to another
boolean generateImages = false; // For instructors. Automatically generate images (and create a video manually).


float t2= 0;

void setup() {
  size(700, 700, P3D); // If 3D mode is not working on your mac, download the latest version of Processing with a proper version: "Apple Silicon" or "Intel 64-bit".
  frameRate(30);      // this seems to be needed to make sure the scene draws properly
  perspective(60 * PI / 180, 1, 0.1, 1000); // 60-degree field of view
}



void draw() {
  time += 0.05;

   if (time < 4 ) {
     camera (0, -25, 200 - (time * 11), 0, 0, 0, 0, 1, 0); // position of the virtual camera
     ambientLight(100, 100, 100);
    lightSpecular(255, 255, 255);
    directionalLight (100, 100, 100, -0.3, 0.5, -1);
   }   
  if (time >= 4 && time < 23) {
  
    camera (40,  -60 +time *10, 100, 0, -60+time*10, 0, 0, 1, 0); // position of the virtual camera
     //directionalLight(255, 255, 255, // Color
     //              10, 15, -5); // The x-, y-, z-axis direction  
     
     ambientLight(100, 100, 100);
    lightSpecular(255, 255, 255);
    directionalLight (100, 100, 100, -0.3, 0.5, -1);
  } 
  
  if (time >= 23 && time < 25) {
    camera (30,  190, 120, 0, 30, 0, 0, 1, 0); // position of the virtual camera
    ambientLight(100, 100, 100);
    lightSpecular(255, 255, 255);
    directionalLight (100, 100, 100, -0.3, 0.5, -1);
     
  } 
  
  if (time >=25 && time < 26) {
    ambientLight(10, 10, 10);
    lightSpecular(25, 25, 25);
    directionalLight (100, 100, 100, -0.3, 0.5, -1);
    
  }  
  
  if (time >26) {
    camera (30,  -190, 120, 0, 30, 0, 0, 1, 0); // position of the virtual camera
    ambientLight(10, 10, 10);
    lightSpecular(25, 25, 25);
    directionalLight (100, 100, 100, -0.3, 0.5, -1);
    
  }  
  
  background (219, 245, 255);  // clear screen and set background to light blue

  // set some of the surface properties
  noStroke();
  specular (180, 180, 180);
  shininess (15.0);

  // Rotate everything together
  pushMatrix();

  // =============================================
  // Object modeling begins
  // =============================================
  
  ////////////// OBJECT INSTANCING ////////////
   //plus original 

  
 /////////////////////////////////////////////////////1
  pushMatrix();
  translate(0, -60, 0); //1st  Record Player
  if (time < 25) {
    rotateY(-time/2);
  }  else if (time >26) {
    translate(time * 3, 0, 0);
    
  }  
  recordPlayer(225, 94, 242);
  popMatrix();
  
   pushMatrix();
 // translate(0, 120, 0); //1st Record Box
  if (time < 25) {
    rotateY(-time/2);
  }  else if (time >26) {
    translate(time * 3, 0, 0);
    
  }  
  record(2,4, 171, 245, 255, -60);
  
  popMatrix();
  
  pushMatrix();
  translate(0, -60, 0); //1st Record Arm 7 10 12
  if (time < 25) {
    rotateY(-time/2);
  }  else if (time >26) {
    translate(time * 3, 0, 0);
    
  }  
  recordArm(5, 8, 10);
  popMatrix();
  
  //////////////////////////////////////////////////2
   pushMatrix();
  translate(0, 0, 0); //2nd  Record Player
 if (time >26) {
    translate(-time * 3, 0, 0);
    
  }  
  recordPlayer(251, 255, 171);
  popMatrix();
   pushMatrix();
  if (time >26) {
    translate(-time * 3, 0, 0);
    
  }  
  record(2,4, 250, 195, 100, 0);
  
  popMatrix();
  
  pushMatrix();
  translate(0, 0, 0); //2 Record Arm 7 10 12
  if (time >26) {
    translate(-time * 3, 0, 0);
    
  }  
  recordArm(5, 8, 10);
  popMatrix();
  //////////////////////////////////////////////////3
    pushMatrix();
  translate(0, 60, 0); //THIRD RECORD
  if (time < 25) {
    rotateY(time/2);
  } else if (time >= 26) {
    
    translate(time * 3, 0, 0);
  }  
  recordPlayer(179, 252, 139);
  popMatrix();

  
  pushMatrix();
  if (time < 25) {
    rotateY(time/2);
  } else if (time >= 26) {
    
    translate(time * 3, 0, 0);
  } 
  record(9,11, 171, 245, 255, 60);
  popMatrix();
  
  pushMatrix();
  translate(0, 60, 0); // 7 10 12
  if (time < 25) {
    rotateY(time/2);
  } else if (time >= 26) {
    
    translate(time * 3, 0, 0);
  } 
  recordArm(12, 17, 19);
  popMatrix();
  
   /////////////////////////////////////////////////////4
  
  pushMatrix();
  translate(0, 120, 0);
  if (time > 26) {
    translate(-time * 3, 0, 0);
  }  
  recordPlayer(126, 177, 252); //4th Record box
  popMatrix();
  
  
  pushMatrix();
 // translate(0, 120, 0); // 4th Record
  if (time > 26) {
    translate(-time * 3, 0, 0);
  }  
  record(14,16, 255, 171, 224, 120);
  popMatrix();
  
  pushMatrix();
  translate(0, 120, 0); // 4th Record Arm 7 10 12
  if (time > 26) {
    translate(-time * 3, 0, 0);
  }  
  recordArm(18, 21, 23);
  popMatrix();
  
  
 
  // ====================================================
  // Object modeling ends
  // ====================================================
  // pop the rotation matrix
  popMatrix();

  
  pushMatrix();
  translate(0, 55, 0);
  scale(0.1, 0.1, 0.1);
  fill(0);
  textAlign(CENTER);
  textSize(48); 
  text("record player", 0, 0);
  popMatrix();
  
  // Single frame capture with 'c' key
  if (keyPressed && key == 'c') {
    saveFrame("p2-######.png");
  }
  if (generateImages && frameCount < 300) {
    saveFrame("p2-######.png");
  }
  
  if (keyPressed && key == 'a') {
    print( "mouseX/20: " + mouseX/20 + "\n");
    print( "mouseY/20: "  + mouseY/20 + "\n");
  
  }
}

void cylinder() {
  // Helper function to draw a cylinder radius = 1, z range in [-1, 1]
  cylinder(50);
}

void cylinder(int sides) {
  // Helper function to draw a cylinder with the given number of sides.
  
  // first endcap
  beginShape();
  for (int i = 0; i < sides; i++) {
    float theta = i * 2 * PI / sides;
    float x = cos(theta);
    float y = sin(theta);
    vertex(x, y, -1);
  }
  endShape(CLOSE);

  // second endcap
  beginShape();
  for (int i = 0; i < sides; i++) {
    float theta = i * 2 * PI / sides;
    float x = cos(theta);
    float y = sin(theta);
    vertex(x, y, 1);
  }
  endShape(CLOSE);
  
  // round main body
  float x1 = 1;
  float y1 = 0;
  for (int i = 0; i < sides; i++) {
    float theta = (i + 1) * 2 * PI / sides;
    float x2 = cos(theta);
    float y2 = sin(theta);
    beginShape();
    normal (x1, y1, 0);
    vertex (x1, y1, 1);
    vertex (x1, y1, -1);
    normal (x2, y2, 0);
    vertex (x2, y2, -1);
    vertex (x2, y2, 1);
    endShape(CLOSE);
    x1 = x2;
    y1 = y2;
  }
}



void recordPlayer(int r, int g, int b) {
  
  //record box base
  fill (r,g, b);
  pushMatrix();
  translate (0, 25, 0);
  
  box(75, 10, 70);
  popMatrix();
  
  //speaker box left
  fill (94, 94, 87);
  pushMatrix();
  translate(-25, 25, 35);
  sphereDetail(60); // this controls how many polygons make up each sphere
  box(10,6,2);
  popMatrix();
  
  //speaker box right
  fill (94, 94, 87);
  pushMatrix();
  translate(25, 25, 35);
  sphereDetail(60); // this controls how many polygons make up each sphere
  box(10,6,2);
  popMatrix();
  
  
  //button box middle
  fill (94, 94, 87);
  pushMatrix();
  translate(0, 25, 35);
  sphereDetail(60); // this controls how many polygons make up each sphere
  box(18,6,2);
  popMatrix();
  
  //button middle
  fill (94, 9, 87);
  pushMatrix();
  //scale(5,5,5);
  translate(-6, 25, 36);
  scale(2, 2,1);
  sphereDetail(60); // this controls how many polygons make up each sphere
  cylinder();
  popMatrix();
  
  //button right
  fill (94, 9, 87);
  pushMatrix();
  //scale(5,5,5);
  translate(6, 25, 36);
  rotateZ(time/2);
  scale(2, 2,1);
  sphereDetail(60); // this controls how many polygons make up each sphere
  cylinder();
  popMatrix();
  
  //button mid
  fill (94, 9, 87);
  pushMatrix();
  //scale(5,5,5);
  translate(0, 25, 36);
  scale(2, 2,1);
  sphereDetail(60); // this controls how many polygons make up each sphere
  cylinder();
  popMatrix(); 
  
  //volume button on top
  fill (60, 60, 60);
  pushMatrix();
  //scale(5,5,5);
  translate(31, 19, 30);
  rotateX(PI/2);
  scale(4, 4, 1);
  rotateZ(time/2);
  sphereDetail(60); // this controls how many polygons make up each sphere
  cylinder();
  popMatrix();
  
  //volume button 2
  fill (60, 60, 60);
  pushMatrix();
  //scale(5,5,5);
  translate(31, 19, 22);
  rotateX(PI/2);
  scale(3, 3, 1);
  //rotateZ(time/2);
  sphereDetail(60); // this controls how many polygons make up each sphere
  cylinder();
  popMatrix();
    
  //arm base
  fill (72, 231, 255);
  pushMatrix();
  //scale(5,5,5);
  translate(31, 18, -28);
  rotateX(PI/2);
  scale(4.5,4.5,1);
  cylinder();
  popMatrix();
  
  //base 2
  fill (90, 90, 90);
  pushMatrix();
  //scale(5,5,5);
  translate(31, 16, -28);
  rotateX(PI/2);
  scale(2,2,6);
  cylinder();
  popMatrix();
  
  fill (0,0,0);
  pushMatrix();
  scale(2,4,2);
  translate (-3, 5, 0);
  rotateX(PI/2);
  cylinder();
  popMatrix();

}


void record( float t1, float t2, int r, int g, int b, int y) {
  fill (r,g,b);
  pushMatrix();
  scale(35,1,35);
  translate(-0.1, y , 0); // where u want to start 

  if (time >= t2) {
    //directionalLight(0,50,50 ,40, -60 + time *10, 130); // The x-, y-, z-axis direction
    translate(-0.1, 18, 0);      
  }  
  rotateX(PI/2); //makes it record
  if (time >= t1) {
    rotateZ(time/4); //spins record
  }  
  cylinder();
  popMatrix();
  
}


void recordArm (float t1, float t2, float t3) {
  fill (90, 90, 90);
  pushMatrix();
  translate(31, 14, -28); 
  if (time > t1 && time < t2) {
    rotateY(-PI/4);
  }   
  if (time >= t3) {
    rotateY(-PI/4);
  }   
  translate(0, 0, 18); //need to translate it back 
  box(1,1,36);
  popMatrix();
  
}  
