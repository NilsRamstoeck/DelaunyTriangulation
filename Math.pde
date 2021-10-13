static PVector getIntersection(double m1, double b1, double m2, double b2) {

  //if not parallel
  if (m1 != m2) {


    //get x of intersection
    double x = round((b2 - b1) / (m1 - m2), 5);

    double y = m1 * x + b1;

    return new PVector((float)x, (float)y);
  }
  return null;
}


static double round(double val, int digits) {
  double factor = (int)pow(10, digits);
  return (double)Math.round(val * factor) / factor;
}

static double slope(Vertex a, Vertex b) {
  return (b.y - a.y) / (b.x - a.x);
}

static double slope(Edge e) {
  return slope(e.v1, e.v2);
}

static double yintercept(Edge e) {
  return yintercept(slope(e), e.v1);
}

static double yintercept(double m, Vertex p) {
  return  p.y - (m * p.x);
}

static boolean intersects(Edge a, Edge b) {
  //find slopes
  double m1 = slope(a.v1, a.v2);
  double m2 = slope(b.v1, b.v2);

  //if not parallel
  if (m1 != m2) {
    //find y intercepts
    double b1 = yintercept(m1, a.v1);
    double b2 = yintercept(m2, b.v1);

    //get x of intersection
    double x = round((b2 - b1) / (m1 - m2), 5);

    //round everything to 5 digits to avoid precision errors

    //get X bounds of line segment 1
    double minX1 = round(Math.min(a.v1.x, a.v2.x), 5);
    double maxX1 = round(Math.max(a.v1.x, a.v2.x), 5);

    //get x bounds of line segment 2
    double minX2 = round(Math.min(b.v1.x, b.v2.x), 5);
    double maxX2 = round(Math.max(b.v1.x, b.v2.x), 5);


    //check intersection is on both segments
    if (x > minX1 && x < maxX1 && x > minX2 && x < maxX2) {
      return true;
    }
  }
  return false;
}
