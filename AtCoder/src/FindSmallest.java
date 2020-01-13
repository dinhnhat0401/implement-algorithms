import java.util.Arrays;
import java.util.Scanner;
import java.util.ArrayList;

public class FindSmallest {

  public static void main(String[] args) {
    String[] lines = getStdin();
    System.out.println(FindSmallest.findSmallest(lines[0]));
  }

  public static String findSmallest(String n) {
    // idea:
    // to be able to handle 100 digits numer, input format should be String
    // convert n to an array A of characters from 0 to 9
    // e.g: 10374 -> [1, 0, 3, 7, 4]
    // sort array A -> [0, 1, 3, 4, 7]
    // find the first non-zero character - index i
    // if i != 0
    // swap with the first character
    // convert array A back to a String and return it
    char[] arr = n.toCharArray();
    Arrays.sort(arr);

    if (arr[0] == '0') {
      int i = 0;
      while (i < arr.length) {
        if (arr[i] != '0') {
          break;
        }
        i += 1;
      }

      arr[0] = arr[i];
      arr[i] = '0';
    }

    return new String(arr);
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
