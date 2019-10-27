import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

public class GrayBinaryCode {
  public static void main(String [] args) {
    List<Integer> res = circularPermutation(3, 2);
    System.out.print(res);
  }

  public static List<Integer> circularPermutation(int n, int start) {
    List<Integer> grayCode = generateGrayCodeAsInteger(n, new HashMap<>());
    int i = grayCode.indexOf(start);
    List<Integer> result = grayCode.subList(i, grayCode.size());
    result.addAll(grayCode.subList(0, i));
    return result;
  }

  private static List<Integer> generateGrayCodeAsInteger(int n, HashMap<Integer, List<Integer>> dp) {
    if (dp.containsKey(n)) {
      return dp.get(n);
    }

    List<Integer> result = new ArrayList<>();

    if (n <= 0) {
      dp.put(0, result);
      return result;
    }

    if (n == 1) {
      result.add(0);
      result.add(1);
      dp.put(1, result);
      return result;
    }

    List<Integer> previousResult = generateGrayCodeAsInteger(n - 1, dp);
    result.addAll(previousResult);
    Collections.reverse(previousResult);
    for (Integer val: previousResult) {
      result.add((1<<(n - 1)) + val);
    }
    dp.put(n, result);
    return result;
  }

  private static List<String> generateGrayCode(int n, HashMap<Integer, List<String>> dp) {
    List<String> result = new ArrayList<>();
    if (n <= 0) {
      dp.put(0, result);
      return result;
    }
    if (n == 1) {
      result.add("0");
      result.add("1");
      dp.put(1, result);
      return result;
    }

    if (dp.containsKey(n)) {
      return dp.get(n);
    }

    List<String> previousResult = generateGrayCode(n - 1, dp);
    for (String str: previousResult) {
      result.add("0" + str);
    }

    Collections.reverse(previousResult);
    for (String str: previousResult) {
      result.add("1" + str);
    }

    dp.put(n, result);
    return result;
  }
}
