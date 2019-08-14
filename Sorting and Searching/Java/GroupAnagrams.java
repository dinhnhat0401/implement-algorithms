import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;

class GroupAnagrams {
  static String rearrangeCharacters(String str) {
    char[] arr = str.toCharArray();
    Arrays.sort(arr);
    return new String(arr);
  }

  static void groupAnagrams(String [] array) {
    final HashMap<String, List<String>> map = new HashMap<>();
    for (String str : array) {
      final String sortedStr = rearrangeCharacters(str);
      List<String> list;
      if (!map.containsKey(sortedStr)) {
        list = new ArrayList<>();
        map.put(sortedStr, list);
      } else {
        list = map.get(sortedStr);
      }
      list.add(str);
    }

    int index = 0;
    System.out.println("map keyset = " + map.keySet());
    System.out.println("map values = " + map.values());
    for (List<String> value : map.values()) {
      for (String str : value) {
        array[index++] = str;
      }
    }
  }

  public static void main(String [] args) {
    String [] array = {"temper", "ak", "acat", "ka", "metper"};
    System.out.println(Arrays.toString(array));
    groupAnagrams(array);
    System.out.println(Arrays.toString(array));
  }
}

