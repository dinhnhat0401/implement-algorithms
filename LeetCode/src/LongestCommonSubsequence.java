import java.util.Arrays;

public class LongestCommonSubsequence {
  public static void main(String [] args) {
    System.out.println(new LongestCommonSubsequence().longestCommonSubsequence("abcde", "ace"));
  }

  public int longestCommonSubsequence(String text1, String text2) {
    int [][] DP = new int[text1.length()][text2.length()];
    for (int i = 0; i < text1.length(); i++) {
      Arrays.fill(DP[i], 0);
    }
    solve(text1, text2, text1.length() - 1, text2.length() - 1, DP);
    return DP[text1.length() - 1][text2.length() - 1];
  }

  int solve(String text1, String text2, int i, int j, int [][] DP) {
    // base case
    if (i < 0 || j < 0) return 0;
    if (i == 0 && j == 0) return text1.charAt(0) == text2.charAt(0) ? 1 : 0;

    // return memorized data
    if (DP[i][j] != 0) return DP[i][j];

    // calculate with DP formula
    if (text1.charAt(i) == text2.charAt(j)) {
      DP[i][j] = solve(text1, text2, i - 1, j - 1, DP) + 1;
    } else {
      DP[i][j] = Math.max(solve(text1, text2, i - 1, j, DP), solve(text1, text2, i, j - 1, DP));
    }

    return DP[i][j];
  }
}
