// https://atcoder.jp/contests/abc143/tasks/abc143_e

import java.io.PrintWriter;
import java.util.Arrays;

public class TravelByCar {
  static FastReader fr = new FastReader();

  public static void main(String [] args) {
    int N = fr.nextInt();
    int M = fr.nextInt();
    int L = fr.nextInt();

    final long INF = 1L << 60;
    long [][] G = new long[N][N];
    int [][] dist = new int[N][N];
    for (int i = 0; i < N; i++) {
      Arrays.fill(G[i], INF);
      Arrays.fill(dist[i], 9999);
      G[i][i] = 0;
      dist[i][i] = 0;
    }

    for (int i = 0; i < M; i++) {
      int A = fr.nextInt() - 1;
      int B = fr.nextInt() - 1;
      int C = fr.nextInt();

      G[A][B] = G[B][A] = C;
    }

    for (int k = 0; k < N; k++) {
      for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
          if (G[i][k] + G[k][j] < G[i][j])
            G[i][j] = G[i][k] + G[k][j];
        }
      }
    }

    for (int i = 0; i < N; i++) {
      for (int j = i + 1; j < N; j++) {
        if (G[i][j] <= L) {
          dist[i][j] = dist[j][i] = 1;
        }
      }
    }

    for (int k = 0; k < N; k++) {
      for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
          if (dist[i][k] + dist[k][j] < dist[i][j])
            dist[i][j] = dist[i][k] + dist[k][j];
        }
      }
    }

    int Q = fr.nextInt();
    PrintWriter writer = new PrintWriter(System.out);
    for (int i = 0; i < Q; i++) {
      int S = fr.nextInt() - 1;
      int T = fr.nextInt() - 1;
      writer.println(dist[S][T] > 999 ? -1 : dist[S][T] - 1);
    }
    writer.flush();
  }
}
