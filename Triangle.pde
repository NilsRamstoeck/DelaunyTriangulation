static class Triangle {
  Edge a, b, c;

  Triangle(Edge _a, Edge _b, Edge _c) {
    this.a = _a;
    this.b = _b;
    this.c = _c;

    a.tris.add(this);
    b.tris.add(this);
    c.tris.add(this);
  }

  public Edge getThirdEdge(Edge e1, Edge e2) {
    ArrayList<Edge> edges = new ArrayList();
    edges.add(a);
    edges.add(b);
    edges.add(c);
    edges.remove(e1);
    edges.remove(e2);

    println(edges.get(0), "T");
    if (edges.size() > 1)return null;
    return edges.get(0);
  }

  public void replaceIdentical(Edge e) {
    if (a.v1 == e.v1 && a.v2 == e.v2) {
      a = e;
    } else if (b.v1 == e.v1 && b.v2 == e.v2) {
      b = e;
    } else if (c.v1 == e.v1 && c.v2 == e.v2) {
      c = e;
    }
  }

  public ArrayList<Edge> getEdges() {
    ArrayList<Edge> edges = new ArrayList();
    edges.add(a);
    edges.add(b);
    edges.add(c);
    return edges;
  }
}
