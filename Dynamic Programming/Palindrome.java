class Palindrome {
  String longestPalindrome(String str) {
    longestPalindrome(str, 0, str.length() - 1);
  }

  String longestPalindrome(String str, int start, int end) {
    if (start >= end) return 0;

    if (str.charAtIndex(start) == str.charAtIndex(end)) {
      return 1 + longestPalindrome(str, start + 1, end - 1)
    } else {
      return Math.max(longestPalindrome(str, start, end - 1), longestPalindrome(str, start + 1, end)); 
    }
  }
}

