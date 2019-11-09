// https://leetcode.com/problems/longest-palindromic-substring
// Note: we can have a better DP with another approach you can refer it here

import java.util.HashMap;

public class LongestPalindromicSubstring {
  private HashMap<String, Integer> palindromes = new HashMap<>();
  private String result = "";

  public static void main(String [] args) {
    System.out.println(new LongestPalindromicSubstring().longestPalindrome("ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc"));
  }

  public String longestPalindrome(String s) {
    for (int i = 1; i <= s.length(); i++) {
      for (int j = 0; j < s.length() && j + i <= s.length(); j++) {
        checkAndStorePalindrome(s.substring(j, j + i));
      }
    }
    return result;
  }

  private void checkAndStorePalindrome(String str) {
    if (str == null) return;

    // empty/one character string is palindrome
    if (str.length() == 0 || str.length() == 1) {
      storePalindrome(str, str.length());
      return;
    }

    // need to symmetric
    if (str.charAt(0) != str.charAt(str.length() - 1)) return;
    if (str.length() == 2) {
      storePalindrome(str, 2);
      return;
    }

    String substring = str.substring(1, str.length() - 1);
    if (!palindromes.containsKey(substring)) {
      return;
    }

    storePalindrome(str, palindromes.get(substring) + 2);
  }

  private void storePalindrome(String s, int length) {
    if (length > result.length()) {
      result = s;
    }
    palindromes.put(s, length);
  }
}
