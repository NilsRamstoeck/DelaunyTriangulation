static class Mesh {

  ArrayList<Vertex> vertecies = new ArrayList();
  ArrayList<Triangle> triangles = new ArrayList();

  public void addTriangle(Triangle t) {
    triangles.add(t);
  }
  
  public ArrayList<Triangle> getTriangles(Edge e){
    ArrayList<Triangle> tris = new ArrayList();
    
    for(Triangle t : triangles){
      
    }
    
    return tris;
  }

  public ArrayList<Edge> getEdges() {
    ArrayList<Edge> edges = new ArrayList();
    for (Triangle t : triangles) {
      for (Edge e : t.getEdges()) {
        edges.add(e);
      }
    }
    return edges;
  }

}
