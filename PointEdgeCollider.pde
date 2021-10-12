static class PointEdgeCollider{
  
  static float precision = 10;
  
  static boolean collides(PVector p, Edge e){
    boolean result = false;
    
    Edge mEdge1 = new Edge(new Vertex(p.x, p.y - precision), new Vertex(p.x, p.y + precision));
    Edge mEdge2 = new Edge(new Vertex(p.x - precision, p.y), new Vertex(p.x + precision, p.y));
    
    result |= intersects(mEdge1, e) || intersects(mEdge2, e);
    
    return result;
  }
}
