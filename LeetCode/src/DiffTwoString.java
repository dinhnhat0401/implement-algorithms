import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class DiffTwoString {

  static String[] diffBetweenTwoStrings(String source, String target) {
    Map<Character, List<Integer>> pos = new HashMap<>();
    for (int i = 0; i < target.length(); i++) {
      List<Integer> list = pos.getOrDefault(target.charAt(i), new ArrayList<>());
      list.add(i);
      pos.put(target.charAt(i), list);
    }

    int sP = 0;
    int tP = 0;
    List<String> res = new ArrayList<>();
    while (sP < source.length() && tP < target.length()) {
      Character sC = source.charAt(sP);
      Character tC = target.charAt(tP);
      if (sC == tC) {
        tP += 1;
        sP += 1;
        res.add(Character.toString(sC));
        continue;
      }

      if (getIndex(pos, sC, tP) != -1) {
        res.add("+" + tC);
        tP++;
      } else {
        res.add("-" + sC);
        sP++;
      }
    }

    while (sP < source.length()) {
      res.add("-" + source.charAt(sP));
      sP += 1;
    }

    while (tP < target.length()) {
      res.add("+" + target.charAt(tP));
      tP += 1;
    }

    return res.toArray(new String[0]);
  }

  /*

  Time Complexity: O(S.length * T.length), from our construction of dp.

Space Complexity: O(S.length * T.length), the space taken by dp.
*/
  //O(N)

  static int getIndex(Map<Character, List<Integer>> pos, Character c, int i) {
    List<Integer> list = pos.getOrDefault(c, new ArrayList<>());
    int l = 0;
    int r = list.size() - 1;
    int ans = -1;
    while (l <= r) {
      int mid = l + (r - l)/2;
      if (list.get(mid) > i) {
        r = mid - 1;
        ans = mid;
      } else {
        l = mid + 1;
      }
    }

    return ans;
  }

  // source = "ABCDEFG"
  // target = "ABDFFFFGH"
  // pos[A] = [0]
  // pos[C] = []
  // pos[E] = []
  // pos[G] = [7] , 7 > 4
  // ["A", "B", "-C", "D", "-E", "F", "+F", "G", "+H"]


  public static void main(String[] args) {
    String s = "ABCDEFG";
    String t = "ABDFFGH";
    for (String str : diffBetweenTwoStrings(s, t)) {
      System.out.print(str + ",");
    }

  }
}
