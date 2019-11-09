import java.util.Arrays;

public class Swaps {
  public boolean solve() {
    FastReader fr = new FastReader();
    int N = fr.nextInt();
    int [] A = new int[N];
    int [] B = new int[N];
    for (int i = 0; i < N; i++) {
      A[i] = fr.nextInt();
    }
    for (int i = 0; i < N; i++) {
      B[i] = fr.nextInt();
    }

    Arrays.sort(A);
    Arrays.sort(B);
    for (int i = 0; i < N; i++) {
      if (B[i] > A[i]) return false;
    }

    return true;
  }

  public static void main(String [] args) {
    System.out.println(new Swaps().solve() ? "Yes" : "No");
  }
}
