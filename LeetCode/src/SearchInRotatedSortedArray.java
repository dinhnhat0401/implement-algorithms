public class SearchInRotatedSortedArray {
  public boolean search(int[] nums, int target) {
    if (nums.length == 0) return false; // return -1 if element doesn't exist

    int pivot = findPivot(nums, 0, nums.length - 1);
    if (target <= nums[nums.length - 1]) return binarySearch(nums, target, pivot, nums.length - 1);
    return binarySearch(nums, target, 0, pivot - 1);
  }

  private boolean binarySearch(int[] nums, int target, int lo, int hi) {
    boolean ans = false;
    while (hi >= lo) {
      int mid = lo + (hi - lo)/2;
      if (nums[mid] == target) return true;
      if (nums[mid] > target) {
        hi = mid - 1;
      } else {
        lo = mid + 1;
      }
    }
    return ans;
  }

  private int findPivot(int[] nums, int lo, int hi) {
    int pivot = 0;
    while (hi >= lo) {
      int mid = lo + (hi - lo)/2;
      if (nums[mid] < nums[nums.length - 1]) {
        pivot = mid;
        hi = mid - 1;
      } else if (nums[mid] > nums[nums.length - 1]) {
        lo = mid + 1;
      } else {
        if (hi == lo) return lo;
        int i = mid;
        while (i < hi && nums[i] <= nums[i + 1]) i++;
        if (i < hi) {
          if (nums[i] < nums[nums.length - 1]) return i;
          else {
            return i + 1;
          }
        } else {
          int j = mid;
          while (j > lo && nums[j] == nums[j - 1]) j--;
          hi = j;
        }
      }
    }

    return pivot;
  }
}
