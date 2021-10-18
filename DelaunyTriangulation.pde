static class DelaunyTriangulation {

  public static Mesh divideAndConquer(ArrayList<Vertex> vertecies) {

    return null;
  }

  public static void increment(Mesh m, Vertex v) {
    m.vertecies.add(v);

    if (m.vertecies.size() <  3) {
      return;
    } 
    if (m.vertecies.size() == 3) {
      Edge a = new Edge(m.vertecies.get(0), m.vertecies.get(1));
      Edge b = new Edge(m.vertecies.get(1), m.vertecies.get(2));
      Edge c = new Edge(m.vertecies.get(2), m.vertecies.get(0));

      m.addTriangle(new Triangle(a, b, c));
    } else {
      boolean inside = false;
      for (Triangle t : m.triangles) {
        PVector circle = t.getCircumcircle();
        inside |= (dist((float)v.x, (float)v.y, circle.x, circle.y) < circle.z);
      }
      if (!inside) {  
        println("INSIDE");
        addToAllVisible(m, v);
      } else {
        println("WEIRDTHING");
        
      }
    }
  }

  private static void addToAllVisible(Mesh m, Vertex v) {
    ArrayList<Edge> viable = new ArrayList();
    //ArrayList<Edge> t = new ArrayList();

    for (int j = m.vertecies.size() - 2; j >= 0; j--) {
      Vertex lastV = m.vertecies.get(j);
      Edge newEdge = new Edge(v, lastV);
      boolean intersects = false;
      for (Edge existingEdge : m.getEdges()) {
        if (intersects(existingEdge, newEdge)) {
          intersects = true;
          rejected.add(newEdge);
          break;
        }
      }
      if (!intersects) {
        viable.add(newEdge);
      }
    }

    for (int j = 0; j < viable.size() - 1; j++) {
      Edge a = viable.get(j);
      Edge b = viable.get(j+1);
      Edge c = new Edge(a.v1, b.v1);

      for (Edge e : m.getEdges()) {
        //println(e.v1, e.v2);
        //println(a.v1, a.v2);
        //println(b.v1, b.v2);

        if (((e.v1 == a.v2 || e.v1 == b.v2) && (e.v2 == a.v2 || e.v2 == b.v2)) || (e.v1 == a.v1 || e.v1 == b.v1) && (e.v2 == a.v1 || e.v2 == b.v1)) {
          //println("SUCCESS");
          c = e;
          break;
        }

        //println("__________________");
      }
      //println("NEWEDGE");
      Triangle t = new Triangle(a, b, c);
      PVector circle = t.getCircumcircle();
      boolean valid = true;
      for(Vertex otherV : m.vertecies){
        if(t.getVertecies().contains(otherV))continue;
        if((dist((float)otherV.x, (float)otherV.y, circle.x, circle.y) < circle.z)){
          valid = false;
          break;
        }
      }
      if(valid)
      m.addTriangle(t);
      else
      rejectedT.add(t);
      //println(valid);
    }
  }

  public static void flip(Edge e) {
    //get all triangles that have this edge
    println(e.tris.size());
  }
}
