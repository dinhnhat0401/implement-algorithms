package EdgeWeightedGraph;

import java.util.ArrayList;
import java.util.List;

public class EdgeWeightedGraph {
  public EdgeWeightedGraph(int V) {
    this.V = V;
    this.E = 0;
    adj = new ArrayList<>();
    for (int v = 0; v < V; v++) {
      adj.add(new ArrayList<>());
    }
  }

  public int V() {
    return this.V;
  }

  public int E() {
    return this.E;
  }

  public void addEdge(WeightedEdge e) {
    int v = e.either();
    int w = e.other(v);
    adj.get(v).add(e);
    adj.get(w).add(e);
    this.E++;
  }

  public List<WeightedEdge> adj(int v) {
    return adj.get(v);
  }

//  public List<WeightedEdge> edges() {
//    HashSet<WeightedEdge> edges = new HashSet<>();
//    for (int v = 0; v < V; v++) {
//      edges.addAll()
//    }
//  }
  public int[][] floydWarshall() {
    int dist[][] = new int[V][V];
    int i, j, k;

    for (i = 0; i < V; i++) {
      List<WeightedEdge> edgeList = adj(i);
      for (WeightedEdge edge: edgeList) {
        dist[i][edge.other(i)] = edge.weight();
      }
    }

    for (k = 0; k < V(); k++) {
      for (i = 0; i < V(); i++) {
        for (j = 0; j < V(); j++) {
          if (dist[i][k] + dist[k][j] < dist[i][j])
            dist[i][j] = dist[i][k] + dist[k][j];
        }
      }
    }

    return dist;
  }

  private final int V;
  private int E;
  private List<List<WeightedEdge>> adj;
}
