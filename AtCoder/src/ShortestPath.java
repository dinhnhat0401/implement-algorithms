import java.util.Arrays;

public class ShortestPath {
  public long solve() {
    FastReader fr = new FastReader();
    int N = fr.nextInt();
    int M = fr.nextInt();

    final long INF = 1L << 60;
    long [][] G = new long[N][N];
    long [] dist = new long[N];

    for (int i = 0; i < N; i++) {
      Arrays.fill(G[i], INF);
      Arrays.fill(dist, INF);
      G[i][i] = 0;
      dist[i] = 0;
    }

    for (int i = 0; i < M; i++) {
      int L = fr.nextInt() - 1;
      int R = fr.nextInt() - 1;
      int C = fr.nextInt();
      G[L][R] = C;
      G[R][L] = C;
    }

    dijkstra(G, dist, 0);
    return dist[N - 1];
  }

  void dijkstra(long graph[][], long [] dist, int src)
  {
    int V = graph.length;

    // sptSet[i] will true if vertex i is included in shortest
    // path tree or shortest distance from src to i is finalized
    Boolean sptSet[] = new Boolean[V];

    // Initialize all distances as INFINITE and stpSet[] as false
    for (int i = 0; i < V; i++) {
      dist[i] = Integer.MAX_VALUE;
      sptSet[i] = false;
    }

    // Distance of source vertex from itself is always 0
    dist[src] = 0;

    // Find shortest path for all vertices
    for (int count = 0; count < V - 1; count++) {
      // Pick the minimum distance vertex from the set of vertices
      // not yet processed. u is always equal to src in first
      // iteration.
      int u = minDistance(dist, sptSet);

      // Mark the picked vertex as processed
      sptSet[u] = true;

      // Update dist value of the adjacent vertices of the
      // picked vertex.
      for (int v = 0; v < V; v++)

        // Update dist[v] only if is not in sptSet, there is an
        // edge from u to v, and total weight of path from src to
        // v through u is smaller than current value of dist[v]
        if (!sptSet[v] && graph[u][v] != 0 && dist[u] != Integer.MAX_VALUE && dist[u] + graph[u][v] < dist[v])
          dist[v] = dist[u] + graph[u][v];
    }
  }

  int minDistance(long dist[], Boolean sptSet[])
  {
    // Initialize min value
    long min = Long.MAX_VALUE;
    int min_index = -1;

    for (int v = 0; v < dist.length; v++)
      if (!sptSet[v] && dist[v] <= min) {
        min = dist[v];
        min_index = v;
      }

    return min_index;
  }

  public static void main(String [] args) {
    System.out.println(new ShortestPath().solve());
  }
}
