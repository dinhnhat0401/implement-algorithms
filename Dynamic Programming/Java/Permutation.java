import java.util.ArrayList;
import java.util.List;
import java.util.HashSet;
import java.util.Set;

class Permutation {
  public static List<String> permutations(String str) {
    List<String> results = new ArrayList<>();
    if (str.length() == 1) {
      results.add(str);
      return results;
    }

    for (int i = 0; i < str.length(); i++) {
      String character = str.substring(i, i + 1);
      String before = str.substring(0, i);
      String after = str.substring(i + 1, str.length());
      System.out.println(character + ", " + before + ", " + after);

      List<String> tmp = permutations(before + after);
      for (String tmpString : tmp) {
        tmpString = tmpString.concat(character);
        System.out.println("tmpString = " + tmpString);
        results.add(tmpString);
      }
      System.out.println("result = " + results);
      System.out.println("-------");
    }
    return results;
  }

  // permutations for String with duplicated characters
  public static List<String> permutations2(String str) {
    List<String> results = new ArrayList<>();
    if (str.length() == 1) {
      results.add(str);
      return results;
    }

    Set<String> characters = new HashSet<>();

    for (int i = 0; i < str.length(); i++) {
      String character = str.substring(i, i + 1);
      if (characters.contains(character)) { System.out.println("duplicated found");continue; }
      else { characters.add(character); }
      String before = str.substring(0, i);
      String after = str.substring(i + 1, str.length());
      System.out.println(character + ", " + before + ", " + after);

      List<String> tmp = permutations2(before + after);
      for (String tmpString : tmp) {
        tmpString = tmpString.concat(character);
        System.out.println("tmpString = " + tmpString);
        results.add(tmpString);
      }
      System.out.println("result = " + results);
      System.out.println("-------");
    }
    return results;
  }

  public static void main(String [] args) {
    System.out.println(permutations("abc"));
    System.out.println(permutations2("aabc"));
  }
}

