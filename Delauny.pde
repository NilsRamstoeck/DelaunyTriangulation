import java.util.Comparator;

static ArrayList<Edge> rejected = new ArrayList();

ArrayList<Vertex> vertecies = new ArrayList();

int amtV = 3;

boolean selectV1 = false, selectV2 = false, selectE1 = false, selectE2 = false;
boolean released = true;

Vertex V1, V2;
Edge E1, E2;

Mesh pMesh, dMesh;

void setup() {
  size(1200, 850);

  randomSeed(6);

  //vertecies.add(new Vertex(0, 0));
  //vertecies.add(new Vertex(0, height));
  //vertecies.add(new Vertex(width, 0));
  //vertecies.add(new Vertex(width, height));

  for (int i = 0; i < amtV; i++) {
    vertecies.add(new Vertex(random(0, width), random(0, height)));
  }

  println("START");
  pMesh = DelaunyTriangulation.crudeTriangulation(vertecies);
  println("DONE");
  println("START");
  //dMesh = DelaunyTriangulation.delauny(vertecies);
  println("DONE");
}

void point(double x, double y) {
  point((float)x, (float)y);
}

void line(double x1, double y1, double x2, double y2) {
  line((float) x1, (float)y1, (float)x2, (float)y2);
}

void draw() {
  background(0);

  strokeWeight(5);
  for (Vertex v : vertecies) {
    if (dist(mouseX, mouseY, (float)v.x, (float)v.y) < 15 && (selectV1 || selectV2)) {
      if (selectV1 && released && mousePressed) {
        V1 = v;
        selectV1 = false;
        selectV2 = true;
        released = false;
      } else if (selectV2 && released && mousePressed) {
        V2 = v;
        selectV2 = false;
        selectE1 = true;
        released = false;
      }
      stroke(255, 0, 0);
    } else {
      stroke(255);
    }
    point(v.x, v.y);
  }

  strokeWeight(.5);
  for (Triangle t : pMesh.triangles) {
    for (Edge e : t.getEdges()) {
      if (PointEdgeCollider.collides(new PVector(mouseX, mouseY), e) && (selectE1 || selectE2)) {
        if (selectE1 && released && mousePressed) {
          E1 = e;
          selectE1 = false;
          released = false;
          println("Edge 1");
          DelaunyTriangulation.flip(E1);
        } else if (selectE2 && released && mousePressed) {
          E2 = e;
          selectE2 = false;
          released = false;
          println("Edge 2");
        }
        stroke(255, 0, 0);
      } else {
        stroke(255);
      }

      line((float)e.v1.x, (float)e.v1.y, (float)e.v2.x, (float)e.v2.y);
    }
  }

  stroke(255, 0, 0);

  if (keyPressed && key == 's')
    for (Edge e : rejected) {
      line(e.v1.x, e.v1.y, e.v2.x, e.v2.y);
    }
}

void mouseReleased() {
  released = true;
}

void mousePressed() {
  //vertecies.add(new Vertex(mouseX, mouseY));
  //pMesh = DelaunyTriangulation.crudeTriangulation(vertecies);
}

void keyPressed() {
  if (key == ' ') {
    pMesh = DelaunyTriangulation.crudeTriangulation(vertecies);
  }
  if (keyCode == ENTER) {
    selectE1 = true;
  }
}
