import java.util.HashSet;
import java.util.Deque;
import java.util.List;
import java.util.LinkedList;
import java.util.Set;

public class Graph {
  List<Node> nodes;

  // BFS
  boolean routeBetweenNodes(Node node1, Node node2) {
    Set<Node> visited = new HashSet<>();
    Deque<Node> queue = new LinkedList<>();

    // Add source node to queue
    queue.addLast(node1);

    // loop til queue is empty = we searched whole graph
    while(!queue.isEmpty()) {
      Node tmp = queue.removeFirst();
      if (tmp == node2) return true; // Found it
      visited.add(tmp);
      for (Node n : tmp.getAdjacent()) {
        if (!visited.contains(n)) {
          queue.addLast(n);
        }
      }
    }

    return false; // Not found, searched whole graph though 
  } 
}

class Node {
  private String name;
  private List<Node> adjacent;

  public Node(String name) {
    this.name = name;
  }

  public void setAdjacent(List<Node> adjacent) {
    this.adjacent = adjacent;
  }

  public List<Node> getAdjacent() {
    return this.adjacent;
  }
}

