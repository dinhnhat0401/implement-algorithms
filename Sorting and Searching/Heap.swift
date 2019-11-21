import Foundation

class Heap {
  func buildMaxHeap(_ arr: [Int]) {
    for i in arr.count/2...1 {
      maxHeapify(arr, i)
    }
  }
  
  func maxHeapify(_ arr: [Int], _ i: Int) {
    while i <= arr.count {
      let l = left(i)
      let r = right(i)
      var largest = i

      if l <= arr.count && arr[l] > arr[i] {
        largest = l
      }

      if r <= arr.count && arr[r] > arr[i] {
        largest = r
      }

      if largest == i {
        break
      }

      arr.swapAt(largest, i)
      i = largest
    }
  }

  func left(_ i: Int) -> Int {
    return 2 * i
  }

  func right(_ i: Int) -> Int {
    return 2 * i + 1
  }
}

