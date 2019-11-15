class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        
        if m > n {
            return findMedianSortedArrays(nums2, nums1)
        }

        var l = 0
        var r = m
        while l <= r {
            let i = l + (r - l)/2
            let j = (m + n + 1)/2 - i
            
            if j > 0 && i < m && nums2[j - 1] > nums1[i] {
                l = i + 1
            } else if i > 0 && j < n && nums1[i - 1] > nums2[j] {
                r = i - 1
            } else {
                var maxLeft = 0
                if i == 0 {
                    maxLeft = nums2[j - 1]
                } else if j == 0 {
                    maxLeft = nums1[i - 1]
                } else {
                    maxLeft = max(nums1[i - 1], nums2[j - 1])
                }
                
                if (m + n) % 2 == 1 {
                    return Double(maxLeft)
                }
                
                var minRight = 0
                if i == m {
                    minRight = nums2[j]
                } else if j == n {
                    minRight = nums1[i]
                } else {
                    minRight = min(nums1[i], nums2[j])
                }
                
                return Double(maxLeft + minRight) / 2.0
            }
        }
        
        return 0.0
    }
}

//https://leetcode.com/problems/median-of-two-sorted-arrays/
