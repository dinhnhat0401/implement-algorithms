package EdgeWeightedGraph;

import java.util.*;

public class WeightedEdge implements Comparable<WeightedEdge> {
  public WeightedEdge(int v, int w, int weight) {
    this.v = v;
    this.w = w;
    this.weight = weight;
  }

  public int weight() {
    return this.weight;
  }

  public int either() {
    return this.v;
  }

  public int other(int vertex) {
    if (vertex == v) return w;
    if (vertex == w) return v;
    throw new RuntimeException("Inconsistent edge");
  }

  public int compareTo(WeightedEdge that) {
    return Integer.compare(this.weight(), that.weight());
  }

  public String toString() {
    return String.format("%d - %d %d", v, w, weight);
  }

  private final int v;
  private final int w;
  private final int weight;
}
