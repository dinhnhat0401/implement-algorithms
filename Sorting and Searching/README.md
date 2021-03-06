# Sorting algorithms

| Name | Worst-case  running time | Average - case/expected running time | Best-case running time | Space complexity | Stable | Algorithmic Paradigm |
|-|-|-|-|-|-|-|
| Bubble sort | O(n^2) | O(n^2) | O(n^2) | O(1) | Yes |
| Insertion sort | O(n^2) - the array is sorted in reverse order | O(n^2) | O (n) - the array is sorted | O(1) | Yes | Incremental Approach |
| Merge sort | O(nlogn) | O(nlogn) | O(nlogn) | O(n) - need an auxiliary array for merging two sorted arrays | Yes| Divide and Conquer |
| Quick sort | O(n^2) - when pivot is unbalanced | O(nlogn) | O(nlogn) - prove by using Master Theorem | O(n) - to store recursive function call - can make it O(logn) | No - standard implementation | Divide and Conquer | 
| Heap sort | O(nlogn) | O(nlogn) | O(nlogn) | O(n) | No - the order information lost during heap creation process | Heap Data structure |
| Count sort | O(n+k) - assume the input contains n intergers in range [0,k] | O(n+k) | O(n+k) | O(n+k) | Yes | Count sort - Random access by using value - also have application with union-find | 

### TODOs

+ implement external sorting
https://www.geeksforgeeks.org/external-sorting/
+ revisit 10.7

