## Implemented data structures

### LinkedList

## How to run

### Java files

### Objective-C files

Assume your folder is constructed as below:

```
-rw-r--r--   1 admin  staff    344 Jul 13 18:19 IANode.h
-rw-r--r--   1 admin  staff   1194 Jul 13 18:39 IANode.m
-rw-r--r--   1 admin  staff    533 Jul 13 17:52 RemoveDups.m
```

You want to run a `main` function in `RemoveDups.m` file:

```
gcc -c IANode.m
gcc -o RemoveDups.o IANode.o  RemoveDups.m -framework Foundation
./RemoveDups
```

### Implemented algorithms

1. Topological sort

Approach 1: find the source nodes, remove them from the Graph
Approach 2: use DFS to find the destination nodes, remove them from the Graph if no other nodes refer to them. Add the node to a Stack.
Traverse stack to get the nodes

