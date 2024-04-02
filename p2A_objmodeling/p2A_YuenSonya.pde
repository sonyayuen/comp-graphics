// Object Modeling Example Code
float time = 0;   // time is used to move objects from one frame to another
boolean generateImages = false; // For instructors. Automatically generate images (and create a video manually).

void setup() {
  size(800, 800, P3D); // If 3D mode is not working on your mac, download the latest version of Processing with a proper version: "Apple Silicon" or "Intel 64-bit".
  frameRate(30);      // this seems to be needed to make sure the scene draws properly
  perspective(60 * PI / 180, 1, 0.1, 1000); // 60-degree field of view
}

void draw() {
  time += 0.05;
  // You are tasked to modify this function to design your own character.
  
  // You can focus on object modeling, while leaving background/lighting/camera as-is. Feel free to modify anything if needed!
  // For the requirements for object modeling, please refer to the project description on canvas.
  // Don't forget to display the name of the character.

  camera (0, 0, 100, 0, 0, 0, 0, 1, 0); // position of the virtual camera
  
  background (219, 245, 255);  // clear screen and set background to light blue

  // set up the lights
  ambientLight(50, 50, 50);
  lightSpecular(255, 255, 255);
  directionalLight (100, 100, 100, -0.3, 0.5, -1);

  // set some of the surface properties
  noStroke();
  specular (180, 180, 180);
  shininess (15.0);

  // Rotate everything together
  pushMatrix();
  rotateY(time); // Rotate around the vertical axis
  rotateX(mouseY/18);
  


  // ==============================
  // Object modeling begins
  // ==============================  
  
  
  //record box base
  fill (178,131, 78);
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
  
  
  //arm length
  fill (90, 90, 90);
  pushMatrix();
  //scale(5,5,5);
  translate(19, 14, -20);
  rotateY(65);
  scale(1,1,15);
  cylinder();
  popMatrix();
  
  
  //arm end
  fill (72, 231, 255);
  pushMatrix();
  scale(2,2,2);
  translate(4,7,-6);
  rotateY(65);
  cylinder();
  popMatrix();
  
  
  
  //record
  fill (0,0,0);
  pushMatrix();
  scale(35,1,35);
  translate (-0.1, 18, 0);
  rotateX(PI/2);
  cylinder();
  popMatrix();
  
  
 
  //record middle pin
  fill (200,0,0);
  pushMatrix();
  scale(2,4,2);
  translate (-1, 5, 0);
  rotateX(PI/2);
  cylinder();
  popMatrix();
  
 


  // ==============================
  // Object modeling ends
  // ==============================  
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


void cylinder2() {
  // Helper function to draw a cylinder radius = 1, z range in [-1, 1]
  cylinder2(50);
}

void cylinder2(int sides) {
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

  //// second endcap
  //beginShape();
  //for (int i = 0; i < sides; i++) {
  //  float theta = i * 2 * PI / sides;
  //  float x = cos(theta);
  //  float y = sin(theta);
  //  vertex(x, y, 1);
  //}
  //endShape(CLOSE);
  
  // round main body
  float x1 = 1;
  float y1 = 0;
  for (int i = 0; i < sides; i++) {
    float theta = (i + 1) * 2 * PI / sides;
    float x2 = cos(theta);
    float y2 = sin(theta)/2;
    beginShape();
    normal (x1, y1, 0);
    vertex (x1, y1, -1);
    vertex (x1, y1, -2);
    normal (x2, y2, -2);
    vertex (x2, y2, -1);
    vertex (x2, y2, 1);
    endShape(CLOSE);
    x1 = x2;
    y1 = y2;
  }
}
