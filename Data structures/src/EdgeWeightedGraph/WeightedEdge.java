package EdgeWeightedGraph;

import java.util.*;

public class WeightedEdge {
  public static void main(String[] args) {

  }

  public int maxLength(List<String> arr) {
    HashMap<Set<Character>, List<String>> map = new HashMap<>();
    // Loop through each string
    for (String str : arr) {
      boolean belong = false; // if no, create a new set from those char
      // Loop through each character in string
      for (Character c : str.toCharArray()) {
        // check if it belong to any set
        Set<Character> set = belongToSet(map, c);
        if (set != null) {
          belong = true;

          // add all characters to set
          for (Character c1 : str.toCharArray()) {
            set.add(c1);
          }
          // add string to map as a new element in result list
          map.get(set).add(str);
          break;
        }
      }

      if (!belong) {
        Set<Character> set = new HashSet<>();
        for (Character c : str.toCharArray()) {
          set.add(c);
        }
        List<String> list = new LinkedList<>();
        list.add(str);
        map.put(set, list);
      }
    }

    int result = 0;
    for (List<String> list : map.values()) {

    }

    return 0;
  }

  private Set<Character> belongToSet(HashMap<Set<Character>, List<String>> map, Character c) {
    for (Set<Character> set : map.keySet()) {
      if (set.contains(c)) {
        return set;
      }
    }

    return null;
  }
}
