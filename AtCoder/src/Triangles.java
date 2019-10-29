import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Triangles {
  public static void main(String [] args) {
    FastReader fr = new FastReader();
    int N = fr.nextInt();
    int[] sticks = new int[N];
    for (int i = 0; i < N; i++) {
      sticks[i] = fr.nextInt();
    }

    Arrays.sort(sticks); // sort sticks in ascending order

    int result = 0;
    for (int i = N - 1; i >= 2; i--) {
      for (int j = i - 1; j >= 1; j--) {
        int minL = sticks[i] - sticks[j];
        int index = binarySearch(sticks, minL, 0, j - 1);
        if (index == -1) break;
        if (sticks[index] > minL) {
          result += (j - index); // sticks[index] is also counted
        } else {
          result += (j - 1 - index); // sticks[index] isn't counted
        }
      }
    }

    System.out.println(result);
  }

  // This will return an index in range [lo, hi] if minL is not greater than all element
  // Else return -1
  static int binarySearch(int[] sticks, int minL, int lo, int hi) {
    int result = -1;

    while (lo <= hi) {
      int mid = (lo + hi)/2;
      if (sticks[mid] == minL) {
        lo = mid + 1; // cannot return here, because of duplicated elements are possible
      } else if (sticks[mid] > minL) {
        result = mid;
        hi = mid - 1;
      } else {
        lo = mid + 1;
      }
    }

    return result;
  }
}
