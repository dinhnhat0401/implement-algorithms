import java.util.HashMap;

public class TwoSum {
  public int[] twoSum(int[] nums, int target) {
    int[] result = new int[2];

    // Build hashmap with key is element, value is index
    HashMap<Integer, Integer> hashMap = new HashMap<>();

    // One pass through nums
    for (int i = 0; i < nums.length; i++) {
      // If element exist in hashmap, return [index, currentIndex]
      if (hashMap.containsKey(nums[i])) {
        result[0] = hashMap.get(nums[i]);
        result[1] = i;
        return result;
      }
      // Else add (target - element, index) to hashmap
      hashMap.put(target - nums[i], i);
    }

    return result;
  }
}
