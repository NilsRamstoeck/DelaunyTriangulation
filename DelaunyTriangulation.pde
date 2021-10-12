static class DelaunyTriangulation {
  
  public static Mesh divideAndConquer(ArrayList<Vertex> vertecies) {

    return null;
  }

  public static Mesh increment(Mesh mesh, Vertex v) {

    return null;
  }

  public static Mesh delauny(ArrayList<Vertex> vertecies){
    Mesh m = crudeTriangulation(vertecies);
    
    boolean done = false;
    
    while(!done){
     // for(Trian
    }
    
    return m; 
  }

  public static void flip(Edge e) {
    //get all triangles that have this edge
    
  }

  public static Mesh crudeTriangulation(ArrayList<Vertex> vertecies) {

    vertecies.sort(new Comparator<Vertex>() {

      @Override
        public int compare(Vertex v1, Vertex v2) {
        int r;
        if (v1.x < v2.x) {
          r = -1;
        } else if (v1.x > v2.x) {
          r = 1;
        } else {
          r = 0;
        }
        return r;
      }
    }
    );

    Mesh m = new Mesh();

    {
      Edge a = new Edge(vertecies.get(0), vertecies.get(1));
      Edge b = new Edge(vertecies.get(1), vertecies.get(2));
      Edge c = new Edge(vertecies.get(2), vertecies.get(0));

      Triangle t = new Triangle(a, b, c);
      m.addTriangle(t);
    }

    for (int i = 3; i < vertecies.size(); i++) {
      Vertex v = vertecies.get(i);
      ArrayList<Edge> viable = new ArrayList();

      for (int j = i-1; j >= 0; j--) {
        Vertex lastV = vertecies.get(j);
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
        Edge c = new Edge(a.v1, a.v2);
        m.addTriangle(new Triangle(a, b, c));
      }
    }

    return m;
  }
}
