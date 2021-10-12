static class Triangle{
 Edge a, b, c;
 
 Triangle(Edge _a, Edge _b, Edge _c){
  this.a = _a;
  this.b = _b;
  this.c = _c;
 }
 
 public ArrayList<Edge> getEdges(){
   ArrayList<Edge> edges = new ArrayList();
   edges.add(a);
   edges.add(b);
   edges.add(c);
   return edges;
 }
 
}
