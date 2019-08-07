import java.util.ArrayList;
import java.util.List;
import java.util.HashSet;
import java.util.Set;

class Catalan {
  static Set<String> getCatalan(int n, List<Set<String>> memo) {
    Set<String> result = new HashSet<>();
    if (n <= 1) {
      result.add("()");
      return result;
    }

    Set<String> previous = memo.get(n-1);
    for (String c : previous) {
      result.add("()" + c);
      for (int i = 0; i < c.length(); i ++) {
        if (c.charAt(i) == '(') {
          result.add(insertInside(c, i));
        }
      }
    }

    return result;
  }

  static String insertInside(String str, int index) {
    String left = str.substring(0, index + 1);
    String right = str.substring(index + 1);
    return left + "()" + right;
  }

  static int getCatalan(int n) {
    List<String> result = new ArrayList<>();

    List<Set<String>> memo = new ArrayList<>();
    for (int i = 0; i <= n; i++) {
      memo.add(getCatalan(i, memo));
    }

    return memo.get(n).size();
  }

  public static void main(String [] args) {
    System.out.println(getCatalan(3));
    System.out.println(getCatalan(4));
    System.out.println(getCatalan(5));
    System.out.println(getCatalan(10));
  }
}

