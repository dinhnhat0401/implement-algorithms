package Java;

import java.util.Hashtable;

class Permutation {
  static boolean isPermutation(String str1, String str2) {
    
    // Need null check since it will return NullPointerException if we try to call length() on a null object
    if (str1 == null && str2 == null) return true;
    if ((str1 == null && str2 != null) || (str1 != null && str2 == null)) return false;

    // One string can't be permutation of another if they aren't equal in length
    if (str1.length() != str2.length()) return false;

    // Loop throught the array an count number of appearance for each character in the string
    Hashtable<Character, Integer> hashtable = new Hashtable<>();
    for (int i = 0; i < str1.length(); i++) {
      char currentChar = str1.charAt(i);
      Integer appearance = hashtable.get(currentChar);
      if (appearance != null) {
        hashtable.replace(currentChar, appearance + 1);
      } else {
        hashtable.put(currentChar, 1);
      }
    }

    for (int i = 0; i < str2.length(); i++) {
      char currentChar = str2.charAt(i);
      Integer appearance = hashtable.get(currentChar);
      if (appearance == null || appearance == 0) {
        return false;
      }
      hashtable.replace(str2.charAt(i), appearance - 1);
    }

    return true;
  }

  static void test(String str1, String str2, boolean expectedResult) {
    assert(isPermutation(str1, str2) == expectedResult): "Test failed with case. str1 = " + str1 + ", str2 = " + str2;
  }

  public static void main(String [] args) {
    test(null, null, true);
    test(null, "abc", false);
    test("abc", null, false);
    test("abcdeff", "fbadce", false);
    test("abcdeffff", "ffffbadce", true);
    test("abcdefffgh", "affbadce", false);
    System.out.println("All test passed");
  }
}
 
