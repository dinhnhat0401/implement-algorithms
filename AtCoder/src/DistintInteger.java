import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class DistintInteger {
  public static void main(String [] args) {
    FastReader fr = new FastReader();
    int N = fr.nextInt();
    if (N % 2 != 0) {
      N = N/2;
    } else {
      N = N/2 - 1;
    }
    System.out.println(N);
  }
}
