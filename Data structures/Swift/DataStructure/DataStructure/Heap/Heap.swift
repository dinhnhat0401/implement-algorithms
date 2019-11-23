import Foundation

class Heap {
  
  init(_ arr: [Int]) {
    self.arr = arr
    self.heapSize = arr.count
  }

  func buildMaxHeap() {
    for i in stride(from: heapSize/2, through: 0, by: -1) {
      maxHeapify(i)
    }
  }
  
  func maxHeapify(_ i: Int) {
    var i = i
    while i < heapSize {
      let l = left(i)
      let r = right(i)
      var largest = i

      if l < heapSize && arr[l] > arr[i] {
        largest = l
      }

      if r < heapSize && arr[r] > arr[largest] {
        largest = r
      }

      if largest == i {
        break
      }

      arr.swapAt(largest, i)
      i = largest
    }
  }

  func heapSort() {
    while heapSize > 0 {
      arr.swapAt(0, heapSize - 1)
      heapSize -= 1
      maxHeapify(0)
    }
  }

  // MARK: - private methods

  var arr: [Int]
  private var heapSize: Int

  // MARK: - private functions

  private func left(_ i: Int) -> Int {
    return 2 * i + 1
  }

  private func right(_ i: Int) -> Int {
    return 2 * i + 2
  }
}
