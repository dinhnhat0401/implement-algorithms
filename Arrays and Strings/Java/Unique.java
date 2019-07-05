import java.util.Set;
import java.util.HashSet;

class Unique {
  static boolean isUnique(String str) {
    if (str == null || str.isEmpty()) return true;

    Set<Character> map = new HashSet<>();
    for (int i = 0; i < str.length(); i++) {
      char c = str.charAt(i);
      if (map.contains(c)) return false;
      
      map.add(c);
    }
    
    return true;
  }

  public static void main(String [] args) {
    String input1 = "acdabfgh";
    String input2 = "";
    String input3 = null;
    String input4 = "abcdef";

    assert(isUnique(input1) == false): "input 1 failed!";
    assert(isUnique(input2) == true): "input 2 failed!";
    assert(isUnique(input3) == true): "input 3 failed!";
    assert(isUnique(input4) == true): "input 4 failed!";
    
    System.out.println("Passed");
  }
}

