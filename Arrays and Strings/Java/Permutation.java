import java.util.Set;
import java.util.HashSet;

class Permutation {
  static boolean isPermutation(String str1, String str2) {
    if (str1 == null && str2 == null) return true;
    if ((str1 == null && str2 != null) || (str1 != null && str2 == null)) return false;

    Set<Character> hashTable = new HashSet<>();
    
    for (int i = 0; i < str1.length(); i++) {
      hashTable.add(str1.charAt(i));
    }

    for (int i = 0; i < str2.length(); i++) {
      if (!hashTable.contains(str2.charAt(i))) {
        return false;
      }
      hashTable.remove(str2.charAt(i));
    }

    return hashTable.isEmpty();
  }

  static void test(String str1, String str2, boolean expectedResult) {
    assert(isPermutation(str1, str2) == expectedResult): "Test failed with case. str1 = " + str1 + ", str2 = " + str2;
  }

  public static void main(String [] args) {
    test(null, null, true);
    test(null, "abc", false);
    test("abc", null, false);
    test("abcdef", "fbadce", true);
    test("abcdef", "fbadcegh", false);
    test("abcdefgh", "fbadce", false);
    System.out.println("All test passed");
  }
}
 
