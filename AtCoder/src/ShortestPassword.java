import java.util.Arrays;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Scanner;

public class ShortestPassword {

  public static void main(String[] args) {
    System.out.println(ShortestPassword.shortestPassword(args[0]));
  }

  public static int shortestPassword(String s) {
    // idea:
    // using two pointers technique, i = 0, j = 0
    // initialize a valid signs: ['@', '$', '%']
    // intialize a result variable to hold shortest password length
    // initizlie two hashtable to hold
    // current number of lower case alphabet: lower - key: c, value: number of occurences
    // current number of signs: sign
    // while j < s.length && i < s.length
    // if we found an invalid character
    // i = j + 1
    // j = j + 1
    // remove all data from lower and sign
    // continue
    // if current character is a sign
    // insert it into sign set
    // if current character is a lower case alphabet
    // insert it into lower set
    // if lower.keySet().size() >= 5 && sign.keySet().size() >= 1
    // update result = min(result, j - i + 1)
    // remove s.charAt(i) from lower or sign
    // increase i
    // continue HERE to see if we can find a shorter password than current one
    // increase j

    char[] signs = {'$', '%', '@'};
    int result = s.length() + 1;
    Hashtable<Character, Integer> sign = new Hashtable<>();
    Hashtable<Character, Integer> lower = new Hashtable<>();
    int i = 0;
    int j = 0;
    boolean skipInput = false;

    while (i < s.length() && j < s.length()) {
      char c = s.charAt(j);

      if (skipInput) {
        skipInput = false;
      } else {
        if (Arrays.binarySearch(signs, c) < 0 && (c < 'a' || c > 'z')) {
          i = j + 1;
          j = j + 1;
          continue;
        }

        if (Arrays.binarySearch(signs, c) >= 0) {
          if (sign.get(c) == null) {
            sign.put(c, 1);
          }  else {
            sign.put(c, sign.get(c) + 1);
          }
        } else {
          if (lower.get(c) == null) {
            lower.put(c, 1);
          }  else {
            lower.put(c, lower.get(c) + 1);
          }
        }
      }

      if (lower.keySet().size() >= 5 && sign.keySet().size() >= 1) {
        result = Math.min(result, j - i + 1);

        char x = s.charAt(i);
        if (Arrays.binarySearch(signs, x) >= 0) {
          if (sign.get(x) == 1) {
            sign.remove(x);
          } else {
            sign.put(x, sign.get(x) - 1);
          }
        } else {
          if (lower.get(x) == 1) {
            lower.remove(x);
          } else {
            lower.put(x, lower.get(x) - 1);
          }
        }

        i += 1;
        skipInput = true;
        continue;
      }

      j += 1;
    }

    return result;
  }

  private static String[] getStdin() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<String> lines = new ArrayList<>();
    while (scanner.hasNext()) {
      lines.add(scanner.nextLine());
    }
    return lines.toArray(new String[lines.size()]);
  }
}
