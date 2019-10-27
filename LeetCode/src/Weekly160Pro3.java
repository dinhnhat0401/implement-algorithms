// https://leetcode.com/contest/weekly-contest-160/problems/maximum-length-of-a-concatenated-string-with-unique-characters/

import java.util.*;

public class Weekly160Pro3 {
  public static void main(String[] args) {
    String [] arr = {"un","iq","ue"};

    System.out.println(new Weekly160Pro3().maxLength(Arrays.asList(arr)));
  }

  public int maxLength(List<String> arr) {
    List<HashSet<Character>> dp = new ArrayList<>();
    dp.add(new HashSet<>());

    for (String str : arr) {
      HashSet<Character> strSet = getSetFromString(str);

      if (str.length() != strSet.size()) {
        continue;
      }

      for (Object combination : dp.toArray()) {
        if (!Collections.disjoint(strSet, (HashSet<Character>)combination)) continue;
        HashSet<Character> newSet = new HashSet<>();
        newSet.addAll(strSet);
        newSet.addAll((HashSet<Character>)combination);
        dp.add(newSet);
      }
    }

    int max = 0;
    for (HashSet<Character> hashSet : dp) {
      if (max < hashSet.size()) { max = hashSet.size(); }
    }

    return max;
  }

  private HashSet<Character> getSetFromString(String str) {
    HashSet<Character> hashSet = new HashSet<Character>();
    for (Character c : str.toCharArray()) hashSet.add(c);
    return hashSet;
  }
}
