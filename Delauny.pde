import java.util.Comparator;

static ArrayList<Edge> rejected = new ArrayList();
static ArrayList<Triangle> rejectedT = new ArrayList();

int amtV = 10;

boolean selectV1 = false, selectV2 = false, selectE1 = false, selectE2 = false;
boolean released = true;

Vertex V1, V2;
Edge E1, E2;

Mesh pMesh, dMesh;

void setup() {
  size(1200, 850);

  pMesh = new Mesh();

  noFill();
}

void point(double x, double y) {
  point((float)x, (float)y);
}

void line(double x1, double y1, double x2, double y2) {
  line((float) x1, (float)y1, (float)x2, (float)y2);
}

void draw() {
  background(0);

  for (Vertex v : pMesh.vertecies) {
    strokeWeight(5);
    stroke(255);
    point(v.x, v.y);
  }


  for (Edge e : pMesh.getEdges()) {
    strokeWeight(0.3);
    stroke(255);
    line(e.v1.x, e.v1.y, e.v2.x, e.v2.y);
  }

  for (Triangle t : pMesh.triangles) {
    PVector circle = t.getCircumcircle();

    stroke(255, 255, 0);
    strokeWeight(0.3);
    circle(circle.x, circle.y, circle.z * 2);
  }
  
    for (Triangle t : rejectedT) {
    PVector circle = t.getCircumcircle();

    stroke(255, 0, 0);
    strokeWeight(0.3);
    circle(circle.x, circle.y, circle.z * 2);
  }
}

void mouseReleased() {
}

void mousePressed() {
  Vertex v = new Vertex(mouseX, mouseY);
  DelaunyTriangulation.increment(pMesh, v);
}

void keyPressed() {
  if(key == ' '){
   println(pMesh.getEdges().size()); 
  }
}
