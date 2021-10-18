static class Triangle {
  private final ArrayList<Edge> edges;

  Triangle(Edge _a, Edge _b, Edge _c) {
    edges = new ArrayList();
    edges.add(_a);
    edges.add(_b);
    edges.add(_c);
  }

  public ArrayList<Edge> getEdges() {

    ArrayList<Edge> copy = new ArrayList();
    copy.addAll(edges);

    return copy;
  }

  public ArrayList<Vertex> getVertecies() {
    ArrayList<Vertex> vertecies = new ArrayList();
    vertecies.add(edges.get(0).v1);
    vertecies.add(edges.get(0).v2);

    if (vertecies.contains(edges.get(1).v1)) {
      vertecies.add(edges.get(1).v2);
    } else {
      vertecies.add(edges.get(1).v1);
    }
    return vertecies;
  }

  PVector getCircumcircle() {
    ArrayList<PVector> lines = new ArrayList();
    for (int i = 0; i < 2; i++) {
      Edge e = edges.get(i);

      double x = (e.v1.x + e.v2.x) / 2;
      double y = x * slope(e) + yintercept(e);

      double m = -1 / slope(e);
      double b = yintercept(m, new Vertex(x, y));

      lines.add(new PVector((float)m, (float)b));
    }
    PVector intersection = getIntersection(lines.get(0).x, lines.get(0).y, lines.get(1).x, lines.get(1).y);

    return new PVector(intersection.x, intersection.y, dist(intersection.x, intersection.y, (float)edges.get(0).v1.x, (float)edges.get(0).v1.y));
  }
}
