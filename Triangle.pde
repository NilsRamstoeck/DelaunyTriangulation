static class Triangle{
 Edge a, b, c;
 
 Triangle(Edge _a, Edge _b, Edge _c){
  this.a = _a;
  this.b = _b;
  this.c = _c;
  
  a.tris.add(this);
  b.tris.add(this);
  c.tris.add(this);
 }
 
 public Edge getThirdEdge(Edge e1, Edge e2){
   ArrayList<Edge> edges = new ArrayList();
   edges.add(a);
   edges.add(b);
   edges.add(c);
   edges.remove(e1);
   edges.remove(e2);
   
   println(edges.get(0), "T");
   if(edges.size() > 1)return null;
   return edges.get(0);
 }
 
 public ArrayList<Edge> getEdges(){
   ArrayList<Edge> edges = new ArrayList();
   edges.add(a);
   edges.add(b);
   edges.add(c);
   return edges;
 }
 
}
