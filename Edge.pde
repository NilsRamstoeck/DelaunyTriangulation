static class Edge {
  Vertex v1, v2; 
  
  ArrayList<Triangle> tris = new ArrayList();
  
  Edge(Vertex _a, Vertex _b){
   this.v1 = _a;
   this.v2 = _b;
  }
}
