static class Vertex{
 
  double x, y;
  
  //ArrayList<Edge> edges = new ArrayList();
  
  Vertex(double _x, double _y){
    this.x = _x;
    this.y = _y;
  }
  
  public static Edge getSharedEdge(Vertex a, Vertex b){
    return null;
  }
  
  public String toString(){
   return new PVector((float)x, (float)y).toString(); 
  }
}
